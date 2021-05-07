<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="now" value="<%=new Date() %>"/>
<h3>Korea</h3>
날짜:<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
시간:<fmt:formatDate value="${now}" type="time"/><p>

<h3>London</h3>
<fmt:setTimeZone value="Europe/London"/>
날짜:<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
시간:<fmt:formatDate value="${now}" type="time"/><p>

<h3>홍콩</h3>
<fmt:setTimeZone value="Asia/Hong_Kong"/>
날짜:<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
시간:<fmt:formatDate value="${now}" type="time"/><p>
<h3>뉴욕</h3>
<fmt:setTimeZone value="America/New_York"/>
날짜:<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
시간:<fmt:formatDate value="${now}" type="time"/><p>
<h3>베를린</h3>
<fmt:setTimeZone value="Europe/Berlin"/>
날짜:<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
시간:<fmt:formatDate value="${now}" type="time"/><p>
<h3>LA</h3>
<fmt:setTimeZone value="America/Los_Angeles"/>
날짜:<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
시간:<fmt:formatDate value="${now}" type="time"/><p>