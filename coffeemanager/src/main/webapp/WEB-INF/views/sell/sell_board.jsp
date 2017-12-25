<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <head>
    <meta charset="utf-8">
	<!--
		Date: 2017-12-24
		작성자 : 김영섭
		내용 : bootstrap에 datetimepicker 설정
	-->
    <title>sell</title>
    <!-- Bootstrap -->
	<link rel="stylesheet" href="resources/dist/css/bootstrap.css">
	 <link href="/resources/dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="/resources/dist/js/bootstrap.js"></script>
	<script src="../bootstrap-3.3.2/dist/js/bootstrap.min.js"></script>
	<script src="/resources/dist/js/moment-with-locales.min.js"></script>
	<script src="/resources/dist/js/bootstrap-datetimepicker.min.js"></script>	  
  </head>
  <body>
		<div class="container">
			<div class="container">
				<h3>
					<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
					판매관리
				</h3>
			</div>
			<div class="container">
				<form class="form-inline">
					<div class="form-group">
					
					<label for="seachCodeAndName">검색 : </label>
						<div class="btn-group">
						      <select class="btn btn-default" data-toggle="dropdown" name="판매코드">
								<option>메뉴명</option>
								<option>판매코드</option>
							</select>
						
					</div>	
						<input type="text" class="form-control" id="sell_search">
						<button class="btn btn-success" type="submit">Search</button>	
						<div class="form-group">
							<label for="seachCodeAndName">&nbsp검색 시작일 :</label>
						       <div class='input-group date' id='datetimepicker1'>
								  <input type='text' class="form-control"/>
								  <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								  </span>
							   </div>
							&nbsp; ~ &nbsp; 
							 <label for="seachCodeAndName">&nbsp 검색 종료일 :</label>
						       <div class='input-group date' id='datetimepicker2'>
								  <input type='text' class="form-control"/>
								  <span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								  </span>
							   </div>							
						</div>
					</div>
				</form>
			</div>
			    <script type="text/javascript">
				  $(function () {
					$('#datetimepicker1').datetimepicker({
						format : 'YYYY/MM/DD'
					});
					  
					  $('#datetimepicker2').datetimepicker({
						  format : 'YYYY/MM/DD'
					  });
				  });
        </script>	
			<div class="col-lg-12 col-xs-12 col-md-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>판매코드</th>
						<th>판매일자</th>
						<th>메뉴코드</th>
						<th>메뉴명</th>
						<th>판매수량</th>
						<th>판매가격</th>
					</tr>
				</thead>	
				<tbody>
				<c:forEach var="list" items="${sellList }">
					<tr>
					<!-- 
						private String sell_CD;
						private Date sell_Date;
						private String menu_CD;
						private String menu_Name;
						private int sell_CNT;
						private int total_SP;
					 -->
						<td>${list.sell_CD }</td>
						<td>${list.sell_Date }</td>
						<td>${list.menu_CD }</td>
						<td>${list.menu_Name }</td>
						<td>${list.sell_CNT }</td>
						<td>${list.total_SP }</td>
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
		<div></div>
  </body>
</html>
</body>
</html>