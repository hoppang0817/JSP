<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- 파람태그에서 보내온 정보를 받기위해 request객체의 getParameter()메소드 사용 -->
	<p>	아이디 : <%=request.getParameter("id")%>
	<%
		String name = request.getParameter("name");
	%>
	<p>	이 름 : <%=java.net.URLDecoder.decode(name)%>
</body>
</html>