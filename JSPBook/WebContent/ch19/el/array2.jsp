<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<String>arr = new ArrayList<String>();
	String arr1[]={"java","jsp","spring","android"};
	for (int i=0;i<arr1.length;i++){
		arr.add(arr1[i]);
	}
	pageContext.setAttribute("study", arr);
%>

1.${study[0]}<br>
2.${study[1]}<br>
3.${study[2]}<br>
4.${study[3]}<br>