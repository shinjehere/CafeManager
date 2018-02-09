package kr.co.coffee.sell.domain;

import kr.co.coffee.common.domain.Search;

public class SellOrderVO extends Search {
	private String SortValue;

	public String getSortValue() {
		return SortValue;
	}

	public void setSortValue(String sortValue) {
		SortValue = sortValue;
	}
	
	
}
