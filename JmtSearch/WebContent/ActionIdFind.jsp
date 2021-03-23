<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String email = request.getParameter("email");

MemberDAO userDAO = new MemberDAO(); //인스턴스생성;

String find_id = userDAO.findid(name, email);

if (find_id == null) {
	out.println("<script>");
	out.println("alert('아이디를 찾을 수 없습니다.')");
	out.println("history.back()");
	out.println("</script>");
} else {
	out.println("<script>");
	out.println("alert('아이디는 " + find_id + "입니다.')");
	out.println("location.href=('Login.jsp')");
	out.println("</script>");
}
%>
