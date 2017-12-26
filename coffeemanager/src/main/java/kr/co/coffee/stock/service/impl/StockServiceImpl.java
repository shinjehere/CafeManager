package kr.co.coffee.stock.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.coffee.stock.dao.StockDAO;
import kr.co.coffee.stock.domain.StockList;
import kr.co.coffee.stock.service.StockService;

@Service("stockService")
public class StockServiceImpl implements StockService{
	//데이터 접근을 위한 DAO 객체 선언
	@Resource(name="stockDAO")
	private StockDAO stockDAO;
	
	@Override
	public List<StockList> selectStockList() throws Exception {
		return stockDAO.selectStockList();
	}

}
