<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
    
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

  <style>
	  body {
	      position: relative; 
	  }
	  #section1 {padding-top:50px;height:500px; }
	  #section2 {padding-top:50px;height:500px; }
	  #section3 {padding-top:50px;height:500px; }
	  #section41 {padding-top:50px;height:500px; }
	  #section42 {padding-top:50px;height:500px; }
  </style>
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
			    <li><a href="#section1">월 매출 현황</a></li>
			    <li><a href="#section2">메뉴별 매출 현황</a></li>
			    <li><a href="#section3">원재료 재고 현황</a></li>
			  </ul>
			  <br>
			 <!-- 일일 매출 현황 -->
			<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>  
			 <br>
			<!-- 월 매출 현황 -->
			<div id="section1" class="container-fluid">
			 <div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			</div>
			<br>
			<!-- 메뉴별 매출 현황 -->
			<div id="section2" class="container-fluid">
				<div id="container3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			</div>
			<br>
			<!-- 기타 차트 -->
			<div id="section3" class="container-fluid">
			 <div id="container4" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			</div>
			
			<%--  <div>
			  <table>
			    <c:forEach var="dlist" items="${dlist }">
					<tr>	
						 <td>${dlist.hour }</td>   
						 <td>${dlist.total_SP }</td> 
						  <td>${dlist.menu_Name }</td> 
					<td>${dlist.sell_CNT }</td> 
					</tr>
				</c:forEach>
	  		  </table>
			</div> --%>
			
			</div>
			
	    </div> 
  
	  </div>
	</div>  
			
</body>

 <script type="text/javascript">
 //일일 매출
 /*Main Chart*/
$(function () {	
	/*x축 데이터*/
	var categoriesData = [
		 <c:forEach var="dlist" items="${dlist }">
		 '<c:out value="${dlist.hour }"/>', 
		 </c:forEach>
	]; 

	var categoriesSeries = 
		[{
	     
	        data: [ 
	         <c:forEach var="dlist" items="${dlist }">
			 <c:out value="${dlist.total_SP }"/>,
		 	 </c:forEach>
	      ]
   
	    }];
	
	
	Highcharts.chart('container', {

	    chart: {
	        type: 'column'
	    },

	    title: {
	        text: '일일 매출 현황'
	    },

	    xAxis: {
	        categories: categoriesData
	    },

	    yAxis: {
	        allowDecimals: false,
	        min: 0,
	        title: {
	            text: '판매총액'
	        }
	    },

	    tooltip: {
	        formatter: function () {
	            return '<b>' + this.x + '</b><br/>' +
	                
	                'Total: ' + this.point.stackTotal;
	        }
	    },

	    plotOptions: {
	        column: {
	            stacking: 'normal'
	        }
	    },

	    series: 
	        categoriesSeries
	   
	});
}); 
 
 
 //월별 매출
 $(function () {		
	 var categoriesDate = [
		 <c:forEach var="plist" items="${plist }">
		 '<c:out value="${plist.sell_Date }"/>', 
		 </c:forEach>
	]; 
	 var categoriesData =  [
		 <c:forEach var="plist" items="${plist }">
			 <c:out value="${plist.total_SP }"/>,
		 </c:forEach>
	]; 

	Highcharts.chart('container2', {
	    chart: {
	        type: 'line'
	    },
	    title: {
	        text: '월 매출 현황'
	    },
	    subtitle: {
	        text: ''
	    },
	    xAxis: {
	        categories: categoriesDate
	    },
	    yAxis: {
	        title: {
	            text: '총 판매가격()'
	        }
	    },
	    plotOptions: {
	        line: {
	            dataLabels: {
	                enabled: true
	            },
	            enableMouseTracking: false
	        }
	    },
	    series: [{
	        name: '총 판매액',
	        data: categoriesData
	    }]
	});
}); 
 
 //메뉴별 판매량
 $(function () {		
	var categoriesData = [
		 <c:forEach var="mlist" items="${mlist }">
		 {
		     name: '<c:out value="${mlist.menu_Name }"/>',
		     y:	<c:out value="${mlist.sell_CNT }"/>
		  },
		 
		 </c:forEach>
		 
	]; 
	
	Highcharts.chart('container3', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: '메뉴별 매출 현황'
	    }, subtitle: {
	        text: 'Source: <a href="../coffee/sell">판매관리</a>'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                style: {
	                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                }
	            }
	        }
	    },
	    series: [{
	        name: 'Brands',
	        colorByPoint: true,
	        data: categoriesData
	    }]
	});
}); 
 
 
 //재고 현황
 $(function () {	
		
		var categoriesData = [
		 	<c:forEach var="list" items="${slist }">
			 ['<c:out value="${list.ing_NM }"/>', <c:out value="${list.stock_CNT}"/>,],
			</c:forEach> 
			
	    ];
		Highcharts.chart('container4', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '원재료 재고 현황'
		    },
		    subtitle: {
		        text: 'Source: <a href="../coffee/stock">재고관리</a>'
		    },
		    xAxis: {
		        type: 'category',
		        labels: {
		            rotation: -45,
		            style: {
		                fontSize: '13px',
		                fontFamily: 'Verdana, sans-serif'
		            }
		        }
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '재고량'
		        }
		    },
		    legend: {
		        enabled: false
		    },
		    tooltip: {
		        pointFormat: '재고량: <b>{point.y:.1f} 개</b>'
		    },
		    series: [{
		        name: 'Population',
		        data: categoriesData,
		        dataLabels: {
		            enabled: true,
		            rotation: -90,
		            color: '#FFFFFF',
		            align: 'right',
		            format: '{point.y:.1f}', // one decimal
		            y: 10, // 10 pixels down from the top
		            style: {
		                fontSize: '13px',
		                fontFamily: 'Verdana, sans-serif'
		            }
		        }
		    }]
		});
	});
 </script>
</html>

