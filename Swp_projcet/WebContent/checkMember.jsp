<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>출석 체크</h2>
			<br>
			<form method="post" class="form-horizontal" action="checkMember.do">
			<div class="form-group row">
				<label class="control-lable col-sm-1"> 회원번호  </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="m_id">
				</div>
					<button type="submit" class="btn btn-primary">확인</button>
			</div>
			</form>
		</div>
	</main>

</body>
</html>