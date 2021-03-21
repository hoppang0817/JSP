<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
	String addr = request.getParameter("addr");

	PreparedStatement pstmt = null;
	
	String sql ="insert into member values(?,?,?,?,?,?,?,?,null,null)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, age);
	pstmt.setString(6, phone);
	pstmt.setString(7, email);
	pstmt.setString(8, addr);
	pstmt.executeUpdate();
	
	response.sendRedirect("Login.jsp");
	
%>