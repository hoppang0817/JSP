<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>
<title>회원 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>회원 등록</h2>
			<br>
			<form action="joinMember.do" class="form-horizontal" method="post">
				<%--<div class="form-group row">
					<label class="control-lable col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input name="Id" type="text" class="form-control">
					</div>
				</div>  --%>
				<div class="form-group row">
					<label class="control-lable col-sm-2">이름</label>
					<div class="col-sm-3">
						<input name="Name" type="text" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2">전화번호</label>
					<div class="col-sm-2">
						<input class="form-control" name="fnum" type="text" maxlength="3"value="010">
					</div>
						<p>-
					<div class="col-sm-2">
						<input class="form-control" name="snum" maxlength="4" type="text">
					</div>
						<p>-
					<div class="col-sm-2">
						<input class="form-control" name="lnum" maxlength="4" type="text">
					</div>
				</div>
			<div class="form-group row">
			<label class="control-lable col-sm-2">주소</label>
			<div class="col-sm-4">
				<input type="text" id="post_code" name="post_code" class="form-control"placeholder="우편번호">
				<input type="text" id="address1" name="address1" class="form-control" placeholder="주소">
				<input type="text" id="address2" name="address2" class="form-control"  placeholder="상세주소">
			</div>
			<div class="col-sm-3 col-sm-offset-3">
				<input type="button" onclick="showPostcode()"class="form-control" value="우편번호 찾기"><br>
			</div>
			</div>
			<div class="form-group row">
			<label class="control-lable col-sm-2">이메일</label>
			<div class="col-sm-5">
				<input type="text" name="email1" class="form-control"maxlength="18">
			<p>@
				<select name="email2" class="form-control">
					<option>gmail.com</option>
					<option>naver.com</option>
					<option>hanmail.net</option>
					<option>daum.net</option>
					<option>nate.com</option>
				</select>
				
			</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">성별</label>
				<div class="col-sm-3">
					<input type="radio"name="sex" value='남'/>남
					<input type="radio"name="sex" value='여'/>여
				</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">수강 수업</label>
				<div class="col-sm-3">
				   <input type="text" name="classNum" class="form-control">
				</div>
			</div>
			<br>
			<input class="btn btn-primary" type="submit" value="가입하기">  <a href="menu.jsp" class="btn btn-warning">취소</a>
			
			</form>
		</div>
	</main>
</body>
</html>