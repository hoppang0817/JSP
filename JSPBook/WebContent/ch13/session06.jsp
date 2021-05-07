<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<title>Session</title>
</head>
<body>
	<p> <h4>----- 세션을 삭제하기 전 -----</h4>
	<%
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션 이름 userID : " + user_id + "<br>");
		out.println("설정된 세션 값 userPW : " + user_pw + "<br>");
		
		if (request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다.");
		}else {

			out.print("세션이 유효하지 않습니다.");
		}		
	
		//모든세션에 저장된 내용을 초기화한다
		session.invalidate();//모든 내용 삭제
	%>
	<p> <h4>----- 세션을 삭제한 후 -----</h4>
	<%		
		if (request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다.");
		}else {

			out.print("세션이 유효하지 않습니다.");
		}
	%>
</body>
</html>