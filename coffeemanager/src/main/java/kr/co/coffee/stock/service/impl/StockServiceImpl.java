package kr.co.coffee.stock.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.StockList;
import kr.co.coffee.stock.service.StockService;

@Service("stockService")
public class StockServiceImpl implements StockService{
	//데이터 접근을 위한 Mapper 객체 선언
@Autowired
private CommonMapper CommonMapper;

	@Override
	public List<StockList> selectStockList() throws Exception {
		return CommonMapper.selectStockList();
	}

	@Override
	public List<StockList> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer totalCount() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
