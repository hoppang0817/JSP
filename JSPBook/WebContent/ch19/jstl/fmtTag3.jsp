<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="now" value="<%=new Date() %>"/>
<h3>Korea</h3>
<fmt:setLocale value="ko_kr"/>
금액:<fmt:formatNumber value="100000000000" type="currency"/><br>
일시:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><p>

<h3>Japan</h3>
<fmt:setLocale value="ja_jp"/>
금액:<fmt:formatNumber value="100000000" type="currency"/><br>
일시:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><p>


<h3>USA</h3>
<fmt:setLocale value="en_us"/>
금액:<fmt:formatNumber value="100000000000" type="currency"/><br>
일시:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><p>

<h3>France</h3>
<fmt:setLocale value="fr_fr"/>
금액:<fmt:formatNumber value="100000000000" type="currency"/><br>
일시:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><p>