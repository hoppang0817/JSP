<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>File Upload</title>
</head>
<body>
<!-- 파일업로드를 위해post방식, enctype="multipart/form-data",action="업로드처리할 jap파일경로",input태그의 type속성을file로설정-->
	<form name="fileForm" method="post" enctype="multipart/form-data" 	action="fileupload01_process.jsp">
		<p>	이 름  : <input type="text" name="name">
		<p>	제 목 : <input type="text" name="subject">
		<p>	파 일 : <input type="file" name="filename">
		<p>	<input type="submit" value="파일 올리기">
		</p>
	</form>
</body>
</html>