package kr.co.coffee.common.domain;

import java.util.Date;

public class Search {
	private int searchDiv;
	private String searchValue;
	private Date startDate;
	private Date endDate;
	private int currentPage;
	private int startCount;
public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getSearchDiv() {
		return searchDiv;
	}
	public void setSearchDiv(int searchDiv) {
		this.searchDiv = searchDiv;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
	
	
}
