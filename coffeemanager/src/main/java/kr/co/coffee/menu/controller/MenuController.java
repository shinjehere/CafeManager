package kr.co.coffee.menu.controller;

import java.io.File;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import org.springframework.web.servlet.View;

import kr.co.coffee.common.StringUtil;
import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.menu.service.MenuSvc;
import kr.co.coffee.sell.domain.SellListVO;

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

	@Resource(name = "downloadView")
	private View downloadView;

	@RequestMapping
	public @ResponseBody ModelAndView menuBoard() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("content", "items/menu.jsp");

		return mav;
	}

	// 메뉴&레시피 인서트
	@RequestMapping(path = "/insertMenu", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertMenu(HttpServletRequest req) throws Exception {

		String menu_name = req.getParameter("menuName");
		String menu_sp = req.getParameter("sellPrice");
		String menu_up = req.getParameter("calMenuClick");

		MenuVO menuVO = new MenuVO();
		menuVO.setMenu_name(menu_name);
		menuVO.setMenu_sp(menu_sp);
		menuVO.setMenu_up(menu_up);

		System.out.println("menu_name값이 넘어갑니까: "+menu_name);
		System.out.println("ingCodeArray값이 넘어갑니까: "+req.getParameter("ingCodeArray"));
		
		String[] ingCodeArray = (req.getParameter("ingCodeArray").replaceAll("\"", "").replace("[", "").replace("]", "")).split(",");
		System.out.println("ingCodeArray:  "+ingCodeArray[0].toString());
		
		String[] menuAmountArray = (req.getParameter("menuAmountArray").replaceAll("\"", "").replace("[", "").replace("]", "")).split(",");
		System.out.println("menuAmountArray:  "+menuAmountArray[0].toString());
		
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String todayString = dateFormat.format(today);

		String menu_cd = "MN" + todayString;
		String getCode = menuSvc.searchMenuCode(menu_cd);

		System.out.println("getCode = "+getCode);
		
		if( getCode == null || getCode == "") {
			menu_cd += "001";
			menuVO.setMenu_cd(menu_cd.trim());
			menuSvc.insertMenu(menuVO);
			
			// RECIPIE 테이블 인서트
			for (int i = 0; i < ingCodeArray.length; i++) {

				menuVO.setIng_cd(ingCodeArray[i]);
				System.out.println("ingCodeArray[i]= "+ingCodeArray[i]);

				menuVO.setMenu_amount(menuAmountArray[i]);
				System.out.println("menuAmountArray[i]= "+menuAmountArray[i]);
				menuSvc.insertRecipie(menuVO);
			}
		}else {
			String backIntString=getCode.substring(getCode.length()-3, getCode.length());
			
			int intString=Integer.parseInt(backIntString);
			intString+=1;
			
			String backCode=String.format("%03d%n", intString);
			menu_cd += backCode;
			menuVO.setMenu_cd(menu_cd.trim());
			menuSvc.insertMenu(menuVO);
			
			System.out.println("backCode= "+backCode);
			
			// RECIPIE 테이블 인서트
			for (int i = 0; i < ingCodeArray.length; i++) {
		
				menuVO.setIng_cd(ingCodeArray[i]);
				System.out.println("ingCodeArray[i]= "+ingCodeArray[i]);
				
				menuVO.setMenu_amount(menuAmountArray[i]);
				System.out.println("menuAmountArray[i]= "+menuAmountArray[i]);
				menuSvc.insertRecipie(menuVO);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		String url = "menu";
		map.put("url", url);
		
		return map;
	}


	// 엑셀 다운
	@RequestMapping(value = "/do_excelDown", method = RequestMethod.POST)
	public ModelAndView do_searchExcel(HttpServletRequest req) throws Exception {

		Hashtable<String, String> searchParam = new Hashtable<String, String>();
		ModelAndView mav = new ModelAndView();
		MenuVO menuVO = new MenuVO();

		String menu_cd = StringUtil.nvl(req.getParameter("menu_cd"), "");
		String menu_name = StringUtil.nvl(req.getParameter("menu_name"), "");
		String menu_up = StringUtil.nvl(req.getParameter("menu_up"), "");
		String menu_sp = StringUtil.nvl(req.getParameter("menu_sp"), "");
		String mn_reg_dt = StringUtil.nvl(req.getParameter("mn_reg_dt"), "");
		String mn_mod_dt = StringUtil.nvl(req.getParameter("mn_mod_dt"), "");

		searchParam.put("menu_cd".toString(), menu_cd);
		searchParam.put("menu_name".toString(), menu_name);
		searchParam.put("menu_up".toString(), menu_up);
		searchParam.put("menu_sp".toString(), menu_sp);
		searchParam.put("mn_reg_dt".toString(), mn_reg_dt);
		searchParam.put("mn_mod_dt".toString(), mn_mod_dt);

		menuVO.setParam(searchParam);

		List<MenuVO> list = menuSvc.do_searchExcel(menuVO);
		String fileFullPath = this.menuSvc.do_excelDown(list);

		mav.setView(this.downloadView);
		File downloadFile = new File(fileFullPath);
		mav.addObject("downloadFile", downloadFile);

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
	@RequestMapping(path = "/searchIngdnt", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getIngredientList(String searchIngredientName) throws Exception {
		List<IngredientVO> list = menuSvc.getIngredientList(searchIngredientName);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

	// 메뉴 선택 삭제
	@RequestMapping(value = "/menuDel", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteMenu(@RequestParam(value = "deleteMenuArray") List<String> deleteList,
			@ModelAttribute("MenuVO") MenuVO menuVO, ModelMap model) throws Exception {

		ArrayList<String> deleteArray = new ArrayList<String>();
		for (int i = 0; i < deleteList.size(); i++) {
			deleteArray.add(deleteList.get(i));
		}

		menuSvc.deleteChecked(deleteArray);

		return "redirect:/menu";
	}

	// 메뉴명 중복확인
	@RequestMapping(value = "/do_checkMenuName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> do_checkMenuName(String menuName) throws Exception {
		int flag = 0;
		flag = menuSvc.do_checkMenuName(menuName);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		return map;
	}

}
