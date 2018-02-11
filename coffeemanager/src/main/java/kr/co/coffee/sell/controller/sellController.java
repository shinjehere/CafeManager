package kr.co.coffee.sell.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;


import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.sell.domain.SellInsVO;
import kr.co.coffee.sell.domain.SellListVO;
import kr.co.coffee.sell.domain.SellOrderVO;
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
	
	@Resource(name="downloadView")
	private View downloadView;
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
	public @ResponseBody Map<String, Object> sellList(SellOrderVO search) throws Exception {
		int totalcount=sellService.getTotalCount(search);
		System.out.println("startdate:"+search.getStartDate()+"enddate"+search.getEndDate()+"serarchsdfkl"+search.getSortValue());
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		List<SellListVO> list=sellService.getSellList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		return map;
	}
	/**
	 * @author 김영섭
	 * Json방식
	 * 상세페이지 보여주기(토글에 뿌려주기)
	 */
	@RequestMapping(path="/{togggle_value}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> detail_Sell(@PathVariable String togggle_value) throws Exception{
		List<SellListVO> list=sellService.detail_Sell(togggle_value);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(path="/menuSearch",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> menuSearch(String search_text) throws Exception{
		List<MenuVO> list=sellService.menu_search(search_text);
	
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	@RequestMapping(path="/new",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sellInsert(HttpServletRequest request) throws Exception{
		String click_code=request.getParameter("click_code");
		int click_count=Integer.parseInt(request.getParameter("click_count"));
		System.out.println(click_code+":"+click_count);
		SellInsVO sellInsVO=new SellInsVO();
		sellInsVO.setClick_code(click_code);
		sellInsVO.setClick_count(click_count);
		Date today=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyyMMdd");
		String todayString=dateFormat.format(today);
		System.out.println(sellInsVO);
		String codeSL="SL"+todayString;
		String getCode=sellService.search_insert_code(codeSL);
		System.out.println("getCode:"+getCode);
		if(getCode==null||getCode=="") {
			codeSL+="001";
			System.out.println("if null:"+codeSL);
			sellInsVO.setCode_SL(codeSL.trim());
			sellService.sell_insert(sellInsVO);
		}else {
			String backIntString=getCode.substring(getCode.length()-3, getCode.length());
			System.out.println("backIntString:"+backIntString);
			System.out.println("backIntString+1:"+backIntString+1);
			int intString=Integer.parseInt(backIntString);
			intString+=1;
			System.out.println("intString:"+intString);
			
			String backCode=String.format("%03d%n", intString);
			System.out.println("backCode:"+backCode);
			codeSL+=backCode;
			System.out.println("if else:"+codeSL);
			sellInsVO.setCode_SL(codeSL.trim());
			sellService.sell_insert(sellInsVO);
		}
		Map<String, Object> map=new HashMap<String, Object>();
		String url="sell";
		map.put("url", url);
		return map;
	}
	
	// 메뉴 선택 삭제
	@RequestMapping(value = "/sellDel", method = RequestMethod.DELETE, consumes="application/json")
	@ResponseBody
	public Map<String, Object> deleteMenu(@RequestBody String[] sellCDArray) throws Exception {
		
		ArrayList<String> deleteArray = new ArrayList<String>();
		
		for (String data : sellCDArray) {
			deleteArray.add(data);
			System.out.println("deleteList:"+data);
		}
		System.out.println("deleteList:"+sellCDArray);
		sellService.SLDeleteChecked(deleteArray);
		

		System.out.println("deleteArray = "+deleteArray);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("url", "sell");
		return map;
	}

	@RequestMapping(path="/sell_excel_down", method=RequestMethod.POST)
	public ModelAndView sell_excel_down(Search search) throws Exception{
		int totalcount=sellService.getTotalCount(search);
		System.out.println("startdate:"+search.getStartDate()+"enddate"+search.getEndDate());
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		List<SellListVO> list=sellService.getSellList(search);

		System.out.println("excel_list"+list);
		String  fileFullPath=sellService.se_excelDown(list);
		ModelAndView mav=new ModelAndView();
		mav.setView(downloadView);
		File downloadFile= new File(fileFullPath);
		mav.addObject("downloadFile", downloadFile);
		return mav;
	}
}
