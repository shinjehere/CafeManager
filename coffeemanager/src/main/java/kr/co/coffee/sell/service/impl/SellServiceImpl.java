package kr.co.coffee.sell.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.sell.domain.SellList;
import kr.co.coffee.sell.service.SellService;

/**
 * 
 * @author 김영섭
 * @since 2017.12.26
 * SellServiceImpl implements SellService
 */
@Service("sellService")
public class SellServiceImpl implements SellService{
	
	@Autowired
	private CommonMapper CommonMapper;

	@Override
	public List<SellList> getSellList(Search search) throws Exception {
		return CommonMapper.getSellList(search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return CommonMapper.getTotalCount(search);
	}

	@Override
	public List<SellList> detail_Sell(String togggle_value) throws Exception {
		
		return CommonMapper.detail_Sell(togggle_value);
	}

}
