package kr.co.coffee.stock.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coffee.stock.dao.StockDAO;
import kr.co.coffee.stock.domain.StockList;

@Repository("stockDAO")
public class StockDAOImpl implements StockDAO{

	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<StockList> selectStockList() throws Exception {
		return sqlSession.selectList("selectStockList");
	}

}

