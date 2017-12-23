package kr.co.coffee.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class testcontroller {

	@RequestMapping("/main")
	public String main() {
		System.out.println("??");
		return "main";
	}

/*	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home() {
		System.out.println("??33");
		return "home";
	}*/
}
