package kr.co.coffee.sell.service;

import java.util.List;

import kr.co.coffee.sell.domain.SellList;
/**
 * 
 * @author 김영섭
 * @since 2017.12.26
 * SellService
 *
 */
public interface SellService {

		public List<SellList> getSellList() throws Exception;
}
