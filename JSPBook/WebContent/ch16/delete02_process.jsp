<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<!-- DB연결
 -->
<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "select id, passwd from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {//아이디가 일치하는 행이 있을경우
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				//아이디 패스워드 검사
				if (id.equals(rId) && passwd.equals(rPasswd)) {
					sql = "delete from member where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);//해당 아이디의 행을 삭제한다
					pstmt.executeUpdate(); //실행
					out.println("Member 테이블을 삭제했습니다.");
				} else
					out.println("일치하는 비밀번호가 아닙니다");
			} else
				out.println("Member 테이블에 일치하는 아이디가 없습니다.");
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>