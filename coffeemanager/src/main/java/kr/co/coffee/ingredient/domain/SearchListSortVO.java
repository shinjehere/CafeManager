package kr.co.coffee.ingredient.domain;

import kr.co.coffee.common.domain.Search;

public class SearchListSortVO extends Search {
	private String SortValue;

	public String getSortValue() {
		return SortValue;
	}

	public void setSortValue(String sortValue) {
		SortValue = sortValue;
	}
	
}
