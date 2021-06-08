<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Dao.ClassDao"%>

<% 
	String num = request.getParameter("num");
	
	//DB와 연동
	ClassDao dao = ClassDao.getInstance();
	int res = dao.checkNumLimited(num);
	int res1 = dao.totalcount(num);
	out.print(res+","+res1);

%>