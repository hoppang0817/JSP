<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String id = request.getParameter("id");
	
	//DB와 연동
	MemberDao dao = MemberDao.getInstance();
	
	int res = dao.checkMemberid(id);
	out.println(res);
	
%>
