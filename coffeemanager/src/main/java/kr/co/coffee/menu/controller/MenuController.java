package kr.co.coffee.menu.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
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

	// 메뉴 리스트 조회
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

	// 메뉴 정보 불러오기
	@RequestMapping(path = "/{menuCodeOnClick}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> menuDetail(@PathVariable String menuCodeOnClick) throws Exception {
		List<MenuVO> list = menuSvc.menuDetail(menuCodeOnClick);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		return map;
	}

	// 원재료 리스트 불러오기
	@RequestMapping(path = "/{searchIngredientName}", method = RequestMethod.GET)
	@ResponseBody
	public List<IngredientVO> getIngredientList(@PathVariable String searchIngredientName) throws Exception {
		List<IngredientVO> list = menuSvc.getIngredientList(searchIngredientName);

		return list;
	}

	// 메뉴 선택 삭제
	@RequestMapping(value = "menuDel", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteMenu(@RequestParam(value = "checkArray[]") List<Integer> deleteList,
			@ModelAttribute("MenuVO") MenuVO menuVO, ModelMap model) throws Exception {

		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for (int i = 0; i < deleteList.size(); i++) {
			deleteArray.add(deleteList.get(i));
		}
		
		menuSvc.deleteChecked(deleteArray);

		return "redirect:/menu";
	}
}
