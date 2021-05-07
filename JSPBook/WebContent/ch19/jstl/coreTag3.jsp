<%@ page contentType="text/html; charset=UTF-8"%>
<!-- core를 사용하기위한 세팅 prefix이름은 임의로 정할수있지만 대부분 c로사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String arr1[]={"Java","JSP","Spring","Android"};
	//2020년4분기 클라우드 시장 점유율
	String str1="AWS,애저(MS);구글,아리바바;IBM";
%>

<c:set var="arr" value="<%=arr1 %>"/>
<c:forEach var="i" items="${arr}" begin="0" step="1">
${i}<br>
</c:forEach>
<hr align ="left" width="250">
<c:set var="str" value="<%=str1 %>"/>
<c:forTokens var="st" items="${str }" delims=",;">
	<b>${st }&nbsp;</b>
</c:forTokens>