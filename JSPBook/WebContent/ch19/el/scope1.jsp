<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int sum =0;
	for(int i=0;i<11;i++){
		sum+=i;
	}
	//Auto Boxing(5.0추가)->자바 기본형(8)->object 형식으로 자동 변환해줌
	request.setAttribute("sum", sum);
%>

<!--forward는 현재페이지에서의 데이터와 함께 다른페이지로 전달 -->
<jsp:forward page="scope2.jsp"/>