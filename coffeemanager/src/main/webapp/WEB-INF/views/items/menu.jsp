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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- 데이트피커를 위한 css와 js -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

<!-- 모달창 js -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
position:absolute; 
z-index:9000; 
background-color:#000; 
display:none; 
left:0; 
top:0; 
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
						<div class='input-group date' >
							<input type='text' id='start_date' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
						&nbsp; ~ &nbsp; <label for="seachCodeAndName">&nbsp 검색 종료일
							:</label>
						<div class='input-group date' >
							<input type='text' id='end_date' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="col-lg-12 col-xs-12 col-md-12">
			<table id="menu_list" class="table table-striped recruit">
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
					<c:forEach var="list" items="${MenuVO }">
						<tr class = "title">
							<td><input type="checkbox" id="checkOne"/></td>
							<td>${list.menu_cd }</td>
							<td>${list.menu_name }</td>
							<td>${list.menu_up }</td>
							<td>${list.menu_sp }</td>
							<td>${list.mn_reg_dt }</td>
							<td>${list.mn_mod_dt }</td>
							<td><label class="switch"><input type="checkbox" id="tog">
									<span class="slider round"></span>
							</label>
								<p>사용안함</p>
								<p style="display: none;">사용</p></td>
						</tr>
						<tr class="hide" >
							<td>수정하시겠습니까?</td>
							<td><button type="button" >수정</button></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="text-center">
			<ul class="pagination" class="pagination-sm"></ul>
		</div>

		<div class="text-left">
			<button type="button" class="btn btn-danger">선택삭제</button>
		</div>
		<div class="text-right">
			<button type="button" class="btn btn-danger">엑셀 다운로드</button>
			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#newMenu">신규등록</button>
				<!-- Modal -->
				<div class="modal fade" id="newMenu" role="dialog">
					<div class="modal-dialog">
						<!-- Modal Content -->
						<form action="">
							<div class="form-group">
								
							</div>
							<button type="submit" class="btn btn-default">등록하기</button>
						</form>
					</div>
				</div>
		
		</div>
	</div>

</body>
</html>