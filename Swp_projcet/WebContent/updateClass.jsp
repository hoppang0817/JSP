<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>수업 수정</h2>
			<br>
			<form action="updateClass.do" name="updateClass" class="form-horizontal"
				method="post">
				<input type="hidden" name="num" value="${classView.c_num}">
				<div class="form-group row">
					<label class="control-lable col-sm-2">수업명</label>
					<div class="col-sm-3">
						<input class="form-control" name="className" type="text" value="${classView.c_name }">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2">인원수</label>
					<div class="col-sm-3">
						<input class="form-control" name="classCount" type="text" value="${classView.c_limitedNum }">
					</div>
				</div>

				<div class="form-group row">
					<label class="cntrol-lable col-sm-2">수업 시간</label>
					<div class="col-sm-2">
						<input class="form-control" name="timeHour" type="text" value="${classView.timeHour }">
					</div>
					<p>:
					<div class="col-sm-2">
						<input class="form-control" name="timeMinute" type="text" value="${classView.timeMinute }">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2">등급</label>
					<div class="col-sm-4">
						<select class="form-control" name="grade">
							<option value="초급">초급</option>
							<option value="중급">중급</option>
							<option value="고급">고급</option>
						</select>
						<script type="text/javascript">
						updateClass.grade.value = "${classView.c_grade}"
						</script>
					</div>
				</div>
				<input class="btn btn-primary" type="submit" value="등록"> <a href="ClassList.do" class="btn btn-warning">취소</a>
			</form>
		</div>
	</main>

</body>
</html>