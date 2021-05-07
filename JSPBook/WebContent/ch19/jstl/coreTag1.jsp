<%@ page contentType="text/html; charset=UTF-8"%>
<!-- core를 사용하기위한 세팅 prefix이름은 임의로 정할수있지만 대부분 c로사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String str1="JAVA의 JSTL";
	String str2 = null;
	session.setAttribute("str1", str1);
%>
<!-- 4개의 저장소에 변수를 선언 -->
<!-- xml방식의 문법:반드시 열면 닫아야한다 -->
<!-- scope영역 -->
<!-- set변수선언 -->
<c:set var="str3" value="jspatudy" scope="page"/>
<c:set var="str4" value="JSTL" scope="session"/>

<!-- 변수의 출력-->
<c:out value="<%=str1 %>" default="기본출력값"/><br>
<c:out value="<%=str2 %>" default="기본출력값"/><br>
<c:out value="${str3}" default="기본출력값"/><br>

<!-- 변수를 저장소에서 삭제 -->
<c:remove var="str4"/>
<%String s = (String)pageContext.getAttribute("str3");%>
<%=s%>