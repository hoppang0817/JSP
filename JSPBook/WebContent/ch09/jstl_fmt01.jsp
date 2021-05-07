<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Internationalization</title>
</head>
<body>
<!-- 자동번역X -->
	<p>	--------기본 로케일--------
		<fmt:setBundle basename="ch09.com.bundle.myBundle"/>
	<p>	제목 :<fmt:message key="title" />
	<p> 이름 :<fmt:message key="username" var="userMsg" />
	
		
	<p>	--------영문 로케일 --------
		<fmt:setLocale value="en" />
		<fmt:setBundle basename="ch09.com.bundle.myBundle" />
	<p>	제목 :<fmt:message key="title"  />
	<p>	이름 :<fmt:message key="username" />
</body>
</html>