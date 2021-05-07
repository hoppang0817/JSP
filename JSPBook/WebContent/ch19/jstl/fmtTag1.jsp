<%@page import="java.util.TimeZone"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 위와 동일함 둘다 한글깨짐방지 -->
<fmt:requestEncoding value="UTF-8"/>
<!-- Locale 지정 ko는 국가코드  kr언어코드 -->
<fmt:setLocale value="ko_kr"/>
<!-- action이지정되지 않으면 자기페이지에 자기가 받음 -->
<form method="post">
	<input name="name" value="홍길동">
	<input type="submit">
</form>
name: ${param.name}<br>
------------------------------------------------------------
<%
	String timeZone[]=TimeZone.getAvailableIDs();
	for(int i=0;i<timeZone.length;i++){
		out.print(timeZone[i]+"<br>");
	}
%>