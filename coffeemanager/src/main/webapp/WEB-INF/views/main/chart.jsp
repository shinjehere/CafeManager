<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cafe Manager</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
  <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script> 
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
</head>
<body>
 	<div class="container-fluid text-center">    
	  <div class="row content">
	
		매출 현황 그래프
	    <div class="col-sm-10 text-left"> 
		    <div class="container">
			  <h3>매출 정보</h3>
			  <ul class="nav nav-tabs">
			    <li class="active"><a href="#">일일 매출 현황</a></li>
			    <li><a href="#">월 매출 현황</a></li>
			    <li><a href="#">메뉴별 매출 현황</a></li>
			  </ul>
			  <br>
			 <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div> 	
			</div>
	    </div>    
	  </div>
	</div> 
	
</body>
</html>