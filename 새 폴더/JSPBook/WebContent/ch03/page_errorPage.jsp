<!-- 에러페이지는 에러가 발생시 다음 jsp페이지를 실행한다 -->
<%@ page errorPage="page_errorPage_error.jsp"%>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<%
		//널값을 넣어 에러발생
		String str = null;
		out.println(str.toString());//여기서 에러발생
	%>
</body>
</html>