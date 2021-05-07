<%@ page contentType="text/html; charset=UTF-8"%>
<!-- core를 사용하기위한 세팅 prefix이름은 임의로 정할수있지만 대부분 c로사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	response.sendRedirect("https://www.tesla.com/ko_kr");
--%>
<!-- 바로 해당 페이지로 이동된 화면이 출력됨 -->
<c:redirect url="https://www.tesla.com/ko_kr"/>