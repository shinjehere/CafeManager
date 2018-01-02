package kr.co.coffee.stock.service;

import java.util.List;

import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.StockList;

public interface StockService {
	public List<StockList> selectStockList() throws Exception;
	//페이징 처리 서비스 메소드
	public List<StockList> listCriteria(Criteria cri) throws Exception;
	//전체 게시글 수 구하기
	public Integer totalCount() throws Exception;
}
