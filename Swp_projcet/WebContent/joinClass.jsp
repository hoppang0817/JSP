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
			<br>
			<form action="joinClass.do?c_num=${c_num}" method="post" class="form-horizontal">
				<div class="form-group row">
					<label class="control-lable col-sm-2"> 회원 번호</label>
					<div class="col-sm-3">
					   <input type="text" name="Id"	class="form-control"></div>
					<input class ="btn btn-primary" type="submit" value="신청">
				</div>
			</form>
		<div class="container">
			<table class="table table-hover" id ="table-1">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>성별</th>
					<th>이메일</th>
				</tr>
				</thead>
				<tbody>
				<h3 class="mt-5">수강 회원</h3>
			<c:forEach items="${member_view}" var="member_view">
				<tr>
					<td>${member_view.m_id}</td>
					<td>${member_view.m_name}</td>
					<td>${member_view.m_phone}</td>
					<td>${member_view.m_arrd}</td>
					<td>${member_view.m_sex}</td>
					<td>${member_view.m_email}</td>
				</tr>
			</c:forEach>	
				</tbody>
			</table>
		</div>
		</div>
	</main>
</body>
</html>