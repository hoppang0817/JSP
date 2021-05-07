<%@ page contentType="text/html; charset=UTF-8"%>
<!-- core를 사용하기위한 세팅 prefix이름은 임의로 정할수있지만 대부분 c로사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//post방식 한글 처리
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String color = request.getParameter("color");
	String msg = request.getParameter("msg");
%>
<%--<%=msg--%>
<!-- if태그 -->
<c:if test="${param.id!=null }">
	<b>${param.id}</b>
</c:if>
<c:if test="${param.id ==null }">
	<b>Guest</b>
</c:if>
<c:choose>
	<c:when test="${param.color=='yellow' }">
		<c:set var="c" value="노란색"/>
	</c:when>
	<c:when test="${param.color=='blue' }">
		<c:set var="c" value="파란색"/>
	</c:when>
	<c:when test="${param.color=='orange' }">
		<c:set var="c" value="주황색"/>
	</c:when>
	<c:when test="${param.color=='pink' }">
		<c:set var="c" value="분홍색"/>
	</c:when>
	<c:otherwise>
		<c:set var="c" value="검은색"/>
	</c:otherwise>
</c:choose>
님이 좋아하는 색상은 <font color="${param.color }">${c}</font>입니다<br>
msg:${param.msg}