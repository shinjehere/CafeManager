package kr.co.coffee.sell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	 * 
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String sellPage(Model model) throws Exception {
		model.addAttribute("sellList", sellService.getSellList());
		model.addAttribute("content", "sell/sell_board.jsp");
		return "main";
	}
/*	@RequestMapping(method=RequestMethod.GET)
	public String sellList(Model model) throws Exception{
		
	
		return "sell/sell_board";
	}*/
	

}
