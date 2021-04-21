<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="model.BoardDTO"%>
<%
	//String sessionId=(Stirng) session.getAttribute("sessionId");
	List boardList = (List)request.getAttribute("boardList");
	int total_record = ((Integer)request.getAttribute("total_record")).intValue();
	int pageNum =((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="containner">
		<form action="<c:url value=".BoardListAction.do"/>" method="post">
			<div>
				<div class="tect-right">
					<span class="badge badge-success">전체 건</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						for(int j=0;j<boardList.size();j++){
							BoardDTO notice= (BoardDTO) boardList.get(j);
			
					%>
					<tr>
						<td>
					</tr>
					<%
						}
					%>
				</table>

			</div>
		</form>
	</div>


</body>
</html>