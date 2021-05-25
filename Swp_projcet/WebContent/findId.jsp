<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form>
			<div class="form-group row">
				<label class="control-lable col-sm-3"> 회원 이름</label>
				<div class="col-sm-4">
					<input id="name" type="text" name="name" class="form-control">
				</div>
				<div>
				<button id="btn_search" class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
		<div id="div1" class="container">
			<table class="table table-hover">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원 이름</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.m_id}</td>
				</tr>
			
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#btn_search").click(function() {
			console.log(params);
			$.ajax({
				url:'/findId.do',
				console.log(url),
				type:'GET',
				date:{name:$("#name").val()},
				success:function(data){
				    alert("가져온 데이터 입니다 . "+data);
					
			})
			
		})
	});
	</script>
</body>
</html>
