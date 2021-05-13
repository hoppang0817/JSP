<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
tr{
	height: 120px
}
</style>
</head>

<body>
<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>보관함 관리</h2>
		</div>
		<div class="container">
			<table border="2" class="table table">
			<c:forEach begin="1" end="4">
			<tr>
			<c:forEach begin="1" end="5" items="${list}" var="list">
			<td>
			${list.l_num}
			</td>
			</c:forEach>
			</tr>
			</c:forEach>
			</table>
		</div>
	</main>

</body>
</html>