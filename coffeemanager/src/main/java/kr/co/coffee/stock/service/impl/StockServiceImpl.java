package kr.co.coffee.stock.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.IngredientList;
import kr.co.coffee.stock.domain.NewProductList;
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
		return CommonMapper.listCriteria(cri);
	}

	@Override
	public Integer totalCount() throws Exception {
		return CommonMapper.TotalCount();
	}

	@Override
	public List<IngredientList> searchIngredient(String searchIngredient) throws Exception {
		return CommonMapper.searchIngredient(searchIngredient);
	}

	@Override
	public String searchNewCode(String codeNP) throws Exception {
		return CommonMapper.searchNewCode(codeNP);
	}

	@Override
	public void ingredientInsert(NewProductList newProduct) throws Exception {
		CommonMapper.ingredientInsert(newProduct);
		
	}
	

/*@Repository("stockDAO")
public class StockDAOImpl implements StockDAO{

	@Autowired
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
*/



}
