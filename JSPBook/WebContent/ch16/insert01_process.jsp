<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<!-- 커넥션 객체 만들기까지 완료(DB연결) -->
<%@ include file="dbconn.jsp" %>
<%
		request.setCharacterEncoding("utf-8");
		//파라메터로 넘어온 아이디 패스워드 네임
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");

		Statement stmt = null;

		try {
			String sql = "INSERT INTO Member(id, passwd, name) VALUES('" + id + "','" + passwd + "', '" + name + "')";
			//4.퀴리문을 실행하기 위한 객체 생성
			stmt = conn.createStatement();
			//5.쿼리실행
			stmt.executeUpdate(sql);//테이블 입력문 
			out.println("Member 테이블 삽입이 성공했습니다.");
		} catch (SQLException ex) {
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} finally {//DB연결을 끊고 그전에 sql객체도 종료
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>
	