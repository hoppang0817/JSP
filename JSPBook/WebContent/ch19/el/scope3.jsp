<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.setAttribute("id", "aaa");
	application.setAttribute("db", "mydb");
%>
id:${id}<br>
id:${sessionScope.id}<br>
db:${db}<br>
db:${applicationScope.db}<br>