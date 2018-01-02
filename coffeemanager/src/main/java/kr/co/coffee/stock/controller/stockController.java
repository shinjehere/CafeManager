package kr.co.coffee.stock.controller;



import java.text.NumberFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.PageMaker;
import kr.co.coffee.stock.domain.StockList;
import kr.co.coffee.stock.service.StockService;

@Controller
public class stockController {
	//Service 영역의 접근을 위한 선언
	@Resource(name="stockService")
	private StockService stockService;
	@RequestMapping(value="/stock",method=RequestMethod.GET)
	public String stockList(@ModelAttribute("cri") Criteria cri,Model model) throws Exception,NumberFormatException	{
		//커맨드 객체로 Criteria를 매개변수로 넣어주고, 넘어오는 page와 perPageNum 정보를 받는다.
		//해당 cri를 이용해서 service->dao->mapper.xml 순으로 접근하면서 DB처리
		//cri 전달된 현재 페이지 정보를 기준으로 VO 객체를 담은 ArrayList 반환
		
		List<StockList> list = stockService.listCriteria(cri);

		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		Integer totalNum = stockService.totalCount();
		pageMaker.setTotalCount(totalNum);
		
		//가격 세자리마다 , 처리
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		//최대 자리수
		nf.setMaximumIntegerDigits(10);
		for(int i=0; i<list.size(); i++) {
		
			list.get(i).setSt_total_Price((nf.format(Integer.parseInt(list.get(i).getSt_total_Price()))));
			
		}
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("stockList", list);
		model.addAttribute("cri",cri);

		model.addAttribute("content", "stock/stock_board.jsp");

		return "main";
	
	}
	
/*	@RequestMapping(value="/stock",method=RequestMethod.GET)
	public String stockList(Model model) throws Exception,NumberFormatException	{
		//커맨드 객체로 Criteria를 매개변수로 넣어주고, 넘어오는 page와 perPageNum 정보를 받는다.
		//해당 cri를 이용해서 service->dao->mapper.xml 순으로 접근하면서 DB처리
		//cri 전달된 현재 페이지 정보를 기준으로 VO 객체를 담은 ArrayList 반환
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
	
	}*/
}



