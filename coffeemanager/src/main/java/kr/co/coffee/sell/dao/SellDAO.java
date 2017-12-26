package kr.co.coffee.sell.dao;

import java.util.List;

import kr.co.coffee.common.WorkDiv;
import kr.co.coffee.sell.domain.SellList;
/**
 * 
 * @author kim
 * @since 2017.12.26
 * sellDAO 등록
 *
 */
public interface SellDAO extends WorkDiv {

	public List<SellList> getSellList() throws Exception;
}
