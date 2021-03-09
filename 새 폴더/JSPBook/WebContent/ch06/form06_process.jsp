<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*,java.util.*"%>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			
		//한번에 처리하기위해 파라메터들의 이름들을 저장
			Enumeration paramNames = request.getParameterNames();
		//더 꺼낼 아이템(이름)이 있으면 계속 없으면 중단
			while (paramNames.hasMoreElements()) {
				//넥스트엘러먼트 메소드로 다음 이름을 가져온다.
				String name = (String) paramNames.nextElement();
				out.print("<tr><td>" + name + " </td>\n");
				//가져온 이름으로 그 값을 불러온다.
				String paramValue = request.getParameter(name);
				out.println("<td> " + paramValue + "</td></tr>\n");
			}
		%>
	</table>
</body>
</html>