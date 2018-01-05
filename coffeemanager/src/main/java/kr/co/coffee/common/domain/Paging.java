package kr.co.coffee.common.domain;

public class Paging {
	/**
	 * 1페이지 row 수
	 */
	private int rowSize;
	/**
	 * 페이지 사이즈
	 */
	private int pageSize;
	/**
	 * 목록 전체 갯수
	 */
	private int totalCount;
	/**
	 * 페이징 시작 페이지
	 */
	private int startPage;
	/**
	 * 페이징 끝 페이지
	 */
	private int endPage;
	/**
	 * 페이징 총 갯수
	 */
	private int totalPageSize;
	/**
	 * 페이징 현재 페이지
	 */
	private int currentPage;
	/**
	 * 페이징 (limit 시작값)
	 */
	private int startCount;
	/**
	 * 페이징 (limit 종료값)
	 */
	private int endCount;
	public int getRowSize() {
		return rowSize;
	}
	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPageSize() {
		return totalPageSize;
	}
	public void setTotalPageSize(int totalPageSize) {
		this.totalPageSize = totalPageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	
	
}
