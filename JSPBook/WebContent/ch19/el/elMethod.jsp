<%@page import="ch19.ELMethod" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="m" uri="/WEB-INF/tlds/Functions.tld" %>
<%
	int num = 123456789;
	pageContext.setAttribute("num", num);
%>
JSP방식: <%=ELMethod.comma(num)%><br>
TLD방식: ${m:comma(num)}