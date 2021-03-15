<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" 	href="resources/css/bootstrap.min.css">
<title>상품코드오류</title>
</head>
<body>
<jsp:include page="nav.jsp" />
	<div class="jumbotron">
		<div class="container">
		<h3 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h3>
		</div>
	</div>
	<div class="container">
	<p><%=request.getRequestURI() %>?<%=request.getQueryString() %></p>
	<p>
	<a href="Book.jsp" class="btn btn-secondary">상품목록&raquo;</a>
	</p>
	</div>

</body>
</html>