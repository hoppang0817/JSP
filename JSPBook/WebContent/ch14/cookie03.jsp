<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		//쿠키삭제기능은 별도로 제고하지않고 유지시간을 만료시킴으로 쿠키를 삭제함
		//브라우저에 저장된 쿠키들을 배열로 가져온다
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			cookies[i].setMaxAge(0);//모든 쿠키의 생존시간을 0초로
			response.addCookie(cookies[i]);//쿠키저장
		}
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>