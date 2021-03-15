<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>
<%@ page errorPage="exceptionNoBook.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="resources/css/bootstrap.min.css">
<title>books</title>
	<script>
		function check(){
			if(confirm("장바구니에 추가하시겠습니까?")){
				document.addForm.submit();
			}else{
				document.addForm.reset();
			}
	
		}
	</script>
</head>
<body>
	<%@include file="nav.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao =  BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
		<div class="col-md-5">
		<img style="width:100%" src="/upload/<%=book.getFilename()%>">
		</div>
			<div class="col-md-6">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p><b>상품 코드 :</b> <span class="badge badge-danger"><%=book.getBookId()%></span>
				<p><b>출판사</b> : <%=book.getPublisher()%>
				<p><b>출판일</b> : <%=book.getReleaseDate() %>
				<p><b>저자</b> : <%=book.getAuthor() %>
				<p><b>분류</b> : <%=book.getCategory() %>
				<p><b>재고수</b> : <%=book.getUnitsInStock() %>
				<p><b>도서 상태</b> : <%=book.getCondition() %>
				<h4><%=book.getUnitPrice() %>원</h4>
				<p><form name="addForm" action="addCart.jsp?id=<%=book.getBookId() %>" method="post"/>
				<a href="#" class="btn btn-info" onclick="check()">상품 주문&raquo;</a> 
				<a href="cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
				<a href="./Book.jsp" class = "btn btn-secondary">상품 목록&raquo;</a>
			</div>

		</div>
		<hr>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>