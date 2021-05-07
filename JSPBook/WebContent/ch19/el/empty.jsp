<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id==null){
		//out.print("id요청이 없을때");
	}else{
		//out.print("id요청이 있을때");
	}
%>
<!-- 아이디 요청이있으며 false 없으면 true -->
id의 요청여부:${empty param.id}<br>
<a href ="empty.jsp?id=aaa">id값 요청</a> ||
<a href ="empty.jsp">id값 요청 없음</a>
