<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stock/stock_board.css"> 
<title>Cafe Manager</title>
</head>
<body>

	<div class="container container_wrap">
		<div class="container">
		 	<h3><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 재고 관리</h3>
		</div>	
		<div class="container">
				<form class="form-inline">
					<div class="form-group">
					
					<label for="seachCodeAndName">검색 : </label>
						<div class="btn-group">
						      <select class="btn btn-default" data-toggle="dropdown" name="판매코드">
								<option>품목명</option>
								<option>재고코드</option>
							</select>
						
					</div>	
						<input type="text" class="form-control" id="sell_search">
						<button class="btn btn-success" type="submit">Search</button>	
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
				<tbody>
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
				<li><a href="#">Prev</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">Next</a></li>
			  </ul>
			</div>
			
			<div class="text-right">
				<button type="button" class="btn btn-danger">엑셀 다운로드</button>
				<button type="button" class="btn btn-info">신규등록</button>
			</div>
		</div>
	<script src="resources/dist/js/jquery-3.2.1.min.js"></script>
	<script src="resources/dist/js/bootstrap.js"></script>
</body>
</html>