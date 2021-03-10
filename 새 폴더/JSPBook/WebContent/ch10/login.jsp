<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Security</title>
</head>
<body>
<!-- 서버에서 자동으로 인증을 해주는데 action="j_security_check"(내가 만든거아님,톰겟에 있는 엑션)사용해야함 -->
<!-- 이름들을   name="j_username", name="j_password" 로한다 -->
	<form name="loginForm" action="j_security_check" method="post">
		<p>	사용자명: <input type="text" name="j_username">
		<p>	비밀번호 : <input type="password" name="j_password">
		<p>	<input type="submit" value="전송">
	</form>
</body>
</html>