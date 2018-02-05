package kr.co.coffee.ingredient.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
