package kr.co.coffee.sell.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.sell.domain.SellInsVO;
import kr.co.coffee.sell.domain.SellListVO;
/**
 * 
 * @author 源��쁺�꽠
 * @since 2017.12.26
 * SellService
 *
 */

public interface SellService {

		public List<SellListVO> getSellList(Search search) throws Exception;
		
		public int getTotalCount(Search search) throws Exception;
		
		public List<SellListVO> detail_Sell(String togggle_value) throws Exception;
		
		public List<MenuVO> menu_search(String menu_SH) throws Exception;
		
		public String search_insert_code(String codeSE) throws Exception;
		
		public void sell_insert(SellInsVO sellInsVO) throws Exception;
		
		public void SLDeleteChecked(List<String> deleteArray) throws Exception;
}
