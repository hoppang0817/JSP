<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="./resources/img/favicon.ico"  type="image/x-icon">
<meta charset="UTF-8">
<title>Staff Login</title>
</head>
<body>


<style>
#img {
	height: 90px;
	display: block;
	margin: 50px auto;
}
</style>
	
	<div class="container" align="center" style="margin-top:200px" >
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">
				<a href="#"><img src="./resources/img/a2.png" id="img"></a>
			</h5>
			<c:if test="${loginResult == -1 || loginResult == 0 }">
				<div class="alert alert-danger">
					아이디와 비밀번호를 확인해주세요.
				</div>
			</c:if>
			<form action="LoginAction.do" class="form-signin" method="post">
				<div class="form-group">
					<label for="inputUserId" class="sr-only">User Id</label> 
					<input type="text" name="id" class="form-control" placeholder="ID"  required autofocus>
				</div>
				<div class="form-group">
					<label for="inputUserPassword" class="sr-only">User Password</label> 
					<input type="password" name="pw" class="form-control" placeholder="PW"  required autofocus>
				</div>
				
				<button type="submit" class="btn btn-primary form-control">로그인</button> 
				<br><br>
				<a href="joinStaff.jsp" >회원가입</a>
			</form>

		</div>
	</div>
</body>
</html>
