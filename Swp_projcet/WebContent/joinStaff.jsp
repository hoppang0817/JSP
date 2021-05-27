<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<title>회원가입</title>
</head>
<body>
 <div class="container" style="margin-top: 70px;">
    <h2>회원가입</h2>
    <br> <br>
    <form class="form-horizontal" action="addMember.jsp" method="POST" name="userInfo" onsubmit="return checkValue()">
      <div class="form-group row">
        <label class="control-label col-sm-2">아이디</label>
        <div class="col-sm-3">
          <input id="id" name="id" type="text" class="form-control">
        <span style="color:red" id="checkMessage"></span>
        </div>
        <div class="col-sm-3">
          <button type="button" class="btn btn-primary" onclick="checkId()">중복확인</button>
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">비밀번호</label>
        <div class="col-sm-3">
          <input name="password" type="password" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">비밀번호확인</label>
        <div class="col-sm-3">
          <input name="passwordCheck" type="password" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">이름</label>
        <div class="col-sm-3">
          <input name="name" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">전화번호</label>
        <div class="col-sm-3">
          <input name="phone" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">주소</label>
        <div class="col-sm-4">
           <input type="text" id="post_code" name="zipcode" readonly size="10" class="form-control" placeholder="우편번호">
			<input type="text" id="address1" name="address1" size="50" class="form-control" placeholder="주소">
			<input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소">
		</div>
		<div class="col-sm-3">
			<input type="button" onclick="showPostcode()" value="우편번호 찾기">
		</div>	
      </div>
      <br>
      <input type="submit" class="btn btn-primary " value="가입하기"> <a href="Login.jsp" class="btn btn-danger">취소</a>
      
    </form>
  </div>
<script type="text/javascript">
function checkId(){
	var id = $("#id").val();
	$.ajax({ 
			type : 'POST', //데이터 전송 방식
			url : 'checkId.jsp',
			data : {id : id},
			datatype : "jsp",
			//통신이 성공할경우 결과값 (data)에 저장
			success : function(data){
				if(data == 1){ //아이디가 중복이 아닌경우
					var Text ='<font color ="green">사용할 수 있는 아이디입니다.</font>';
					$("#checkMessage").text(""); //checkMessage 영역 초기화
					$("#checkMessage").show(); 
					$("#checkMessage").append(Text);
					$("#id").focus();
					return false;
					} 
				else{ //아이디가 중복일 경우
					var Text ='<font color ="red">사용할수 없는 아이디입니다.</font>';
					$("#checkMessage").text("");
					$("#checkMessage").show();
					$("#checkMessage").append(Text);
					$("#id").focus();
					return false;
				}
				},
				  error : function(error){
					  alert("error : " + error);
				  }
			});//ajax end
		}


</script>
</body>
</html>