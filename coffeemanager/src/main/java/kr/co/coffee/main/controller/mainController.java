package kr.co.coffee.main.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.coffee.main.domain.MainVO;
import kr.co.coffee.main.service.MainService;
import kr.co.coffee.sell.domain.SellListVO;
import kr.co.coffee.stock.domain.IngredientList;
import kr.co.coffee.stock.domain.StockList;

@Controller
public class mainController {
	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String mainPage(Model model) throws Exception,NumberFormatException {
		List<StockList> list = mainService.selectStockGraph();
		List<SellListVO> mlist = mainService.selectMenuGraph();
		List<MainVO> plist = mainService.selectSellGraph();
		List<MainVO> dlist = mainService.selectDayGraph();
		
		for(int i=0; i<dlist.size(); i++) {	
			dlist.get(i).setHour((Integer.parseInt(dlist.get(i).getHour())+9)+":00");
		}
		
		model.addAttribute("dlist", dlist);
		model.addAttribute("plist", plist);
		model.addAttribute("slist", list);
		model.addAttribute("mlist", mlist);
		model.addAttribute("content", "main/chart.jsp");
		return "main";
	}
	

	
}
