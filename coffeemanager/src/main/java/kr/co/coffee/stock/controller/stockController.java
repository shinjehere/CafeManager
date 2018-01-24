package kr.co.coffee.stock.controller;

import java.net.URLDecoder;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.IngredientList;
import kr.co.coffee.stock.domain.NewProductList;
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
			list.get(i).setSt_total_Price((nf.format((int)(Float.parseFloat(list.get(i).getSt_total_Price())))));
			
		}
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("stockList", list);
		model.addAttribute("cri",cri);

		model.addAttribute("content", "stock/stock_board.jsp");

		return "main";
	}
	//재고 검색
	@RequestMapping(path="stock/stockSearch",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> stockSearch(String searchCondition) throws Exception{
		
		
		return null;
	}
	
	@RequestMapping(path="stock/stockPopup", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ingredientList(String searchIngredient) throws Exception {
		searchIngredient = URLDecoder.decode(searchIngredient, "UTF-8");
		
		System.out.println("검색 결과: "+searchIngredient);
		
		List<IngredientList> list = stockService.searchIngredient(searchIngredient);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping(path="stock/income", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> stockInsert(HttpServletRequest request) throws Exception{
		String selectCode=request.getParameter("select_cd");
		int selectCount=Integer.parseInt(request.getParameter("select_count"));
		System.out.println("선택한 값:"+selectCode+",수량:"+selectCount);
		NewProductList newProduct = new NewProductList();
		newProduct.setIng_CD(selectCode); //원재료 코드
		newProduct.setNewpd_CNT(selectCount); //수량
	
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss"); //입고 시간
		String todayDate = dateFormat.format(today);
		newProduct.setNewpd_DATE(todayDate);
		//입고코드
		String cdDate = todayDate.substring(0, 8); 
		String incomeCode = "NP"+cdDate;
		String getNewCode = stockService.searchNewCode(incomeCode).trim();//가장최근 코드
		
		System.out.println("코드:"+getNewCode);
		if(getNewCode==null||getNewCode=="") {
			incomeCode+="001";
			newProduct.setNewpd_CD(incomeCode.trim());
			stockService.ingredientInsert(newProduct);
		}else {
			String lastCode = getNewCode.substring(getNewCode.length()-3, getNewCode.length());
			int conversionInt = Integer.parseInt(lastCode);
			conversionInt+=1; //가장최근 코드의 뒤에 세자리에 1을 증가시킨다. 
			String backCode=String.format("%03d%n", conversionInt);
			
			incomeCode+=backCode;
			newProduct.setNewpd_CD(incomeCode.trim());
			stockService.ingredientInsert(newProduct);
			
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		String url="stock";
		map.put("url", url);
				
				
		return map;
	}
	
	
}



