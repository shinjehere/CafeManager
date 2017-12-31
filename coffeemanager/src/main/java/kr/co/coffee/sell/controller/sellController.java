package kr.co.coffee.sell.controller;

import java.sql.SQLDataException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.xmlbeans.impl.jam.mutable.MMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;

import ch.qos.logback.classic.Logger;
import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.sell.domain.SellList;
import kr.co.coffee.sell.service.SellService;

/**
 * @since 2017-12-26
 * @author 김영섭
 * SellController
 * 
 */
@Controller
@RequestMapping(path="/sell")
public class sellController {
	
	@Autowired
	private SellService sellService;
	/**
	 * @author 김영섭
	 * @param model
	 * @return main
	 * @throws Exception
	 * sellService추가하여 초기 디비 생성
	 * 아래 주석은 실험 처리
	 * 
	 */
	/*@ResponseBody */
	@RequestMapping
	public @ResponseBody ModelAndView sellBoard(@RequestParam(defaultValue="1") int searchDiv,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="1") int currentPage) throws Exception {
		Search search=new Search();
		search.setCurrentPage(currentPage);
		search.setSearchDiv(searchDiv);
		search.setSearchValue(searchValue);
		int totalcount=sellService.getTotalCount(search);
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		
		List<SellList> list=sellService.getSellList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		map.put("search", search);
		ModelAndView mav=new ModelAndView("jsonView");
		mav.setViewName("main");
		mav.addObject("content","sell/sell_board.jsp");
		mav.addObject("map", map);
		/*mav.addObject("content", "sell/sell_board.jsp");*/
	/*	mav.addObject("list", list);
		mav.addObject("paging", paging);*/
		System.out.println(search.getCurrentPage()+":"+search.getSearchDiv()+":"
				+search.getSearchValue()+":"+search.getStartCount());
		System.out.println(list.size()+":"+list+":"+paging);	
		return mav;
	}

}
