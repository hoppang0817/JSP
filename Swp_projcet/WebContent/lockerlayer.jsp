<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="inputUesr.do" class="form-horizontal">
	<input type="hidden" name="l_num" value="${l_num}">
			<div class="form-group row">
				<label class="control-lable col-sm-3"> 회원번호  </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="m_id">
				</div>
			<button class="btn btn-primary" type="submit">확인</button>
			</div>
	</form>
</body>
</html>