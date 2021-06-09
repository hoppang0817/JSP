<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		var request = new XMLHttpRequest();
		function searchFunction() {
			request.open("Post","findId.do?c_num=${c_num}&m_name=" + encodeURIComponent(document.getElementById("name").value),true);
			request.onreadystatechange = searchProcess;
			request.send(null);
		}
		function searchProcess() {
			var table = document.getElementById("ajaxTable");
			table.innerHTML="";
			if(request.readyState == 4 && request.status == 200){
				console.log("여기");
				console.log(request.responseText);
				var object = eval("("+request.responseText +")")
				console.log("안들어오나");
				var result = object.result;
				for(var i=0; i<result.length;i++){
					var row = table.insertRow(0);
					for(var j=0; j<result[i].length;j++){
						var cell = row.insertCell(j);
						cell.innerHTML = result[i][j].value;
					}
				}
			}
			
		}
	</script>
</head>
<body>
	<div class="container">
		<form>
			<div class="form-group row">
				<label class="control-lable col-sm-3"> 회원 이름</label>
				<div class="col-sm-4">
					<input name ="c_num" type="hidden" value="${c_num}">
					<input id="name" onkeyup="searchFunction()" type="text" name="name" class="form-control">
				</div>
				<div>
				<button onclick="searchFunction()" class="btn btn-primary" type="button">검색</button>
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
			<tbody id="ajaxTable">
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>




