package kr.co.coffee.stock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class searchCriteria extends Criteria{
	private String searchType; //검색조건
	private String searchKeyword; //검색 키워드
	private String searchSort; //정렬
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
	
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchSort() {
		return searchSort;
	}
	public void setSearchSort(String searchSort) {
		this.searchSort = searchSort;
	}
	

}
