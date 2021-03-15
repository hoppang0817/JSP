<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<%
	String cartId = session.getId();
%>	<jsp:include page="nav.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table>
				<tr>
					<th align="left"><a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
					<th align="right"><a href="shippinglnfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
				</tr>	
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-haver">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소개</th>
					<th>비고</th>
				</tr>
			<%
				int sum =0;
				ArrayList<Book> cartlist = (ArrayList<Book>)session.getAttribute("cartlist");
				if(cartlist == null)
					cartlist = new ArrayList<Book>();
				
				for(int i=0;i<cartlist.size();i++){
					Book book = cartlist.get(i);
					int total = book.getUnitPrice()*book.getQuantity();
					sum = sum + total;
			%>
				<tr>
					<td><%=book.getBookId() %> - <%=book.getName() %></td>
					<td><%=book.getUnitPrice() %></td>
					<td><%=book.getUnitsInStock() %></td>
					<td><%=book.getQuantity() %></td>
					<td><a href="removeCart.jsp?id=<%=book.getBookId()%>" class="btn btn-danger">삭제</a>
				</tr>
				
				<%
				}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
		</table>
		<a href="Book.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>