<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- param태그는 혼자 사용X 인클루드나 포워드태그 사이에 사용 
파람태그에 작성한 매개변수와 값을 이동할 파일에 같이 들고감-->
	<!-- 파람01테이터로 이동 -->
	<!-- java.net.URLEncoder.encode 웹에서 한글을 바로받을수없어서 디코드로 변환해서 가져가야함 -->
	<h3>param 액션 태그</h3>
	<jsp:forward page="param01_data.jsp">
		<jsp:param name="id" value="admin" />		
		<jsp:param name="name" value='<%=java.net.URLEncoder.encode("관리자")%>' />
	</jsp:forward>
	<p>Java Server Page
</body>
</html>