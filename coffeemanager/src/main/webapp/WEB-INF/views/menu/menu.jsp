<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 메뉴 js 파일 -->
<script type="text/javascript" src="/coffee/resources/js/menu.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/dist/js/jquery-3.2.1.js"></script>
<script src="resources/dist/js/jquery-3.2.1.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/dist/js/bootstrap.js"></script>
<script src="resources/dist/js/bootstrap.min.js"></script>

<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

//datepicker
var old_jquery = jQuery.noConflict();
old_jquery(function() {
	old_jquery("#startDate").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});
	old_jquery("#endDate").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});
});
</script>

</head>

<body>
	<!-- 엑셀 다운로드를 위한 form -->
	<form name="excel_frm" action="do_excelDown" method="post">
		<input type="hidden" id="e_menu_cd" name="menu_cd">
		<input type="hidden" id="e_menu_name" name="menu_name">
		<input type="hidden" id="e_menu_up" name="menu_up">
		<input type="hidden" id="e_menu_sp" name="menu_sp">
		<input type="hidden" id="e_mn_reg_dt" name=mn_reg_dt>
	</form>
	<div style="text-align:left;" class="container">
		<div class="container">
			<h3>
				<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
				메뉴관리
			</h3>
		</div>
		<div style="margin: 1%; display: inline-block;" class="container">
			<form id="searchForm" class="form-inline">
				<input type="hidden" id="currentPage" name="currentPage" value="1">
				<div style="width:60%;" class="form-group">
					<label display: inline-block;" for="seachCodeAndName">　검색 : </label>
					<div class="btn-group">
						<select  class="btn btn-default" data-toggle="dropdown"
							name="searchDiv">
							<option value="1" selected="selected">메뉴명</option>
							<option value="2">메뉴코드</option>
						</select>
					</div>
					<input type="text"
								class="form-control" name="searchValue"
								onkeypress="if(event.keyCode==13) {btnEnter(); return false;}"
								placeholder="Search">
							<button style="display: inline-block;" id="searchBtn" class="btn btn-success" type="button">Search</button>
						</div>
						
						<div class="btn-group col-sm-2" >
						<select type="submit" class="btn btn-default"  id="search_sort" data-toggle="dropdown" name="searchSort" onchange="this.form.submit();">
							<option value="d" <c:out value="${pageMaker.cri.searchSort == null?'selected' : '' }"/>>등록일순</option>
							<option value="n" <c:out value="${pageMaker.cri.searchSort == 'n'?'selected' : '' }"/>>메뉴명순</option>
							<option value="p" <c:out value="${pageMaker.cri.searchSort == 'p'?'selected' : '' }"/>>판매가순</option>
						</select>
					 </div>
						
					</div>
				    <div class='col-md-6'>
					    <div style="text-align:left;" class="row">
							<div style="margin:1%; display:inline-block;" class="form-group">
								　　검색 기간 :
					            <input  style="display:inline-block; width: 30%;" type='text' class="form-control" name="startDate" id='startDate' />
					            ~
					            <input style="display:inline-block; width: 30%;" type='text' class="form-control" name="endDate" id='endDate' />
							</div>
					</div>		
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
			<button id="do_excelDown" type="button" class="btn btn-danger" >엑셀 다운로드</button>
			<button id="new_sell" type="button" class="btn btn-info"
				onclick="javascript:new_menu()">신규등록</button>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" id="btnClose" onclick="javascript:resetForm()">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 align="left" class="modal-title" id="myModalLabel" ><strong>신규메뉴등록</strong></h4>
						</div>
						<p align="right" >가격 단위: 원</p>
						<form id="newMenuForm" name="newMenuForm" class="newMenuForm">
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
											<span class="input-group-addon"> 메뉴 판매가 : </span> <input id="sellPrice"
												placeholder="계산된 메뉴 단가를 참고하여 판매할 가격을 입력하세요" class="form-control onlyNumber digits" maxlength="11">
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
												<th>제품용량</th>
												<th>단위</th>
											</tr>
										</thead>
										<tbody id="menu_tbody">
										</tbody>
									</table>
									<div class="form-group">
										<div class="row">
											<div class="col-md-12">
												<div class="input-group" >
														<span class="input-group-addon"> 원재료코드 : </span> 
														<span class="input-group-addon"> 원재료명 : </span> 
														<span class="input-group-addon digits"> 1단위 가격 : </span> 
														<span class="input-group-addon digits"> 사용할 용량 : </span>
														</div>
														<div id="added_0" class="form-group" >
															<span style="display:inline-block; width:25%; float:left;" class="form-control input-group" id="ing_click_code" title="ing_click_code"></span> 
															<span style="display:inline-block; width:24%; float:left;" class="form-control input-group" id="ing_click_name" title="ing_click_name"></span>
															<span style="display:inline-block; width:25%; float:left;" class="form-control input-group digits" id="ing_unit_price" title="ing_unit_price"></span> 
															<input style="display:inline-block; width:18%; float:left" class="form-control input-group digits" id="menuUnitAmount" name="menuUnitAmount" type="number" min="0"> 
															 <input style="float:left; width:8%; margin-top: 3px;" class="input-group" type="button" value="삭제" onclick="remove_ingredient()">
													</div>
													<div id="added_field"></div>	
												<center><input style="margin: 10px; align:center;" type="button" value=" 추가 " onclick="add_ingredient()"><br></center>
											</div>
										</div>
									</div>
									<div class="col-md-8"></div>
									<div class="col-md-4 text-right">
										<div class="row input-group">
											<span class="form-control" id="calMenuClick" disabled="disabled"></span> <span
												class="input-group-btn digits">
												<button id="" class="btn" type="button"
													onclick="javascript:calMenuUP();">메뉴 단가 계산</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="btnCancel" onclick="javascript:resetForm()">취소</button>
							<button type="button" class="btn btn-primary"
								onclick="javascript:saveMenu()">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>