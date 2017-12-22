<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/dist/css/bootstrap.css">
  </head>
  <body>
		<div class="container">
			<div class="container">
				<h3>
					<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
					판매관리
				</h3>
			</div>
			
			<form>
				<input >
			</form>
			
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
					<tr>
						<td>se0000001</td>
						<td>2017.12.21</td>
						<td>mn0000001</td>
						<td>아메리카노</td>
						<td>1</td>
						<td>1500</td>
					</tr>
						<tr>
						<td>se0000002</td>
						<td>2017.12.21</td>
						<td>mn0000002</td>
						<td>라떼</td>
						<td>1</td>
						<td>2000</td>
					</tr>
						<tr>
						<td>se0000003</td>
						<td>2017.12.21</td>
						<td>mn0000001</td>
						<td>아메리카노</td>
						<td>1</td>
						<td>1500</td>
					</tr>
						<tr>
						<td>se0000004</td>
						<td>2017.12.21</td>
						<td>mn0000001</td>
						<td>아메리카노</td>
						<td>3</td>
						<td>4500</td>
					</tr>
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
				<button type="button" class="btn btn-info">신규등록</button>
			</div>
		</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins)META-INF/resources/webjars/jquery/3.2.1/jquery.js --> 
	<script src="resources/dist/js/jquery-3.2.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="resources/dist/js/bootstrap.js"></script>
  </body>
</html>