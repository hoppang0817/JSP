<%@ page contentType="text/html; charset=UTF-8"%>
<!-- core를 사용하기위한 세팅 prefix이름은 임의로 정할수있지만 대부분 c로사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="ex">
	<%
		int arr[]={1,2,3};
		int sum = arr[0]+arr[3];
	%>
</c:catch>
${ex}