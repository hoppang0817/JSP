<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>

	<div class="container" align="center" style="margin-top: 70px;">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading"><i class="far fa-user-circle fa-5x" ></i></h3>
			<form class="form-signin" action="" method="POST">
				<div class="form-group">
					<label for="inputUserId" class="sr-only">User Id</label> <input
						type="text" class="form-control" placeholder="ID" required
						autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> <input
						type="password" class="form-control" placeholder="Password"
						required>
				</div>
				<div class="form-group">	
				<button class="btn btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				 </div>
				 <div class="form-group">	
				 <a href="IdFiend.jsp"><b>아이디찾기</b></a> | <a href="PwFiend.jsp"><b>비밀번호찾기</b></a>
				 </div>
				 <a href="Join.jsp"><b>회원가입</b></a>
				 
			</form>
		</div>
	</div>

</body>
</html>