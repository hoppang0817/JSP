<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- getId와 getName 메소드를 사용해 아이디와 이름가져옴 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<p>	아이디 : <%=person.getId()%>
	<p>	이 름 : <%=person.getName()%>
	
</body>
</html>