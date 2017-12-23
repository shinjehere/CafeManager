package kr.co.coffee.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class menuController {
	@RequestMapping(value="/menu", method=RequestMethod.GET)
	public String menuPage(Model model) {
		
		model.addAttribute("content", "menu/menu.jsp");
		return "main";
	}

}
