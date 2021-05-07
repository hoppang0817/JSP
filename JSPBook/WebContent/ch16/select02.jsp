<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>                   
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>				
	<table width="300" border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%
			//결과를 나타내는 객체 rs 추가
			ResultSet rs = null;
			//쿼리문을 실행하는 pstmt객체
			PreparedStatement pstmt = null;

			try {
				String sql = "select * from member";
				//pstmt준비
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();//실행할때 결과가 있으면 Query() 없으면 UPdate

				//rs.next() : 다음 행이 있는경우 true없으면 false
				while (rs.next()) {
					String id = rs.getString("id");
					String pw = rs.getString("passwd");
					String name = rs.getString("name");
		%>
		<tr>
			<td><%=id%></td>
			<td><%=pw%></td>
			<td><%=name%></td>
		</tr>
		<%
				}
			} catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} finally {//연결종료 순서rs->pstmt->conn
				if (rs != null) //널값이 아닐때 종료
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
		%>
	</table>
</body>
</html>
