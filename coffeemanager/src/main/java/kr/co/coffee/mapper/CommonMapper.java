package kr.co.coffee.mapper;

import java.util.List;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.sell.domain.SellList;
import kr.co.coffee.stock.domain.StockList;

public interface CommonMapper {

	public List<SellList> getSellList(Search search) throws Exception;
	public List<StockList> selectStockList() throws Exception;
	public int getTotalCount(Search search) throws Exception;
	public List<MenuVO> do_searchAll(Search search) throws Exception;
	public int menuTotalCount(Search search) throws Exception;
	/*test*/
	
}
