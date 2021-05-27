<%@page import="Dao.StaffDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String id = request.getParameter("id");
	
	//DB와 연동
	StaffDao dao = StaffDao.getInstance();
	
	int res = dao.chackId(id);
	out.println(res);
	
%>
