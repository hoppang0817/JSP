<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="num" value="123456789"/>
숫자:<fmt:formatNumber value="${num}" type="number"/><br>
페센트:<fmt:formatNumber value="${num}" type="percent" groupingUsed="false"/><br>
달러:<fmt:formatNumber value="${num}" type="currency" currencySymbol="$"/><br>
패턴:<fmt:formatNumber value="${num}" pattern="0.000"/><br>
<fmt:parseNumber var="i" integerOnly="true" value="123.456"/>
실수를 제외한 정수:<c:out value="${i}"/>