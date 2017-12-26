package kr.co.coffee.stock.service;

import java.util.List;

import kr.co.coffee.stock.domain.StockList;

public interface StockService {
	public List<StockList> selectStockList() throws Exception;
}
