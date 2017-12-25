package kr.co.coffee.sell.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.coffee.sell.dao.SellDAO;
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
	
	@Resource(name="sellDAO")
	private SellDAO sellDAO;

	
	@Override
	public List<SellList> getSellList() throws Exception {

		return sellDAO.getSellList();
	}
	
	
	

}
