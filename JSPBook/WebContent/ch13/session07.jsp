<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<p> <h4>----- 세션 유효 시간 변경 전 -----</h4>
	<%
	
		//getMaxInactiveInterval()는 초로 가져옴
		// /60한이유는 분으로 출력하기위해
		
		int time = session.getMaxInactiveInterval() / 60;

		out.println("세션 유효 시간  : " + time + "분<br>");
	%>
	<p>	<h4>----- 세션 유효 시간 변경 후 -----</h4>
	<%
		//세선의 유효시간 변경
		session.setMaxInactiveInterval(60 * 60);
		time = session.getMaxInactiveInterval() / 60;

		out.println("세션 유효 시간  : " + time + "분<br>");
	%>
</body>
</html>