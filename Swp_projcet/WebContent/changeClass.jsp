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
		<form method="post" class="form-horizontal" action="changeClass.do">
			<div class="form-group row">
				<label class="control-lable col-sm-1"> 회원번호  </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="m_id">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-1"> 변경할 수업번호  </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="c_num">
				</div>
				<button type="submit" class="btn btn-primary">변경</button>
			</div>
		</form>
	</div>
		<div class="container">
			<table class="table table-hover w-auto">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>수강 수업 </th>
						<th>시작일</th>
						<th>마지막일</th>
						<th>반번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mdto">
						<tr>
							<td>${mdto.m_id}</td>
							<td>${mdto.m_name}</td>
							<td>${mdto.m_phone}</td>
							<td>${mdto.c_num}</td>
							<td>${mdto.startDate}</td>
							<td>${mdto.endDate}</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>