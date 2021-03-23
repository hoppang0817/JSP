<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>


<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		MemberDAO dao = new MemberDAO(); //인스턴스생성

		int result = dao.login(id, pw);

		

		//로그인 성공

		if(result == 1){

			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('로그인성공')");
			script.println("location.href=('index.jsp')");
			script.println("</script>");
			session.setAttribute("sessionId", id);
		}

		//로그인 실패

		else if(result == 0){

			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");

		}

		//아이디 없음

		else if(result == -1){

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");

		}

		//DB오류

		else if(result == -2){

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");

		}		

	

	%>


