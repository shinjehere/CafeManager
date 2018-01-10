<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="/coffee/resources/css/menu/menu.css">

<!-- 메뉴 js 파일 -->
<script type="text/javascript" src="/coffee/resources/js/menu.js"></script>

<!-- 메뉴 사용 여부 토글을 위한 js -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

<!-- 아코디언을 위한 js -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- 데이트피커를 위한 css와 js -->
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script> -->

<!-- 모달창 js -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/*=========================*/
/*=====사용여부 토글 css 시작=====*/
/*=========================*/
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

p {
	margin: 0px;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
}
/*=========================*/
/*=====사용여부 토글 css 끝=====*/
/*=========================*/

/*=========================*/
/*=====아코디언 css 시작=====*/
/*=========================*/
#accordian li {
	list-style: none;
}

#accordian li>h1 {
	cursor: pointer;
}

li>ul {
	display: none;
}

li>ul>li {
	color: #00F;
}

/*=========================*/
/*=====아코디언 css 끝=====*/
/*=========================*/
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}
</style>
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
			<table id="menu_table" class="table table-striped recruit">
				<thead id="menu_thead">
					<tr>
						<th><input type="checkbox" id="allCheck" /></th>
						<th>메뉴코드</th>
						<th>메뉴명</th>
						<th>단가(원)</th>
						<th>판매가(원)</th>
						<th>등록일</th>
						<th>수정일</th>
						<th>메뉴 사용 여부</th>
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
			<button type="button" class="btn btn-danger">선택삭제</button>
		</div>
		<div class="text-right">
			<button type="button" class="btn btn-danger">엑셀 다운로드</button>
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#newMenu">신규등록</button>
			<!-- Modal -->
			<div class="modal fade" id="newMenu" role="dialog">
				<div class="modal-dialog">
					<!-- Modal Content -->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">신규 메뉴 등록</h4>
						</div>
						<div class="modal-body">
							<div class="container  col-xs-12">
								<form>
									<div class="input-group">
										<span class="input-group-addon">메뉴명</span> <input type="text"
											placeholder="50자이내" class="form-control">
										<div class="input-group-btn">
											<button type="submit" class="btn btn-default" id="check_name">중복확인</button>
										</div>
									</div>
									<br>
									<div class="input-group ">
										<span class="input-group-addon">메뉴단가</span> <input type="text"
											disabled="disabled" class="form-control"> <span
											class="input-group-addon">메뉴판매가</span> <input type="text"
											class="form-control">
									</div>
									<br>
									<div class="input-group  col-xs-12">
										<span class="input-group-addon">원재료 명</span> <input
											type="text" class="form-control" placeholder="Search"
											name="search">
										<div class="input-group-btn">
											<button class="btn btn-default btn-lg" type="submit"
												style="height: 34px;">
												<i class="glyphicon glyphicon-search"
													style="margin-top: -2px;"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default" id="createMenu">등록하기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal closed -->
		</div>
	</div>

</body>
</html>