<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
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
			<h2>출석 체크</h2>
			<br>
			<c:if test="${cnt == 1 || cnt == -1 }">
				<div class="alert alert-danger">
					이미 출석체크 완료
				</div>
			</c:if>
			<form method="post" class="form-horizontal" action="checkMember.do">
			<div class="form-group row">
				<label class="control-lable col-sm-1"> 회원번호  </label>
				<div class="col-sm-3">
					<input type="text" name="m_id" class="form-control" >
				</div>
					<button type="submit" class="btn btn-primary">확인</button>
			</div>
			</form>
		</div>
	</main>
</body>
</html>