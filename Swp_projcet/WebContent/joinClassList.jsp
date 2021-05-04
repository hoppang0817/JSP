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
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>수업 신청</h2>
		</div>
		<div class="container">
			<table class="table table-hover" id ="table-1">
				<thead>
					<tr>
						<th>수업 번호</th>
						<th>수업명</th>
						<th>인원수</th>
						<th>시간</th>
						<th>등급</th>
						<th>신청</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr> 
							<td>${list.c_num}</td>
							<td>${list.c_name}</td>
							<td>${list.count}/${list.c_limitedNum}</td>
							<td>${list.c_time}</td>
							<td>${list.c_grade}</td>
							<td><button
							<c:choose>
							<c:when test ="${list.count < list.c_limitedNum}"> onClick="location.href='joinClassView.do?c_num=${list.c_num}'" class="btn btn-primary btn-sm"</c:when>
							<c:otherwise>class="btn btn-danger btn-sm"  disabled=”disabled”</c:otherwise>
							</c:choose>
							>신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</main>
</body>
</html>