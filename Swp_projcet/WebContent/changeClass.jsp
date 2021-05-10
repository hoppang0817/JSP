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
			<h2>반 변경</h2>
		</div>
		<div class="container">
			<table class="table table-hover w-auto">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>수강 수업 </th>
						<th>시작일</th>
						<th>마지막일</th>
						<th>변경할 반번호</th>
						<th>반 변경</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mdto">
						<tr>
							<td>${mdto.m_id}</td>
							<td>${mdto.m_name}</td>
							<td>${mdto.c_num}</td>
							<td>${mdto.startDate}</td>
							<td>${mdto.endDate}</td>
							<td><input type="text" class="form-control" style="width:50px;height:30px;"></td>
							<td><a class="badge badge-primary" href="changeClass.do">변경</a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>