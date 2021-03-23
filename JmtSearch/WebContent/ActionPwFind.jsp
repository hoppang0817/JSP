<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
String email = request.getParameter("email");

MemberDAO userDAO = new MemberDAO(); //인스턴스생성;

String find_pw = userDAO.findpw(name, id, email);

if (find_pw == null) {
	out.println("<script>");
	out.println("alert('존재하지 않는 회원입니다')");
	out.println("history.back()");
	out.println("</script>");
} else {
	out.println("<script>");
	out.println("alert('비밀번호는 " + find_pw + "입니다.')");
	out.println("location.href=('Login.jsp')");
	out.println("</script>");
}
%>
