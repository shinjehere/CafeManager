package kr.co.coffee.sell.service;

import java.util.List;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.sell.domain.SellList;
/**
 * 
 * @author 김영섭
 * @since 2017.12.26
 * SellService
 *
 */
public interface SellService {

		public List<SellList> getSellList(Search search) throws Exception;
		
		public int getTotalCount(Search search) throws Exception;

}
