<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>수업 목록</h2>
		</div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>수업 번호</th>
						<th>수업명</th>
						<th>인원수</th>
						<th>시간</th>
						<th>등급</th>
						<th>수업 수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr >
							<td>${list.c_num}</td>
							<td>${list.c_name}</td>
							<td>${list.count}/${list.c_limitedNum}</td>
							<td>${list.c_time}</td>
							<td>${list.c_grade}</td>
							<td><a class="badge badge-primary" href="updateClassView.do?c_num=${list.c_num}">수정하기</a>
						</tr>
				
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>