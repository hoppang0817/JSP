<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<title>login</title>
</head>
<body>
	<%@include file="nav.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해주세요");
				out.println("</div>");
			}
			%>
			<form name="loginForm" action="j_security_check" method="post">
				<div class="form-group">
					<label class="sr-only">User Name</label>
					<!-- sr-only:레이블을숨김 ->UserName숨김 -->
					<input type="text" name="j_username" placeholder="ID"
						class="form-control" required autofocus>
					<!-- required:서버전송전 반드시채워져있어야하는 입력필드명시 -->
				</div>
				<div class="form-group">
					<label class="sr-only">Password</label> <input type="password"
						name="j_password" placeholder="Password" class="form-control"
						required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>