<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- db연결함 jsp페이지에서는 db노출하지말자 -->
<!-- application에 담는다 application는 한번실행시 어디서든 사용가능 -->
<sql:setDataSource url="jdbc:mysql://localhost:3306/JSPBookDB?useSSL=false"
				   driver="com.mysql.jdbc.Driver"
				   user="root"
				   password="1234"
				   var="db"
				   scope="application"
/>
<sql:query var="lists" dataSource="${db}">
	select id,name from member
</sql:query>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
	</tr>
	<c:forEach var="member" items="${lists.rowsByIndex}">
		<tr>
			<c:forEach var="mem" items="${member}">
			<td>${mem}</td>
			</c:forEach>
		</tr>
	</c:forEach>
</table>
<a href="sqlTag2.jsp">UPDATE</a>