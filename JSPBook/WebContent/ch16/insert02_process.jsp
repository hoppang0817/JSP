<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	PreparedStatement pstmt = null;

	try {
		String sql = "insert into member(id, passwd, name) values(?,?,?)";
		//pstmt는 conn객체에 sql문으 넣어서 준비한다.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);//1번째물음표
		pstmt.setString(2, passwd);//2번째
		pstmt.setString(3, name);//3번째
		pstmt.executeUpdate(); //실행
		out.println("Member 테이블  삽입이 성공했습니다.");
	} catch (SQLException ex) {
		out.println("Member 테이블 삽입이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>
</body>
</html>
