<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>비밀번호찾기</title>
</head>
<body>

	<div class="container" align="center" style="margin-top: 70px;">
		<div class="col-md-6 col-md-offset-4">
			<h3 class="form-signin-heading">비밀번호 찾기</h3>
			<h6>비밀번호는 가입하신 이름,아이디,이메일을 통해 알수있습니다.</h6>
			<form class="form-signin" action="ActionPwFind.jsp" method="POST">
				<div class="form-group">
				<input type="text" name="name"class="form-control" placeholder="Name" required autofocus>
				</div>
				<div class="form-group">
				<input type="text" name="id"class="form-control" placeholder="Id" required>
				</div>
				<div class="form-group">
				 <input type="email" name="email" class="form-control" placeholder="Email" required>
				</div>
				<div class="form-group">	
				<button class="btn btn btn-lg btn-primary btn-block" type="submit">찾기</button>
				 </div>
			</form>
		</div>
	</div>

</body>
</html>