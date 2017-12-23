package kr.co.coffee.stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class stockController {
	@RequestMapping(value="/stock",method=RequestMethod.GET)
	public String stockPage(Model model) {
		
		model.addAttribute("content", "stock/stock.jsp");
		return "main";			
	}
}
