<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <link rel="stylesheet" type="text/css" href="/coffee/resources/css/menu/menu.css">
  <script type="text/javascript" src="/coffee/resources/js/menu.js"></script>
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
						<select class="btn btn-default" data-toggle="dropdown" name="메뉴코드">
							<option>메뉴명</option>
							<option>메뉴코드</option>
						</select>

					</div>
					<input type="text" class="form-control" id="sell_search">
					<button class="btn btn-success" type="submit">Search</button>
					<div class="form-group">
						<label for="seachCodeAndName">&nbsp검색 시작일 :</label>
						<div class='input-group date' id='start_date'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
						&nbsp; ~ &nbsp; <label for="seachCodeAndName">&nbsp 검색 종료일
							:</label>
						<div class='input-group date' id='end_date'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="col-lg-12 col-xs-12 col-md-12">
			<table id="menu_list" class="table table-striped">
				<thead id="menu_thead">
					<tr>
						<th><input type="checkbox" id="allCheck" /></th>
						<th>메뉴코드</th>
						<th>메뉴명</th>
						<th>단가(원)</th>
						<th>판매가(원)</th>
						<th>등록일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${MenuVO }">
						<tr>
							<td><input type="checkbox" /></td>
							<td>${list.menu_cd }</td>
							<td>${list.menu_name }</td>
							<td>${list.menu_up }</td>
							<td>${list.menu_sp }</td>
							<td>${list.mn_reg_dt }</td>
							<td>${list.mn_mod_dt }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="text-center">
			<ul class="pagination" class="pagination-sm"></ul>
		</div>

		<div class="text-right">
			<button type="button" class="btn btn-danger">엑셀 다운로드</button>
			<button type="button" class="btn btn-info">신규등록</button>
		</div>
	</div>

</body>
</html>