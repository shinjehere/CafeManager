package kr.co.coffee.main.service;

import java.util.List;

import kr.co.coffee.main.domain.MainVO;
import kr.co.coffee.sell.domain.SellListVO;
import kr.co.coffee.stock.domain.StockList;

public interface MainService {
	public List<StockList> selectStockGraph() throws Exception;
	
	public List<SellListVO> selectMenuGraph() throws Exception;
	
	public List<MainVO> selectSellGraph() throws Exception;
	
	public List<MainVO> selectDayGraph() throws Exception;

}
