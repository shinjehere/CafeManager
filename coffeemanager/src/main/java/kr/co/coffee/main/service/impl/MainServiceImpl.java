package kr.co.coffee.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.main.domain.MainVO;
import kr.co.coffee.main.service.MainService;
import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.sell.domain.SellListVO;
import kr.co.coffee.stock.domain.StockList;

@Service("mainService")
public class MainServiceImpl implements MainService{

@Autowired
private CommonMapper CommonMapper;
	
	@Override
	public List<StockList> selectStockGraph() throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.selectStockGraph();
	}

	@Override
	public List<SellListVO> selectMenuGraph() throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.selectMenuGraph();
	}

	@Override
	public List<MainVO> selectSellGraph() throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.selectSellGraph();
	}

	@Override
	public List<MainVO> selectDayGraph() throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.selectDayGraph();
	}

}
