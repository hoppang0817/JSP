<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="BookDAO" class="dao.BookRepository" scope="session" />

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="resources/css/bootstrap.min.css">
<title>addBook</title>
</head>
<body>
	<%@include file="nav.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 등록</h1>
		</div>
	</div>

	<div class="container">
		<form action="./processAddBook.jsp" name="newbook" method="post"
			class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">도서코드</label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">저자</label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판일</label>
				<div class="col-sm-3">
					<input type="date" max="9999-12-31" name="releaseDate"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">총페이지수</label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-4">
					<textarea name="description" cols="50" row="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-4">
					<input type="radio" name="condition" value="New">신규도서 <input
						type="radio" name="condition" value="Old">중고도서 <input
						type="radio" name="condition" value="On-line">E-Book
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록" >
				</div>
			</div>
		</form>
	</div>


</body>
</html>