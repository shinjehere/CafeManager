package kr.co.coffee.sell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class sellController {
	@RequestMapping(value="/sell", method=RequestMethod.GET)
	public String sellPage(Model model) {
		
		model.addAttribute("content", "sell/sell_board.jsp");
		return "main";
	}

}
