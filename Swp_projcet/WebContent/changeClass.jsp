<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>반 변경</h2>
		</div>

		<div class="container">
			<form method="post" id ="c_form"class="form-horizontal" action="changeClass.do">
				<div class="form-group row">
					<label class="control-lable col-sm-2"> 회원번호 </label>
					<div class="col-sm-3">
						<input type="text" class="form-control" onkeyup="test()" id="m_id"
							name="m_id"> <span style="color: red" id="checkMessage"></span>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2"> 변경할 수업번호 </label>
					<div class="col-sm-4">
						<input type="text" class="form-control" onkeyup="test()"
							id="c_num" name="c_num"> <span style="color: red"
							id="checkMessage1"></span>
					</div>
					<button class="btn btn-primary" type="button" onclick="test1()">변경</button>
				</div>
			</form>
		</div>
		<div class="container">
			<table class="table table-hover w-auto">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>수강 수업</th>
						<th>시작일</th>
						<th>마지막일</th>
						<th>반번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mdto">
						<tr>
							<td>${mdto.m_id}</td>
							<td>${mdto.m_name}</td>
							<td>${mdto.m_phone}</td>
							<td>${mdto.c_num}</td>
							<td>${mdto.startDate}</td>
							<td>${mdto.endDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	<script type="text/javascript">
		function test() {
		var num = $('#c_num').val();
		var id = $('#m_id').val();
			if (id == "") {
				var Text = '<font>회원번호를 입력하세요.</font>';
				$("#checkMessage").text(""); //checkMessage 영역 초기화
				$("#checkMessage").show();
				$("#checkMessage").append(Text);
				$("#id").focus();
				return false;
			} else if (num == "") {
				var Text = '<font>변경할 수업번호를 입력하세요.</font>';
				$("#checkMessage1").text(""); //checkMessage 영역 초기화
				$("#checkMessage1").show();
				$("#checkMessage1").append(Text);
				$("#id").focus();
				return false;
			} else {
				$("#checkMessage").text("");
				$("#checkMessage1").text("");
			}

		}
		
		function test1() {
			var num = $('#c_num').val();
			$.ajax({
				type : 'POST', //데이터 전송 방식
				url : 'test.jsp',
				data : {
					num : num
				},
				datatype : "jsp",
				success : function(data) {
					var items = data.split(',');
					var item = items[0].replace(/(\r\n\r\n\r\n)/g,"");
					console.log(items);
					if (item == items[1] || item < items[1]) {
						console.log("마져");
						alert("변경불과(인원초과)");
						return false;
					} else {
						$("#c_form").submit();
					}
				}
			})

		}
	</script>
</body>
</html>
