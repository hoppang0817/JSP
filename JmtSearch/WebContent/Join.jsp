<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/script.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />
   <!-- swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <!-- 사용자 정의 css -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/swiper.css">

	<!-- date css -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
    <link rel="stylesheet" href="resources/css/bootstrap-material-datetimepicker.css" />
    
    <!-- 구글폰트 -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.3.min.js"
        integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
    <script type="text/javascript"
        src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
    <script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
    
    <script type="text/javascript" src="resources/js/bootstrap-material-datetimepicker.js"></script>
<title>회원가입</title>
</head>
<body>
<jsp:include page="header.jsp" />
 <div class="container" style="margin-top: 70px;">
    <h2>회원가입</h2>
    <br> <br>
    <form class="form-horizontal" action="addMember.jsp" method="POST" name="userInfo" onsubmit="return checkValue()">
      <div class="form-group row">
        <label class="control-label col-sm-2">아이디</label>
        <div class="col-sm-3">
          <input name="id" type="text" class="form-control">
        </div>
        <div class="col-sm-3">
          <button type="button" class="btn btn-primary" onclick="return checkId()">중복확인</button>
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
          <input name="age" type="text" class="form-control" maxlength="2">
        </div>
      </div>
      <div class="form-group row">
        <label class="control-label col-sm-2">성별</label>
        <div class="col-sm-3">
          <input name="gender" type="radio" value="남" checked />남
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
  <%@ include file="footer.jsp" %>
	
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="resources/js/header.js"></script>
    <script src="resources/js/swiper.js"></script>
    <script src="resources/js/DatePicker.js"></script>
</body>
</html>