<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.bDto" %>
<%@ page import="dao.BDao" %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
<body>
	<% 
		BDao dao = new BDao();
		int count = dao.selectCnt("mvc_board"); // 전체행 갯수
		String tempStart = request.getParameter("page");
		// 현재 페이지를 받아옴 
		int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=3; // 한페이지에 출력할 행의 갯수
		
		count = (int)Math.ceil((double)count/(double)onePageCnt);
		// 페이지 수 저장
		
		if(tempStart != null){ // 처음에는 실행되지 않는다.
			startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		}
		
		ArrayList<bDto> v = dao.selectPage("mvc_board", startPage, onePageCnt);
	%>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<%	
		for(int i=0; i<v.size(); i++){
			%>
			<tr>
				<td><%= v.get(i).getbId()%></td>
				<td><%= v.get(i).getbName()%></td>
				<td><a href="content_view.do?bId=<%= v.get(i).getbId()%>"><%= v.get(i).getbTitle() %></a></td>
				<td><%= v.get(i).getbDate() %></td>
				<td><%= v.get(i).getbHit()%></td>
			</tr>
	
		<% } %>
		
		<tr>
			<td clospan="5"><a href="write_view.do">글작성</a></td>
		</tr>
	</table><br>
		<%
		for(int i=1; i<=count; i++){ %>
			
			<a href="list.jsp?page=<%=i %>">[<%=i%>]
			</a>
		<% }; %>
	
	<br>

</body>
</html>