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
</head>
<body>
<jsp:include page="menu.jsp" />
<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>결제 내역</h2>
			<br>
			<form action="paymentList.do" method="post" class="form-horizontal">
				<div class="form-group row">
					<label class="control-lable col-sm-2"> 회원 번호</label>
					<div class="col-sm-3">
					   <input type="text" name="Id"	class="form-control"></div>
					<input class ="btn btn-primary" type="submit" value="조회">
				</div>
			</form>
			
			<div class="container">
			<table class="table table-hover" id ="table-1">
			<thead>
				<tr>
					<th>회원명</th>
					<th>결제일</th>
					<th>종료일</th>
					<th>수업 번호</th>
				</tr>
				</thead>
				<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.m_name}</td>
					<td>${list.startDate}</td>
					<td>${list.endDate}</td>
					<td>${list.c_num}</td>
				</tr>
			</c:forEach>	
				</tbody>
			</table>
		</div>
		</div>
</main>
</body>
</html>