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
			$('#currentPage').val('1');
			searchBoard();
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
	/* 토글 관련 javascript */
	/*에이젝스로 값을 보내주고 JSON형식으로 값을 받아옴*/
	function toggle(toggle_value) {
		alert(toggle_value);
		$.ajax({
			url:"sell/"+toggle_value,
			data:JSON.stringify(toggle_value),
			type:'GET',
			dataType:"JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				$('#toggle_div'+toggle_value).html(function() {
					var str="";
					str+="<div>"+data.list[0].sell_CD+"</div>";
					str+="<div>"+data.list[0].sell_Date+"</div>";
					str+="<div>"+data.list[0].menu_CD+"</div>";
					str+="<div>"+data.list[0].menu_Name+"</div>";
					str+="<div>"+data.list[0].sell_CNT+"</div>";
					str+="<div>"+data.list[0].total_SP+"</div>";
					for(var i=0;i<data.list.length;i++){
					str+="<div>"+data.list[i].ing_NM+"</div>";
					str+="<div>"+data.list[i].ing_CD+"</div>";
					str+="<div>"+data.list[i].menu_Amount+"</div>";
					}
				
					return str;
				});
				$('#toggle_div'+toggle_value).toggle('show')
				
				var list=JSON.stringify(data.list);
				alert(JSON.stringify(data.list));
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
							var strs = "";
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
						alert(error);
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
		$("#endPage").val(paging.endPage);
		$("#pagination li").remove();
		
		var str = "";
		
			str += '<li><a href="#">&laquo;</a></li>';
			for(var i=paging.startPage; i<paging.endPage+1; i++){
				if(currentPage == i){
					str += '<li class="active"><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
				}else{
					str += '<li><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
				}
			}
			
			str += '<li><a href="#">&raquo;</a></li>'
			
		$("#pagination").append(str);
        
	}
	
	function clickPaging(currentPage){
		
		$("#currentPage").val(currentPage);
		
	 	$("#pagination li").removeClass("active"); 
		
	 	 searchBoard();
		
		
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
		</div>
		<div class="container">
			<form class="form-inline" id="searchForm">
				<input type="hidden" id="currentPage" name="currentPage" value="1"
				 <%--ajax로 변경되어 삭제 되는 부분들 "${map.paging.currentPage }" --%>/>
				<!-- ajax로 변경되어 삭제 되는 부분들
				 	<input type="hidden" id="pageSize" name="pageSize" value="10"/>
					<input type="hidden" id="rowSize" name="rowSize" value="10"/>
					<input type="hidden" id="startPage" name="startPage"/>
					<input type="hidden" id="endPage" name="endPage"/>   -->
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
						placeholder="Search">
					<button id="searchBtn" class="btn btn-success" type="button">Search</button>
					<!-- 	<div class="form-group">
							<label for="seachCodeAndName">&nbsp검색 시작일 :</label>
							<input type="date" class="date" id="startDate" name="startDate">
						       
							&nbsp; ~ &nbsp; 
							 <label for="seachCodeAndName">&nbsp 검색 종료일 :</label>
							 <input type="date" class="date" id="endDate" name="endDate">
						       			
						</div> -->

				</div>
			</form>
		</div>

		<div class="col-lg-12 col-xs-12 col-md-12">
			<table class="table table-striped" id="boardTable">
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
			<button type="button" class="btn btn-danger">엑셀 다운로드</button>
			<button type="button" class="btn btn-info">신규등록</button>
		</div>
	</div>

</body>
</html>
</body>
</html>