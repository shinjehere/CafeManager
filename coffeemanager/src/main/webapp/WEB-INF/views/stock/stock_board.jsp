<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stock/stock_board.css"> 
<script src="${pageContext.request.contextPath}/resources/js/stock/stock_board.js"></script> 

 <%@include file="./stock_modal.jsp" %> 

</head>

<body>
	<form name="stock_excel_frm" action="stock_excelDown" method="post">
		<input type="hidden" id="e_stock_cd" name="stock_cd">
		<input type="hidden" id="e_ing_cd" name="ing_cd">
		<input type="hidden" id="e_ing_nm" name="ing_nm">
		<input type="hidden" id="e_stock_cnt" name="stock_cnt">
		<input type="hidden" id="e_stock_price" name="stock_price">
	</form>

	<div class="container container_wrap">
		<div class="container">
		 	<h3><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 재고 관리</h3>
		</div>	
		<div class="container row">
				<form class="form-inline" method="get" action="${path}/coffee/stock">
					<div class="form-group col-sm-10">
						<label for="seachCodeAndName">검색 : </label>
							<div class="btn-group">
							    <select class="btn btn-default"  data-toggle="dropdown" name="searchType" >
									<option value="a" <c:out value="${pageMaker.cri.searchType == null?'selected' : '' }"/>>---</option>
									<option value="n" <c:out value="${pageMaker.cri.searchType == 'n'?'selected' : '' }"/>>품목명</option>
									<option value="c" <c:out value="${pageMaker.cri.searchType == 'c'?'selected' : '' }"/>>재고코드</option>
								</select>
							</div>	
							<input type="text" name="searchKeyword"  value="${pageMaker.cri.searchKeyword}" class="form-control">
							<button type="submit" class="btn btn-success" id="searchBtn">검색</button>	
					</div>
				
					 <div class="btn-group col-sm-2" >
						<select type="submit" class="btn btn-default"  id="search_sort" data-toggle="dropdown" name="searchSort" onchange="this.form.submit();">
							<option value="d" <c:out value="${pageMaker.cri.searchSort == null?'selected' : '' }"/>>등록일순</option>
							<option value="s" <c:out value="${pageMaker.cri.searchSort == 's'?'selected' : '' }"/>>재료명순</option>
							<option value="p" <c:out value="${pageMaker.cri.searchSort == 'p'?'selected' : '' }"/>>가격순</option>
						</select>
					 </div>
				 </form>
				 
				 
			</div>

			<div class="col-lg-12 col-xs-12 col-md-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th> </th>
						<th>재고코드</th>
						<th>원재료코드</th>
						<th>원재료명</th>
						<th>수량</th>
						<th>총단가</th>
					</tr>
				</thead>	
				<tbody >
				<c:forEach var="list" items="${stockList }">
				  	<tr>
				  		<td><input type="checkbox" name="chk_info" ></td>	
						<td>${list.stock_CD }</td>
						<td>${list.ing_CD }</td>
						<td>${list.ing_NM }</td>
						<td>${list.stock_CNT }</td>
						<td>${list.st_total_Price } 원</td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
			</div>
			
			<div class="text-center">
			  <ul class="pagination">

				<c:if test ="${pageMaker.prev }">
					<li><a href="../coffee/stock${pageMaker.makeSearch(pageMaker.startPage - 1) }">Prev</a></li>
				</c:if>
				 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
			        <li><a href="../coffee/stock${pageMaker.makeSearch(index) }">${index }</a></li>
			     </c:forEach>
				 <c:if test="${pageMaker.next }">
			        <li>
			            <a href="../coffee/stock${pageMaker.makeSearch(pageMaker.endPage + 1) }">Next</a>
			        </li>
			    </c:if>

			  </ul>
			</div>
			
			<div class="text-right">
				<button id="stock_excelDown" type="button" class="btn btn-danger">엑셀 다운로드</button>			
				<button type="button" class="btn btn-info btn" data-toggle="modal" data-target="#myModal">신규등록</button>
		
			</div>
		
		</div>

</body>
</html>