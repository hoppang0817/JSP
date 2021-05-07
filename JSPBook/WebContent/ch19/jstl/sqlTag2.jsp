<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:update dataSource="${db}">
	update member set name=? where id=?
	<sql:param value="${'손오공'}"/>
	<sql:param value="${'aaa'}"/>
</sql:update>

<a href="sqlTag1.jsp">SELECT</a>