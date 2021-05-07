<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
id:<%=id %><br>
pwd:<%=pwd %><br>
id:${param.id}<br>
pwd:${param.pwd}<br>