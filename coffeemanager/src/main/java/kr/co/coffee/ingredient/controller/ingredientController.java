package kr.co.coffee.ingredient.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.ingredient.service.IngredientService;
import kr.co.coffee.sell.domain.SellListVO;

@Controller
public class ingredientController {
	@Autowired
	private IngredientService ingredientService;
	
	@Resource(name="downloadView")
	private View downloadView;
	
	@RequestMapping(value="/ingredient",method=RequestMethod.GET)
	public String ingredientPage(Model model) {
		
		model.addAttribute("content", "ingredient/ingredient.jsp");
		return "main";			
	}
	@RequestMapping(path="/ingredient/list")
	@ResponseBody
	public Map<String, Object> ingredient_list(Search search) throws Exception{
		System.out.println(search.getSearchDiv());
		int totalcount=ingredientService.ingredient_totalcount(search);
		System.out.println("totalcount:"+totalcount);
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		List<IngredientVO> list=ingredientService.ingredient_list(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);		
		return map;
	}
	@RequestMapping(path="/ingredient/update")
	public String ingredient_update(IngredientVO vo) throws Exception{
		System.out.println(vo.getIng_cd());
		ingredientService.ing_update(vo);
		return "redirect:/ingredient";
	}
	
	@RequestMapping(path="/ingredient/insert")
	public String ingredient_insert(IngredientVO vo) throws Exception{
		System.out.println(vo.getIng_price()+":"+vo.getIng_nm()+":"+vo.getIng_unit()+":"+vo.getUnit_amount());
		Date today=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyyMMdd");
		String todayString=dateFormat.format(today);
		String madeCode="IN"+todayString;
		String getCode=ingredientService.insert_search(madeCode);
		if(getCode==null||getCode=="") {
			madeCode+="001";
			System.out.println("if null:"+madeCode);
			vo.setIng_cd(madeCode);
			ingredientService.ing_insert(vo);
		}else {
			String backIntString=getCode.substring(getCode.length()-3, getCode.length());
			int intString=Integer.parseInt(backIntString);
			intString+=1;
			String backCode=String.format("%03d%n", intString);
			System.out.println("backCode:"+backCode);
			madeCode+=backCode;
			System.out.println("if else:"+madeCode);
			vo.setIng_cd(madeCode.trim());
			ingredientService.ing_insert(vo);
		}
		return "redirect:/ingredient";
	}
	@RequestMapping(path="ingredient/delete",method=RequestMethod.DELETE, consumes="application/json")
	@ResponseBody
	public Map<String, Object> deleteForm(@RequestBody String[] ingArray) throws Exception{
		ArrayList<String> deleteArray = new ArrayList<String>();
		for(String data : ingArray) {
			deleteArray.add(data);
			System.out.println("deleteList:"+data);
		}
			ingredientService.ing_delete(deleteArray);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("url", "ingredient");
		return map;
	}
	
	@RequestMapping(path="ingredient/sell_excel_down", method=RequestMethod.POST)
	public ModelAndView sell_excel_down(Search search) throws Exception{
		int totalcount=ingredientService.ingredient_totalcount(search);
		System.out.println("startdate:"+search.getStartDate()+"enddate"+search.getEndDate());
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		List<IngredientVO> list=ingredientService.ingredient_list(search);

		System.out.println("excel_list"+list);
		String  fileFullPath=ingredientService.ing_excelDown(list);
		ModelAndView mav=new ModelAndView();
		mav.setView(downloadView);
		File downloadFile= new File(fileFullPath);
		mav.addObject("downloadFile", downloadFile);
		return mav;
	}
}
