<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
 
<title>Cafe Manager</title>
</head>
<body>
<!-- Menu -->
<nav class="navbar navbar-inverse"> 
 <div class="container-fluid"> 
     <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div> 
   
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="../coffee/" style="background-color:#ff0000"> <span class="glyphicon glyphicon-home"></span> Home</a></li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-cutlery"></span> 매장관리</a>
     	  <!--   Sub Menu -->
     	  <ul class="dropdown-menu">
            <li><a href="../coffee/menu">메뉴 관리</a></li>
            <li><a href="../coffee/ingredient">원재료 관리</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-credit-card"></span> 거래관리</a>
     	 <!--     Sub Menu -->
     	   <ul class="dropdown-menu">
            <li><a href="../coffee/sell">판매 관리</a></li>
            <li><a href="../coffee/stock">재고 관리</a></li> 
          </ul>
         </li>
      </ul>
    </div>
   </div>
  </nav> 
</body>
</html>