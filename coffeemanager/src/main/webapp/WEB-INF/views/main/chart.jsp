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

</head>
 <body>

<div class="container">    
  <div class="row">
    <div class="col-sm-6">
      <div class="panel panel-default">
       <!--  <div class="panel-heading">BLACK FRIDAY DEAL</div> -->
        <div class="panel-body"><div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
        <!-- <div class="panel-footer">Buy 50 mobiles and get a gift card</div> -->
      </div>
    </div>
    <div class="col-sm-6"> 
      <div class="panel panel-default">
        <div class="panel-body"> <div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
      </div>
    </div>
    
  </div>
</div><br><br>
<div class="container">    
  <div class="row">
    <div class="col-sm-6">
      <div class="panel panel-default">
        <div class="panel-body"> <div id="container3" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
      </div>
    </div>
    <div class="col-sm-6"> 
      <div class="panel panel-default">
        
        <div class="panel-body"><div id="container4" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
      </div>
    </div>
    
  </div>
</div><br><br>
 
</body>

 <script type="text/javascript">
 //일일 매출
 /*Main Chart*/
$(function () {	
	/*x축 데이터*/
	
	var categoriesHour = [
		 <c:forEach var="dlist" items="${dlist }">
		 '<c:out value="${dlist.hour }"/>', 
		 </c:forEach>
	]; 
	 	
	var categoriesData = [
		  <c:forEach var="dlist" items="${dlist }">
		 	<c:out value="${dlist.sell_CNT }"/>,
	 	 </c:forEach>		
	]; 
	
	var categoriesSeries = 
		[{
	     	name: '총 판매액',
	        data: [ 
	         <c:forEach var="dlist" items="${dlist }">
			 <c:out value="${dlist.total_SP }"/>,
		 	 </c:forEach>
	      ]
   
	    }];
	
	Highcharts.chart('container', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: '일일 매출 현황'
	    },subtitle: {
	        text: ' <a href="../coffee/sell">판매관리</a>'
	    },
	    xAxis: {
	        categories:  categoriesHour
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Total coffee consumption'
	        }
	    },
	    legend: {
	        reversed: true
	    },
	    plotOptions: {
	        series: {
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
	    },subtitle: {
	        text: ' <a href="../coffee/sell">판매관리</a>'
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
	  var pieColors = (function () {
		    var colors = [],
		        base = Highcharts.getOptions().colors[0],
		        i;

		    for (i = 0; i < 10; i += 1) {
		        // Start out with a darkened base color (negative brighten), and end
		        // up with a much brighter color
		        colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		    }
		    return colors;
		}());
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
	    },subtitle: {
	        text: ' <a href="../coffee/menu">메뉴관리</a>'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            colors: pieColors,
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
	                distance: -50,
	                filter: {
	                    property: 'percentage',
	                    operator: '>',
	                    value: 4
	                }
	            }
	        }
	    },
	    series: [{
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
		        text: ' <a href="../coffee/stock">재고관리</a>'
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

