package kr.co.coffee.sell.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coffee.common.DTO;
import kr.co.coffee.sell.dao.SellDAO;
import kr.co.coffee.sell.domain.SellList;
/**
 * 
 * @author 김영섭
 * @since 2017.12.26
 * SellDAOImpl create
 */
@Repository("sellDAO")
public class SellDAOImpl implements SellDAO{
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<SellList> getSellList() throws Exception {
		
		return sqlSession.selectList("getSellList");
	}

	@Override
	public int do_save(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<?> do_search(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int do_delete(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_update(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_excelDown(List<?> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_excelUp(List<?> list) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
