<%@ page contentType="text/html; charset=UTF-8"%>
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
		<form action="findId.do">
			<div class="form-group row">
				<label class="control-lable col-sm-3"> 회원 이름</label>
				<div class="col-sm-4">
					<input type="text" name="name" class="form-control">
				</div>
				<input class="btn btn-primary" type="submit" value="검색">
			</div>
		</form>
		<div class="container">
			<table class="table table-hover">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원 이름</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.m_id }</td>
					<td>${list.m_name }</td>
					<td>${list.m_phone }</td>
					<td>${list.m_email }</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>