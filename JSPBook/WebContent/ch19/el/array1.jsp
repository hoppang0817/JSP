<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String arr[]={"java","jsp","spring","android"};
	request.setAttribute("study", arr);
%>
1.${study[0]}<br>
2.${study[1]}<br>
3.${study[2]}<br>
4.${study[3]}<br>