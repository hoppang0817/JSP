<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
 <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<script type="text/javascript" src="resources/js/script.js"></script>
</head>

<body>
<%	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	int result=	dao.joinIdCheck(id);
	
	if (result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('사용가능한 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");

	}else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('사용중인 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB에러')");
		script.println("history.back()");
		script.println("</script>");
	}

	%>
	<!-- 팝업창구현  
	<fieldset>
		<form action="joinCheckId.jsp" method="post" name="wfr">
			ID : <input type="text" name="userid" value="<%=id%>">
			<input type="submit" value="중복 확인">	 
		</form>
	</fieldset>
	
	 <script type="text/javascript">
    function result(){
    	opener.document.userInfo.id.value = document.wfr.userid.value;
    	opener.document.userInfo.id.readOnly=true;
    	window.close();
    }
 
 </script>-->
</body>
</html>