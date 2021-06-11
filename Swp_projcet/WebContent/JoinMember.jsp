<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>
<link rel="shortcut icon" href="./resources/img/favicon.ico"  type="image/x-icon">
<title>회원 등록</title>
</head>
<script type="text/javascript">
function chackName() {
	var name = $("#name").val();
	if(name == ""){
		 var Text ='<font>이름을 입력하세요.</font>';
			$("#chackName").text(""); //checkMessage 영역 초기화
			$("#chackName").show(); 
			$("#chackName").append(Text);
			$("#name").focus();
			
		 return false;
	}else{
			$("#chackName").text(""); //checkMessage 영역 초기화
		
	}
	
}
function chackPone() {
	var snum = $("#snum").val();
	var lnum = $("#lnum").val();
	 if(snum == "" || lnum ==""){
		 var Text ='<font>전화번호를 입력하세요.</font>';
			$("#chackPone").text(""); //checkMessage 영역 초기화
			$("#chackPone").show(); 
			$("#chackPone").append(Text);
			//$("#snum").focus();
		 return false;
	}else{
		
			$("#chackPone").text(""); //checkMessage 영역 초기화
	}
	
}
function chackEmail() {
	var email = $("#email1").val();
	if(email ==""){
		 var Text ='<font>이메일을 입력하세요.</font>';
			$("#chackEmail").text(""); //checkMessage 영역 초기화
			$("#chackEmail").show(); 
			$("#chackEmail").append(Text);
			$("#elail1").focus();
		 return false;
	}else{
			$("#chackEmail").text(""); //checkMessage 영역 초기화
	}
	
}
function chakValue() {
	var email = $("#email1").val();
	var snum = $("#snum").val();
	var lnum = $("#lnum").val();
	var name = $("#name").val();
	if(name !== "" && snum !== "" && lnum !== "" && email !== ""){
		$("#frm").submit();
	}
	
}
</script>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>회원 등록</h2>
			<br>
			<form action="joinMember.do" class="form-horizontal" method="post" id="frm" name="frm" >
			<input name="id" type="hidden" value="${id}" > 
				<%--<div class="form-group row">
					<label class="control-lable col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input name="Id" type="text" class="form-control">
					</div>
				</div>  --%>
				<div class="form-group row">
					<label class="control-lable col-sm-2">이름</label>
					<div class="col-sm-3">
						<input name="Name" id="name" type="text" class="form-control" onkeyup="chackName()">
						<span id="chackName" style="color:red"></span>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2">전화번호</label>
					<div class="col-sm-2">
						<input class="form-control" name="fnum" type="text" maxlength="3"value="010">
					</div>
						<p>-
					<div class="col-sm-2">
						<input class="form-control" name="snum" id="snum" maxlength="4" type="text" onkeyup="chackPone()">
					</div>
						<p>-
					<div class="col-sm-2">
						<input class="form-control" name="lnum" id="lnum" maxlength="4" type="text" onkeyup="chackPone()" >
					</div>
				</div>
				<div>
					<span id="chackPone" style="color:red"></span>
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
				<input type="text" name="email1" id="email1" class="form-control"maxlength="18" onkeyup="chackEmail()">
			<p>@
				<select name="email2" class="form-control">
					<option>gmail.com</option>
					<option>naver.com</option>
					<option>hanmail.net</option>
					<option>daum.net</option>
					<option>nate.com</option>
				</select>
				<span id="chackEmail" style="color:red"></span>
			</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">성별</label>
				<div class="col-sm-3">
					<input type="radio"name="sex" value='남'/>남
					<input type="radio"name="sex" value='여'/>여
				</div>
			</div>
			<br>
			<input class="btn btn-primary" type="button" value="가입하기" onclick="chakValue()">  <a href="searchList.do" class="btn btn-warning">취소</a>
			
			</form>
		</div>
	</main>
</body>
</html>
