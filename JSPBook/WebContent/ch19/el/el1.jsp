<%@ page contentType="text/html; charset=UTF-8"
		  isELIgnored="false"	
%>

<%
	
	//저장소 : page,request,session,application
	request.setAttribute("siteName", "JSPstudy.co.kr");
%>
사이트명 : <%=request.getAttribute("siteName") %><br>
사이트명 : ${siteName}
