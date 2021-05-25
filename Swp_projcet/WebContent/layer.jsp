<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<table class="table table-bordered">
	<thead>
		<tr>
			<th>회원 번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
	</thead>
	<tbody>
	
		<c:forEach  var="list"  items="${list}">
		<tr>
			<td>${list.m_id}</td>
			<td>${list.m_name}</td>
			<td>${list.m_phone}</td>
			<td>${list.m_email}</td>
		</tr>
		</c:forEach>
		
	</tbody>
	</table>
</div>
</body>
</html>
