package kr.co.coffee.menu.controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.menu.service.MenuSvc;

/**
 * 2017-12-26 메뉴 컨트롤러
 * 
 * @author SHINJE KIM
 */
@Controller
@RequestMapping(path = "/menu")
public class MenuController {

	@Autowired
	private MenuSvc menuSvc;

	@RequestMapping
	public @ResponseBody ModelAndView menuBoard() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("content", "items/menu.jsp");

		return mav;
	}

	@RequestMapping(path = "/menu", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> menuList(Search search) throws Exception {
		int totalCount = menuSvc.menuTotalCount(search);
		Paging paging = pagingUtil.getPaging(search, totalCount);
		search.setStartCount(paging.getStartCount());
		List<MenuVO> list = menuSvc.do_searchAll(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);

		return map;
	}

}
