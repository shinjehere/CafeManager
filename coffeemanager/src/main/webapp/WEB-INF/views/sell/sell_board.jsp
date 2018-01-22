<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> -->
<head>
<meta charset="utf-8">
<!--
		Date: 2017-12-24
		작성자 : 김영섭
		내용 : bootstrap에 datetimepicker 설정
		date: 2018-01-03
		내용 : list방식을 JSTL에서 ajax로 변환
		date : 2018-01-05
		내용 : 검색수정 및 토글 부분 디자인
	-->
<title>sell</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="resources/dist/css/bootstrap.css"
	rel="stylesheet">
<link href="resources/dist/css/bootstrap-datetimepicker.min.css"rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<script src="resources/dist/js/jquery-3.2.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/dist/js/bootstrap.js"></script>
<script src="resources/dist/js/bootstrap.min.js"></script>
<script src="resources/dist/js/moment-with-locales.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="resources/dist/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/coffee/resources/js/sell.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="container">
		<div class="container">
			<h3>
				<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
				판매관리
			</h3>
			<div style="margin-bottom: 10px;"></div>
		</div>
		<div class="container">
			<form class="form-inline" id="searchForm" >
				<input type="hidden" id="currentPage" name="currentPage" value="1"
				 <%--ajax로 변경되어 삭제 되는 부분들 "${map.paging.currentPage }" --%>/>
				<!-- ajax로 변경되어 삭제 되는 부분들
				 	<input type="hidden" id="pageSize" name="pageSize" value="10"/>
					<input type="hidden" id="rowSize" name="rowSize" value="10"/>-->
					<!-- <input type="hidden" id="startPage" name="startPage"/>
					<input type="hidden" id="endPage" name="endPage"/>    -->
					<div class="col-md-6">
						<div class="form-group">
							<label for="seachCodeAndName">검색 : </label>
							<div class="btn-group">
								<select id="searchDiv" class="btn btn-default"
									data-toggle="dropdown" name="searchDiv">
									<option value="1"
										
										selected>메뉴명</option>
		
									<option value="2">판매코드</option>
								</select>
		
							</div>
							<input type="text"
								class="form-control" id="searchValue" name="searchValue"
								onkeypress="if(event.keyCode==13) {btnEnter(); return false;}"
								placeholder="Search">
								<!--
								HTML onkeypress="if(event.keyCode==13) {btnEnter();return false;}"
								 엔터키 시  btnEnter로 넘긴다. return false없으면 엔터시 주소값을 넘김 -->
							<button id="searchBtn" class="btn btn-success" type="button">Search</button>
						</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<div id="form-control-wrapper">
							<div class="form-group label-floating is-empty">
								<label for="datepicker1" class="control-label">시작 날짜</label>
								<input type="text" id="datepicker1" class="from-control">
							</div>
						</div>
					</div>
					~
					<div class="form-group">
						<div id="form-control-wrapper">
							<div class="form-group label-floating is-empty">
								<label for="datepicker2" class="control-label">종료 날짜</label>
								<input type="text" id="datepicker2" class="from-control">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div style="margin-bottom: 30px;"></div>
		<div class="col-lg-12 col-xs-12 col-md-12">
			<table class="table table-hover" id="boardTable">
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck" /></th>
						<!-- 체크박스 -->
						<th>판매코드</th>
						<th>판매일자</th>
						<th>메뉴코드</th>
						<th>메뉴명</th>
						<th>판매수량</th>
						<th>판매가격</th>
					</tr>
				</thead>
				<tbody>
					<!-- 이부분은 ajax로 뿌려주기 때문에 별 의미가 없습니다. -->
				<%-- 	<c:forEach var="sl" items="${map.list }">
						<tr>
							<td><input type="checkbox" id="" /></td>
							<td><a class="sell_CD" href="#"
								onclick="javascript:toggle('${sl.sell_CD}')">${sl.sell_CD }</a></td>
							<td><fmt:formatDate value="${sl.sell_Date }"
									pattern="yyyy-MM-dd" /></td>
							<td>${sl.menu_CD }</td>
							<td>${sl.menu_Name }</td>
							<td>${sl.sell_CNT }</td>
							<td>${sl.total_SP }</td>
						</tr>
						<tr>
							<td colspan="6" id="toggle_div${sl.sell_CD }"
								style="display: none;"><div></div></td> 
						</tr>
					</c:forEach>--%>
					<!-- 이부분은 ajax로 뿌려주기 때문에 별 의미가 없습니다. -->
				</tbody>
			</table>

		</div>
		<div class="pagination text-center">
			<ul class="pagination" id="pagination">
				<!-- 이부분은 ajax로 뿌려주기 때문에 별 의미가 없습니다. -->
			<%-- 	<c:if test="${map.paging.currentPage > 1 }">
					<li><a href="javascript:paging('${map.paging.currentPage-1 }")">Prev</a></li>
				</c:if>
				<c:forEach begin="${map.paging.startPage }"
					end="${map.paging.endPage }" varStatus="status">
					<li><a href="javascript:paging('${status.count}')">${status.count}</a></li>
				</c:forEach>
				<c:if test="${map.paging.currentPage < map.paging.endPage}">
					<li><a
						href="javascript:paging('${map.paging.currentPage+1 }')">Next</a></li>
				</c:if> --%>
				<!-- 이부분은 ajax로 뿌려주기 때문에 별 의미가 없습니다. -->
			</ul>

		</div>
		<div class="text-right">
			<div class="btn-group">
					<button type="button" class="btn btn-primary" id="delete_Sell">삭제</button>
					<button type="button" class="btn btn-danger">엑셀 다운로드</button>
					<button id="new_sell" type="button" class="btn btn-info"
					onclick="javascript:new_sell()">신규등록</button>
			</div>
		</div>
			<!-- 모달창 2018-01-08 -->
			<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">신규등록</h4>
		      </div>
		    <form>
		    <div class="controller"> 
		      <div class="modal-body col-md-12 col-xs-12 col-lg-12 col-sm-12">
					   <div class="form-group"  style="margin: 10px;">
						<div class="row input-group">
							<span class="input-group-addon">
									판매일자 :
							</span>
							<span id="serverTime" class="form-control"></span>
							<span class="input-group-addon">
									총 판매가격 : <!-- col-md-3 col-lg-3 col-xs-3 col-sm-3  -->
							</span>
								<span class="form-control"  id="total_SPay"></span>
						</div>
					  </div>
					  <div class="form-group"  style="margin: 10px;">
						<div class="row input-group">
							<span class="input-group-addon">메뉴 명 : </span>
							<input type="text" placeholder="메뉴명 입력" class="form-control" 
							id="menu_search"
							onkeypress="if(event.keyCode==13) {menu_SH(); return false;}">
							<span class="input-group-btn">
								<button class="btn btn-warning" type="button"
								 id="menu_search_button" onclick="javascript:menu_SH()">검색</button>
								<!--   -->
							</span>
						</div>
					 </div>	
						<table id="menu_table" class="table table-bordered table-hover" style="margin: 30px 0 30px 0;">
								 <thead>
									  <tr>
									    <th>메뉴명</th>
									    <th>메뉴코드</th>
									    <th>가격</th>
									  </tr>
								 </thead>
								 <tbody id="menu_tbody">
								 </tbody>
						</table>
					 <div class="form-group">
							<div class="row">
							 	<div class="col-md-12">
										<div class="input-group">
											<span class="input-group-addon">
											메뉴 명 : 
											</span>
											<span class="form-control" id="menu_click_name">메뉴이름</span>
											<span class="input-group-addon">
											메뉴 코드 : 
											</span>
											<span class="form-control" id="menu_click_code">메뉴코드</span>
											<span class="input-group-addon">
											판매 가격 :
											</span>
											<span class="form-control" id="menu_click_SP"></span>
											<span class="input-group-addon">
											수 량 : 
											</span>
											<input class="form-control" id="menuCount" type="number" min="0">
											<span class="input-group-btn">
												<button type="reset" id="rest_x" onclick="javascript:reset();" class="btn btn-default">X</button>
											</span>
										</div>
								</div>
						</div>
					 </div>	
					 
					 <div class="col-md-8"></div>
					 <div class="col-md-4 text-right">
						 <div class="row input-group">
								<span class="form-control" id="sp_click"></span>
								<span class="input-group-btn">
									 <button class="btn" type="button" onclick="javascript:SP_multiply();">총판매 계산</button>
								</span>
						 </div> 
					</div>		   
					 </div>
			      </div>
		      	</form>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" onclick="javascript:save_sell()">저장</button>
		      </div>
		    </div>
		  </div>
		</div>	
	</div>
	<div style="margin-bottom: 30px;"></div>
</body>
</html>