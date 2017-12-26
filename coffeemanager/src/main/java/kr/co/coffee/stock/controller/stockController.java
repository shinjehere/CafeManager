package kr.co.coffee.stock.controller;



import java.text.NumberFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.coffee.stock.domain.StockList;
import kr.co.coffee.stock.service.StockService;

@Controller
public class stockController {
	//Service 영역의 접근을 위한 선언
	@Resource(name="stockService")
	private StockService stockService;
	
	@RequestMapping(value="/stock",method=RequestMethod.GET)
	public String stockList(Model model) throws Exception,NumberFormatException	{
		List<StockList> list = stockService.selectStockList();
		
		//가격 세자리마다 , 처리
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		//최대 자리수
		nf.setMaximumIntegerDigits(10);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setSt_total_Price((nf.format(Integer.parseInt(list.get(i).getSt_total_Price()))));
			
		}
		
		model.addAttribute("stockList", list);
		model.addAttribute("content", "stock/stock_board.jsp");

		return "main";
	
	}
}



