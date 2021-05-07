<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%
	//예제1번에서 저장된 값을 불러온다
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");

		out.println("설정된 세션의 속성 값 [1] : " + user_id + "<br>");
		out.println("설정된 세션의 속성 값 [2] : " + user_pw);
	%>
</body>
</html>