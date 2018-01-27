package kr.co.coffee.stock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class searchCriteria extends Criteria{
	private String searchType;
	private String searchKeyword;
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
		/*try {
			this.searchKeyword = URLDecoder.decode(searchKeyword, "UTF-8");
			System.out.println("test"+searchKeyword);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("에러");
		}*/
		this.searchKeyword = searchKeyword;
	}

}
