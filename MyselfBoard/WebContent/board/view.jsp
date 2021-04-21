<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.BoardDTO"%>
<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
int num = ((Integer) request.getAttribute("num")).intValue();
int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newUpdate" action="BoardUpdateAction.do?num<%=notice.getNum()%>&pageNum=<%=nowpage%>"
			class="form-horizontal" method="post">
		<div class="form-group row">
			<label class="col-sm-2 control-lable">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control" value="<%=notice.getName()%>">
			</div>
		</div>	
		<div class="form-froup-fow">
			<label class="col-sm-2 control-lable">제목</label>
			<div class="col-sm-5">
				<input name="subject" class="form-control" value="<%=notice.getSubject()%>">
			</div>
		</div>
		<div class="form-froup-fow">
			<label class="col-sm-2 control-lable">내용</label>
			<div class="col-sm-8" style="word-break:break-all;">
				<texetarea name="content" class="form-contal" cols="50" rows="5"><%=notice.getContent()%></texetarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-am-10">
				<c:set var="userId" value="<%=notice.getId()%>"/>
				<c:if tese="${sessionId == userId}">
				<p>
				<a href="./BardDeleteAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage%>"class="btn btn-danger">삭제</a>
				<input type="submit" class="btn btn-success" value="수정">
				</c:if>
				<a href="./BoardListAction.do?pageNum<%=nowpage%>" class="btn btn-primary">목록</a>
				
			</div>
		</div>
		</form>
		<hr>
	</div>
</body>
</html>