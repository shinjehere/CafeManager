package kr.co.coffee.menu.controller;

import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.menu.service.MenuSvc;

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

	@RequestMapping(method = RequestMethod.GET)
	public String menuPage(Model model) throws Exception, NumberFormatException {

		List<MenuVO> list = menuSvc.do_searchAll();

		// 가격 세자리마다 , 처리
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		// 최대 자리수
		nf.setMaximumIntegerDigits(11);

		for(int i=0; i<list.size();i++) {
			list.get(i).setMenu_up(nf.format(Integer.parseInt(list.get(i).getMenu_up())));
			list.get(i).setMenu_sp(nf.format(Integer.parseInt(list.get(i).getMenu_sp())));
		}
		
		model.addAttribute("MenuVO", list);
		model.addAttribute("content", "items/menu.jsp");

		return "main";
	}

}
