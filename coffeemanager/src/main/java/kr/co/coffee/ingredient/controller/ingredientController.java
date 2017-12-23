package kr.co.coffee.ingredient.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ingredientController {
	@RequestMapping(value="/ingredient",method=RequestMethod.GET)
	public String ingredientPage(Model model) {
		
		model.addAttribute("content", "ingredient/ingredient.jsp");
		return "main";			
	}
}
