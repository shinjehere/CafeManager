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
<script type="text/javascript">
	$(function() {
		 searchBoard(); //실행시 ajax list 불러오기 실행
		 $("#searchBtn").click(function() {//검색 찾기버튼
			 btnEnter();
		 });
		$(function(){
			  $("#allCheck").click(function() { 
					 /*      $("#work_div").val("doSearch"); */
					      if ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면 
					         $("input[type=checkbox]").prop("checked", true); // 모든 checkbox 체크 
					      } else { // 전체선택 체크박스가 체크되어있지 않으면 
					         $("input[type=checkbox]").prop("checked", false); // 모든 checkbox 체크해제
					      }
					   }); // --전체선택Btn closed
			});
		
	});
	//search 관련 javascript
	//검색 버튼 및 엔터시 실행된다.
	function btnEnter() {
				$('#currentPage').val('1');
				searchBoard();
}
	/* 토글 관련 javascript */
	/*에이젝스로 값을 보내주고 JSON형식으로 값을 받아옴*/
	/*토글 꾸며주기 완료*/
	function toggle(toggle_value) {
		$.ajax({
			url:"sell/"+toggle_value,
			data:JSON.stringify(toggle_value),
			type:'GET',
			dataType:"JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				$('#toggle_div'+toggle_value).html(function() {
					var date=new Date(data.list[0].sell_Date);
					var year=date.getFullYear().toString();
					var month= date.getMonth() + 1;
					var day= date.getDate();
					var hours=date.getHours();
					var minutes=date.getMinutes();
					var sell_Date=year+"-"+month+"-"+day+" "+hours+":"+minutes;
					var str="";
					str+='<div class="container"><div class="row"><div class="col-xs-4 col-md-4"><label for="sell_Date">판매일자 :</label>';
					str+='<div id="sell_Date">'+sell_Date+'</div></div>';
					str+='<div class="col-xs-4 col-md-4"><label for="sell_Name">메뉴 코드 :</label>';
					str+='<div id="sell_Name">'+data.list[0].menu_Name+'</div></div>';
					str+='<div class="col-xs-4 col-md-4"><label for="sell_Code">메뉴 코드 :</label>';
					str+='<div id="sell_Code">'+data.list[0].menu_CD+'</div></div></div>';
					str+='<div class="container"><div class="col-xs-12 col-md-12"><table class="table"><caption>원재료 리스트</caption>';
					str+='<thead><tr><th>순서</th><th>원재료 명</th><th>원재료 코드</th><th>사용 용량</th></tr></thead>'
					str+='<tbody>';
					for(var i=0;i<data.list.length;i++){
					str+='<tr>';
					str+='<th scope="row">'+(i+1)+'</th>';
					str+='<td>'+data.list[i].ing_NM+'</td>';
					str+='<td>'+data.list[i].ing_CD+'</td>';
					str+='<td>'+(data.list[i].menu_Amount*data.list[0].sell_CNT)+'</td>';
					str+='</tr>';
					}
					str+='</tbody>';
					return str;
				});
				$('#toggle_div'+toggle_value).toggle('show')
				
				
				var list=JSON.stringify(data.list);
				console.log("success"+JSON.stringify(data.list));
				console.log("success"+data.list);
				
			}
		});
	}
	 function searchBoard(){
		 var dataform=$('#searchForm').serialize();
			$.ajax({
					url : "sell/sell",
					data:dataform,
					type: "GET",
				 	 dataType: "JSON", // 일단 지워봄 
					//async:false, //일단 넣어봄
				 	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						console.log(JSON.stringify(data.list));
					 var strs = "";
						if(data.list.length>0){
							var dataTable = $("#boardTable tbody");
							$("#boardTable tbody tr").remove();
							
							for(var i=0; i<data.list.length; i++){
								strs += trMake(data.list[i]);
							}
							$(dataTable).append(strs);
						}else{
							var dataTable = $("#boardTable tbody");
							$("#boardTable tbody tr").remove();
							strs += "<tr><td colspan=7>데이터가 없습니다.</td></tr>";
							$(dataTable).append(strs);
						}
						makePaging(data.paging);
					 
					}, error:function(request,status,error){
					    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
			
			});
			
				
		
	}
	 function trMake(data){
			var date=new Date(data.sell_Date);
			var year=date.getFullYear().toString();
			var month= date.getMonth() + 1;
			var day= date.getDate();
			var hours=date.getHours();
			var minutes=date.getMinutes();
			var sell_Date=year+"-"+month+"-"+day+" "+hours+":"+minutes;
			var str = '<tr>';
			 str+="<td><input type='checkbox' id=''/></td>";
				str += '<td><a class="sell_CD" href="#" onclick="javascript:toggle(\''+data.sell_CD+'\')">'+data.sell_CD+'</a></td>';
				str += '<td>'+sell_Date+'</td>';
				str += '<td>'+data.menu_CD+'</td>';
				str += '<td>'+data.menu_Name+'</td>';
				str += '<td>'+data.sell_CNT+'</td>';
				str += '<td>'+data.total_SP+'</td>';
				str += '</tr>';
				str += '<tr><td colspan="6" id="toggle_div'+data.sell_CD+'" style="display: none;"><div></div></td></tr>';
			return str;	
		}
	function makePaging(paging){
		
		var currentPage = $("#currentPage").val();
		$("#startPage").val(paging.startPage);
		 console.log(paging.startPage);
		$("#endPage").val(paging.endPage);
		console.log(paging.endPage);
		$("#pagination li").remove();
		
		var str = "";
			if(currentPage<2){
				str += '<li><a href="#">&laquo;</a></li>';
			}else{
				str += '<li><a href="#" onclick="clickPaging('+(currentPage-1)+')">&laquo;</a></li>';
			}
			
			for(var i=paging.startPage; i<paging.endPage+1; i++){
				if(currentPage == i){
					str += '<li class="active"><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
				}else{
					str += '<li><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
				}
			}
			if(currentPage<paging.endPage){
				str += '<li><a href="#" onclick="clickPaging('+(currentPage+1)+')">&raquo;</a></li>'
			}else{
			str += '<li><a href="#">&raquo;</a></li>'
			}
		$("#pagination").append(str);
        
	}
	
	function clickPaging(currentPage){
		
		$("#currentPage").val(currentPage);
		
	 	$("#pagination li").removeClass("active"); 
		
	 	 searchBoard();
		
	} 
	function todayTime() {
		var date=new Date();
		var year=date.getFullYear().toString();
		var month= date.getMonth() + 1;
		var day= date.getDate();
		var hours=date.getHours();
		var minutes=date.getMinutes();
		var Time=year+"-"+month+"-"+day+" "+hours+":"+minutes;
		console.log(Time);
		return Time;
	}
	
	function new_sell() {
		$('#myModal').modal();
		serverTime.innerHTML=todayTime(); 
	}
	function menu_SH() {
		var search_text=$('#menu_search').val();
		console.log(search_text);
		$.ajax({
			url:"sell/menuSearch",
			data:{"search_text":search_text},
			type:'GET',
			dataType:"JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				console.log(data);
				
					/* console.log(data.list[i].menu_cd); */
					$('#menu_table tbody').html(function() {
						str="";
						for(var i=0;i<data.list.length;i++){
							str+="<tr>";
							str+="<td>"+data.list[i].menu_name+"</td>";
							str+="<td>"+data.list[i].menu_cd+"</td>";
							str+="<td>"+data.list[i].menu_sp+"</td>";
							str+="</tr>";
						}
					
						return str;
					
						});
						trClick()
			},
			error: function(xhr,status,error){
		          //에러!
		          alert("code:"+xhr.status);
		     }
		});
	}
	//테이블 row 클릭시 값 가져오기
	function trClick() {
		$("#menu_table tr").click(function() {
			var tdArr = new Array();
			var tr=$(this);
			var td=tr.children();
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			console.log("배열에 담긴 값 : "+tdArr);
			
			var menu_name=td.eq(0).text();
			var menu_cd=td.eq(1).text();
			var menu_sp=td.eq(2).text();
			$('#menu_click_name').text(menu_name);
			$('#menu_click_SP').text(menu_sp);
			$('#menu_click_code').text(menu_cd);
			
		});
	}
	function SP_multiply() {
		var menuName=$('#menu_click_name').text();
		if(menuName=="메뉴이름"){
			alert("메뉴를 검색 후 클릭해 주세요!");
		}else{
			var click_sp=$('#menu_click_SP').text();
			console.log(click_sp);
			var menuCount=$('#menuCount').val();
			if(menuCount==""){
				alert("수량를 입력해주세요");
			}else if(menuCount=="0"){
				alert("0개 입니다");
				$('#sp_click').text(null);
				$('#total_SPay').text(null);
		}else{
				var sp_multiply=click_sp*menuCount;
				console.log(sp_multiply);
				$('#sp_click').text(sp_multiply);
				$('#total_SPay').text(sp_multiply);
				
			}
		}
	}
	function reset() {
		$('#sp_click').text(null);
		$('#total_SPay').text(null);
		$('#menu_click_name').text(null);
		$('#menu_click_SP').text(null);
		$('#menu_click_code').text(null);
	}
	function save_sell() {
		var click_sp=$('#menu_click_SP').text();
		var click_code=$('#menu_click_code').text();
		var click_count=$('#menuCount').val();
		console.log(click_count+":"+click_code)
		if(click_sp==""||click_code==""||click_count==""||click_count=="0"){
			alert("메뉴를 설정해주세요");
		}else{
		$.ajax({
			url:'sell/new',
			data:{"click_code":click_code,"click_count":click_count},
			type:'POST',
			dataType:'JSON',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(data) {
				location.href=data.url;
				searchBoard();
				console.log(data.url);
			}
		});
		}
	}
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
					<button type="button" class="btn btn-primary">삭제</button>
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