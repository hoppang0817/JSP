<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- 자바유딜테이트를 불러오고 date객체를생성 -->
	<jsp:useBean id="date" class="java.util.Date" />
	<p><%
			out.print("오늘의 날짜 및 시각");
		%>	
	<p><%=date%>
</body>
</html>
