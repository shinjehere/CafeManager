<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css"> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<title>Cafe Manager</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<!-- Header -->
<jsp:include page="./template/header.jsp" flush="false"/>

<!-- Menu -->
<jsp:include page="./template/menu.jsp" flush="false"/> 

<!-- Content -->  
<jsp:include page="${content }"></jsp:include>

<!-- Footer -->
<jsp:include page="./template/footer.jsp" flush="false"/>

</body>
</html>

