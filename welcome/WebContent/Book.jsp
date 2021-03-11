<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="resources/css/bootstrap.min.css">
<title>book</title>
</head>
<body>
	<%@include file="nav.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
		BookRepository dao =  BookRepository.getInstance();
		ArrayList<Book> listOfBook = dao.getAllBooks();
	%>
	<div class="container">
		<div class="row" class="text-center">
			<%
				for (int i = 0; i < listOfBook.size(); i++) {
				Book book = listOfBook.get(i);
			%>
			<div>
				<img style="width:50%;" src="/upload/<%=book.getFilename()%>">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원
				<p><a href = "./Books.jsp?id=<%=book.getBookId() %>" class="btn btn-primary" role="button">상세 정보&raquo;</a>
				<hr>
			</div>
			<%
				}
			%>

		</div>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>