<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@include file="nav.jsp" %>

	<%!String greeting = "도서 웹사이트에 오신걸 환영합니다";
	String taglin = "Welcome to Web Markek!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=taglin%>
			</h3>
		<%
		Date day = new Date();
		String am_pm;
		int hour = day.getHours();
		int minute = day.getMinutes();
		int second = day.getSeconds();
		if(hour/12 == 0){
			am_pm="AM";
		}else{
			am_pm="PM";
			hour = hour-12;
			String CT = hour+":"+minute+":"+second+" "+am_pm;
			out.println("현재시간은 :"+CT);
		}
		%>
		</div>
	</div>
	<hr>
	<%@include file="footer.jsp" %>
</body>
</html>