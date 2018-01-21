package kr.co.coffee.common;

import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;

public class pagingUtil {
public static final int pageSize = 5;

public static Paging getPaging(Search search,int totalCount) {
	Paging paging = new Paging();
	
	int rowSize =10 ;
	int currentPage=search.getCurrentPage();
	int pageSize=5; 
	
	int startCount = (currentPage -1)* rowSize;
	int endCount = (currentPage * rowSize);
	int startPage = 0;
	int endPage = 0;
	int totalPageSize= totalCount / rowSize;
	if(totalCount%rowSize > 0 ) {
		totalPageSize++;
	}
	startPage = ((currentPage - 1) / pageSize)*10+1;
	endPage = startPage + pageSize -1;
	if(endPage > totalPageSize) {
		endPage = totalPageSize;
	}
	paging.setStartCount(startCount);
	paging.setEndCount(endCount);
	paging.setTotalPageSize(totalPageSize);
	paging.setTotalCount(totalCount);
	paging.setPageSize(pageSize);
	paging.setCurrentPage(currentPage);
	paging.setRowSize(rowSize);
	paging.setStartPage(startPage);
	paging.setEndPage(endPage);
	
	
	return paging;
}
	
	
}
