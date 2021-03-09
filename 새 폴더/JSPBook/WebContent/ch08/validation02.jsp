<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Validation</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		if (form.id.value == "") {
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return false;
		} else if (form.passwd.value == "") {
			alert("비밀번호를 입력해 주세요");
			form.passwd.focus();
			return false;
		}
		//자바스크립트로 form에 입력한 내용을 서버로 보낸다
		form.submit(); //자바스크립트로 서버 보내기
	}
</script>
<body>
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>	아 이 디 : <input type="text" name="id">
		<p>	비밀번호 : <input type="password" name="passwd">
		<p>	<input type="button" value="전송" onclick="checkLogin()">
	</form>
</body>
</html>