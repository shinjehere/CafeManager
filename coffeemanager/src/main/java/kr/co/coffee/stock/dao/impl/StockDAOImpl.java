package kr.co.coffee.stock.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.coffee.stock.dao.StockDAO;
import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.StockList;

@Repository("stockDAO")
public class StockDAOImpl implements StockDAO{

	/*@Autowired*/
	@Inject
	private SqlSession sqlSession;
	
	final static String NAMESPACE = "kr.co.coffee.stock.domain";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<StockList> selectStockList() throws Exception {
		return sqlSession.selectList("selectStockList");
	}

	@Override
	public List<StockList> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList("listCriteria",cri);
	}

	@Override
	public Integer TotalCount() throws Exception {
		return sqlSession.selectOne("getTotalCount");
	}

}

