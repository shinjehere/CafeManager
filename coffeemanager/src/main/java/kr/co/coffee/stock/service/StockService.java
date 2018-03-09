package kr.co.coffee.stock.service;

import java.util.List;

import kr.co.coffee.common.DTO;
import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.IngredientList;
import kr.co.coffee.stock.domain.NewProductList;
import kr.co.coffee.stock.domain.StockList;
import kr.co.coffee.stock.domain.searchCriteria;

public interface StockService {
	public List<StockList> selectStockList() throws Exception;
	
	//페이징 처리 서비스 메소드
	public List<StockList> listCriteria(Criteria cri) throws Exception;
	
	//전체 게시글 수 구하기
	public Integer totalCount() throws Exception;
	
	public List<IngredientList> searchIngredient(String searchIngredient) throws Exception;
	
	//최근 코드 구하기
	public String searchNewCode(String codeNP) throws Exception;
	
	//입고
	public void ingredientInsert(NewProductList newProduct) throws Exception;
	
	//재고 검색
	public List<StockList> listSearchCriteria(searchCriteria cri) throws Exception;
	
	public Integer searchBoardTotalCount(searchCriteria cri) throws Exception;		
	
/*	//엑셀 서치
	public List<StockList> stock_searchExcel(DTO dto) throws Exception;
	*/
	//엑셀 다운
	public String stock_excelDown(List<StockList> list) throws Exception;

	
}
