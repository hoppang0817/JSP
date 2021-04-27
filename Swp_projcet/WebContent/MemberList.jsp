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
			<h2>회원 목록</h2>
		</div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>성별</th>
						<th>이메일</th>
						<th>수강 수업 </th>
						<th>회원 수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mdto">
						<tr>
							<td>${mdto.m_id}</td>
							<td>${mdto.m_name}</td>
							<td>${mdto.m_phone}</td>
							<td>${mdto.m_arrd}</td>
							<td>${mdto.m_sex}</td>
							<td>${mdto.m_email}</td>
							<td>${mdto.c_num}</td>
							<td><a class="badge badge-primary" href="updateMember.do" >수정하기</a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>