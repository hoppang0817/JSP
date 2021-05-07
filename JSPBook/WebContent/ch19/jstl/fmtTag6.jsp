<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en"/> 
<!-- 언어 변경시-->
<fmt:setBundle basename="jstl.Intro"/>
<h3><fmt:message key="TITLE"/></h3>
<fmt:message key="GREETING"/><p>
<fmt:message key="BODY"/><p>
<fmt:message key="COMPANY_NAME"/><p>