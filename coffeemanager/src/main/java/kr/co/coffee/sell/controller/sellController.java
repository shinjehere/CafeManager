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
	 * form 형식에서 ajax로 변경
	 * 
	 */
	/*@ResponseBody */
	/*
	 * 기본 jsp 보여주기
	 * 
	 */
	@RequestMapping
	public @ResponseBody ModelAndView sellBoard() throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("main");
		mav.addObject("content","sell/sell_board.jsp");
		return mav;
	}
	/**
	 * @author 김영섭
	 * @param search
	 * @return map
	 * @throws Exception
	 * ajax를 통한 Json 방식으로  변경
	 * 주소창에 sell/sell이 나오지는 않음, 크롬 개발자도구를 통해 받는 것을 확인할 수 있음
	 */
	@RequestMapping(path="/sell", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> sellList(Search search) throws Exception {
		int totalcount=sellService.getTotalCount(search);
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		List<SellList> list=sellService.getSellList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		return map;
	}
	/**
	 * @author 김영섭
	 * 상세페이지 보여주기(토글에 뿌려주기)
	 */
	@RequestMapping(path="/{togggle_value}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> detail_Sell(@PathVariable String togggle_value) throws Exception{
		List<SellList> list=sellService.detail_Sell(togggle_value);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

}
