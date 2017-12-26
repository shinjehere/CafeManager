package kr.co.coffee.stock.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.coffee.stock.domain.StockList;

public interface StockDAO{
	public List<StockList> selectStockList() throws Exception;
}

