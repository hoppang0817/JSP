<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script>
    function checkValue() {
      if (!document.userInfo.id.value) {
        alert("아이디를 입력하세요.");
        return false;
      }
      if (!document.userInfo.password.value) {
        alert("비밀번호를 입력하세요.")
        return false;
      }
      if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
        alert("비밀번호를 동일하게 입력하세요.")
        return false;
      }
    }
 </script>
<title>회원가입</title>
</head>
<body>
 <div class="container" style="margin-top: 70px;">
    <h2>회원가입</h2>
    <br> <br>
    <form class="form-horizontal" action="" method="POST" name="userInfo" onsubmit="return checkValue()">
      <div class="form-group row">
        <label class="control-label col-sm-2">아이디</label>
        <div class="col-sm-3">
          <input name="id" type="text" class="form-control">
        </div>
        <div class="col-sm-3">
          <button type="button" class="btn btn-primary" onclick="">중복확인</button>
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
        <label class="control-label col-sm-2">나이</label>
        <div class="col-sm-3">
          <input name="age" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">성별</label>
        <div class="col-sm-3">
          <input name="gender" type="radio" value="남" />남
          <input name="gender" type="radio" value="여" />여
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">전화번호</label>
        <div class="col-sm-3">
          <input name="phone" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">이메일</label>
        <div class="col-sm-10">
          <input name="email1" type="text" maxlength="50">@ <select name="email2">
            <option>gmail.com</option>
            <option>naver.com</option>
            <option>hanmail.net</option>
            <option>daum.net</option>
            <option>nate.com</option>
          </select>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">주소</label>
        <div class="col-sm-3">
          <input name="addr" type="text" class="form-control">
        </div>
      </div>
      <input type="submit" class="btn btn-primary " value="가입하기"> <a href="Login.jsp" class="btn btn-danger">취소</a>
      
    </form>
  </div>
</body>
</html>