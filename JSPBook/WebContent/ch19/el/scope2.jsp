<%@ page contentType="text/html; charset=UTF-8"%>
<%
	pageContext.setAttribute("msg", "오늘은 즐거운 화요일");

%>
msg:${msg}<br>
<!-- pageScope 생략가능 -->
msg:${pageScope.msg}<br>
sum:<%=request.getAttribute("sum") %><br>
sum:${sum}<br>
sum:${requestScope.sum}<br>