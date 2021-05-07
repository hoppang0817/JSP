<%@ page contentType="text/html; charset=UTF-8"%>
<!-- core를 사용하기위한 세팅 prefix이름은 임의로 정할수있지만 대부분 c로사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="http://localhost/JSPBook/ch19/jstl/coreTag2.jsp">
	<c:param name="id" value="aaa"/>
	<c:param name="color" value="blue"/>
	<c:param name="msg" value="테스트"/>
</c:import>
<hr width="300" color="red" align="left">
<c:url var="url1" value="https://googel.com">
	<c:param name="q" value="jspsudy"/>
	<c:param name="safe" value="off"/>
</c:url>
<a href="${url1}">구글에서 jspstudy검색</a>