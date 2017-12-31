<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	-->
    <title>sell</title>
    <!-- Bootstrap -->
	<link rel="stylesheet" href="resources/dist/css/bootstrap.css" rel="stylesheet">
	 <link href="resources/dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
		/* searchBoard(); */
		$("#searchBtn").click(function() {
			$('#currentPage').val(1);
			$('#searchForm').submit();
		});
		
		
	});
	function paging(currentpage){
		$('#currentPage').val(currentpage);
		$('#searchForm').submit();
		
	/* 	searchBoard(); */
		
	}
	/* function searchBoard(){
		 var dataform=$('#searchForm').serialize();
			$.ajax({
					url : "sell",
					data: dataform,
					type: "GET",
				 	 dataType: "JSON", // 일단 지워봄 
					//async:false, //일단 넣어봄
				 	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						alert(data.list.sell_CD[1]);
						alert(data.paging);
						
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
							strs += "<tr><td colspan=5>데이터가 없습니다.</td></tr>";
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
			
			var str = '<tr>';
				str += '<td><a href="#" onclick="detailBoard(\''+data.sell_CD+'\')">'+data.sell_CD+'</a></td>';
				str += '<td>'+data.sell_Date+'</td>';
				str += '<td>'+data.menu_CD+'</td>';
				str += '<td>'+data.menu_Name+'</td>';
				str += '<td>'+data.sell_CNT+'</td>';
				str += '<td>'+data.total_SP+'</td>';
				str += '</tr>';
	
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
		
	}  */
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
				<form class="form-inline" id="searchForm" method="GET" action="sell">
		 		<input type="hidden" id="currentPage" name="currentPage" value="${map.paging.currentPage }"/>
						<!--<input type="hidden" id="pageSize" name="pageSize" value="10"/>
					<input type="hidden" id="rowSize" name="rowSize" value="10"/>
					<input type="hidden" id="startPage" name="startPage"/>
					<input type="hidden" id="endPage" name="endPage"/>  -->
					<div class="form-group">	
					<label for="seachCodeAndName">검색 : </label>
						<div class="btn-group">
						      <select id="searchDiv" class="btn btn-default"
						       data-toggle="dropdown" name="searchDiv">
								<option value="1" <c:out value="${map.search.searchDiv==1?'selected':'' }"/> >메뉴명</option>
								
								<option value="2" <c:out value="${map.search.searchDiv==2?'selected':'' }"/>>판매코드</option>
							</select>
						
					</div>	
						<input type="text"
							value="${map.search.searchValue }"
						 class="form-control" id="searchValue" name="searchValue" placeholder="Search"
						>
						<button id="searchBtn" class="btn btn-success" type="submit">Search</button>	
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
						<th>판매코드</th>
						<th>판매일자</th>
						<th>메뉴코드</th>
						<th>메뉴명</th>
						<th>판매수량</th>
						<th>판매가격</th>
					</tr>
				</thead>	
				<tbody>
				 <c:forEach var="sl" items="${map.list }">
					<tr>
						<td>${sl.sell_CD }</td>
						<td><fmt:formatDate value="${sl.sell_Date }" pattern="yyyy-MM-dd"/></td>
						<td>${sl.menu_CD }</td>
						<td>${sl.menu_Name }</td>
						<td>${sl.sell_CNT }</td>
						<td>${sl.total_SP }</td>
					</tr>
				</c:forEach> 
					
				</tbody>
			</table>
			</div>
			<script type="text/javascript">
	/* 		$(function numberWithCommas(number) {
				var sp= $('#number').val;
			    return sp.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}); */
			</script>
			<div class="pagination text-center">
			
			  <ul class="pagination" id="pagination">
			    <c:if test="${map.paging.currentPage > 1 }">
				<li><a href="javascript:paging('${map.paging.currentPage-1 }")">Prev</a></li>
			  </c:if>
			  <c:forEach begin="${map.paging.startPage }" end="${map.paging.endPage }" varStatus="status">
			   <li><a href="javascript:paging('${status.count}')">${status.count}</a></li>
				 </c:forEach>
			 <c:if test="${map.paging.currentPage < map.paging.endPage}">
				<li><a href="javascript:paging('${map.paging.currentPage+1 }')">Next</a></li>
				</c:if> 
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