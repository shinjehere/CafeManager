<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="/coffee/resources/css/menu/menu.css">

<!-- 메뉴 js 파일 -->
<script type="text/javascript" src="/coffee/resources/js/menu.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="resources/dist/css/bootstrap.css"
	rel="stylesheet">
<link href="resources/dist/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/dist/js/jquery-3.2.1.js"></script>
<script src="resources/dist/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/dist/js/bootstrap.js"></script>
<script src="resources/dist/js/bootstrap.min.js"></script>
<script src="resources/dist/js/moment-with-locales.min.js"></script>
<script src="resources/dist/js/bootstrap-datetimepicker.min.js"></script>


<!-- 데이트피커를 위한 css와 js -->
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script> -->
</head>

<body>
	<!-- 엑셀 다운로드를 위한 form -->
	<form name="excel_frm" action="do_excelDown" method="post">
		<input type="hidden" id="e_menu_cd" name="menu_cd">
		<input type="hidden" id="e_menu_name" name="menu_name">
		<input type="hidden" id="e_menu_up" name="menu_up">
		<input type="hidden" id="e_menu_sp" name="menu_sp">
		<input type="hidden" id="e_mn_reg_dt" name=mn_reg_dt>
		<input type="hidden" id="e_mn_mod_dt" name="mn_mod_dt">
		<input type="hidden" id="e_searchDiv" name="searchDiv">
	</form>
	<div class="container">
		<div class="container">
			<h3>
				<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
				메뉴관리
			</h3>
		</div>
		<div class="container">
			<form id="searchForm" class="form-inline">
				<input type="hidden" id="currentPage" name="currentPage" value="1">
				<div class="form-group">
					<label for="seachCodeAndName">검색 : </label>
					<div class="btn-group">
						<select class="btn btn-default" data-toggle="dropdown"
							name="searchDiv">
							<option value="1" selected="selected">메뉴명</option>
							<option value="2">메뉴코드</option>
						</select>
					</div>
					<input type="text" class="form-control" id="searchValue"
						name="searchValue" placeholder="Search">
					<button class="btn btn-success" type="button" id="searchBtn">Search</button>
					<!-- <div class="form-group">
						<label for="seachCodeAndName">&nbsp검색 시작일 :</label>
						<div class="input-group date">
							<input type="text" id="start_date" name="start_date"
								class="form-control" /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
						&nbsp; ~ &nbsp; <label for="seachCodeAndName">&nbsp 검색 종료일
							:</label>
						<div class="input-group date">
							<input type="text" id="end_date" name="end_date"
								class="form-control" /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div> -->
				</div>
			</form>
		</div>

		<div class="col-lg-12 col-xs-12 col-md-12">
			<table id="menu_list_table" class="table table-striped recruit">
				<thead id="menu_list_thead">
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
				</tbody>
			</table>
		</div>
		<div class="pagination text-center">
			<ul class="pagination" id="pagination"></ul>
		</div>

		<div class="text-left">
			<button type="button" class="btn btn-danger" id="deleteBtn">선택삭제</button>
		</div>
		<div class="text-right">
			<button id="do_excelDown" type="button" class="btn btn-danger">엑셀 다운로드</button>
			<button id="new_sell" type="button" class="btn btn-info"
				onclick="javascript:new_menu()">신규등록</button>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">신규메뉴등록</h4>
						</div>
						<form>
							<div class="controller">
								<div class="modal-body col-md-12 col-xs-12 col-lg-12 col-sm-12">
									<div class="form-group" style="margin: 10px;">
										<div class="row input-group">
											<span class="input-group-addon">메뉴명 : </span> <input
												type="text" placeholder="등록할 메뉴 이름을 입력하세요"
												class="form-control" id="menuName"
												onkeypress="if(event.keyCode==25) {checkMenuName(); return false;}" maxlength="25">
											<span class="input-group-btn">
												<button class="btn btn-warning" type="button"
													id="btnCheckMenu" onclick="javascript:checkMenuName()">중복확인</button>
											</span>
										</div>
									</div>
									<div class="form-group" style="margin: 10px;">
										<div class="row input-group">
											<span class="input-group-addon"> 메뉴 단가 : </span> <span
												id="menuUnitPrice" class="form-control " disabled="disabled" ></span>
											<span class="input-group-addon"> 메뉴 판매가 : </span> <input
												type="number" placeholder="판매할 가격을 입력하세요" class="form-control onlyNumber" maxlength="11">
										</div>
									</div>
									<div class="form-group" style="margin: 10px;">
										<div class="row input-group">
											<span class="input-group-addon">원재료명 : </span> <input
												type="text" placeholder="검색할 원재료명을 입력하세요"
												class="form-control" id="searchIngdnt" maxlength="25"
												onkeypress="if(event.keyCode==25) {searchIngredient(); return false;}">
											<span class="input-group-btn">
												<button class="btn btn-warning" type="button"
													id="btnSearchIngdnt"
													onclick="javascript:searchIngredient()">검색</button>
											</span>
										</div>
									</div>
									<table id="menu_table" class="table table-bordered table-hover"
										style="margin: 30px 0 30px 0;">
										<thead>
											<tr>
												<th>원재료코드</th>
												<th>원재료명</th>
												<th>단가</th>
												<th>1단위 용량</th>
												<th>단위</th>
											</tr>
										</thead>
										<tbody id="menu_tbody">
										</tbody>
									</table>
									<div class="form-group">
										<div class="row">
											<div class="col-md-12">
												<div class="input-group">
													<span class="input-group-addon"> 원재료코드 : </span> <span
														class="form-control" id="ing_click_code"></span> <span
														class="input-group-addon"> 원재료명 : </span> <span
														class="form-control" id="ing_click_name"></span><span
														class="input-group-addon"> 1단위 가격 : </span> <span
														class="form-control" id="ing_unit_price"></span> <span
														class="input-group-addon"> 사용할 용량 : </span> <input
														class="form-control" id="menuUnitAmount" type="number"
														min="0"> <span class="input-group-btn">
														<button type="reset" id="rest_x"
															onclick="javascript:reset();" class="btn btn-default">X</button>
													</span>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-8"></div>
									<div class="col-md-4 text-right">
										<div class="row input-group">
											<span class="form-control" id="calMenuClick" disabled="disabled"></span> <span
												class="input-group-btn">
												<button class="btn" type="button"
													onclick="javascript:calMenuUP();">메뉴 단가 계산</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary"
								onclick="javascript:save_sell()">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>