<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>회원 수정</h2>
			<br>
			<form action="updateMember.do" class="form-horizontal" name="update" method="post">
				<input type="hidden" name="Id" value="${MemberView.m_id}">
				<div class="form-group row">
					<label class="contral-label col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="Name" value="${MemberView.m_name}">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2">전화번호</label>
					<div class="col-sm-2">
						<input class="form-control" name="fnum" type="text" maxlength="3"value="010">
					</div>
						<p>-
					<div class="col-sm-2">
						<input class="form-control" name="snum" maxlength="4" type="text" value="${MemberView.m_phone}">
					</div>
						<p>-
					<div class="col-sm-2">
						<input class="form-control" name="lnum" maxlength="4"type="text" value="${MemberView.lnum}">
					</div>
				</div>
				<div class="form-group row">
			<label class="control-lable col-sm-2">주소</label>
			<div class="col-sm-4">
				<input type="text" id="post_code" name="post_code" class="form-control"value="${MemberView.postCoed}"placeholder="우편번호">
				<input type="text" id="address1" name="address1" class="form-control" value="${MemberView.m_arrd}"placeholder="주소">
				<input type="text" id="address2" name="address2" class="form-control" value="${MemberView.arrd1 }" placeholder="상세주소">
			</div>
			<div class="col-sm-3 col-sm-offset-3">
				<input type="button" onclick="showPostcode()"class="form-control" value="우편번호 찾기"><br>
			</div>
			</div>
			<div class="form-group row">
			<label class="control-lable col-sm-2">이메일</label>
			<div class="col-sm-5">
				<input type="text" name="email1" class="form-control"maxlength="18" value="${MemberView.m_email}">
			<p>@
				<select name="email2" class="form-control" id="email2">
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
				</select>
				<script type="text/javascript">
				update.email2.value = "${MemberView.email2}"
				</script>
				
			</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">성별</label>
				<div class="col-sm-3">
				<%-- <c:if test ="${MemberView.m_sex eq '남'}">checked="checked"</c:if> 만약 test가 qu(equls)이면 체크--%>
					<input type="radio"name="sex" value='남'<c:if test ="${MemberView.m_sex eq '남'}">checked="checked"</c:if>/>남
					<input type="radio"name="sex" value='여'<c:if test ="${MemberView.m_sex eq '여'}">checked="checked"</c:if>/>여
				</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">수강 수업</label>
				<div class="col-sm-3">
				   <input type="text" name="classNum" class="form-control" value="${MemberView.c_num}">
				</div>
			</div>
				<br>
			<input class="btn btn-primary" type="submit" value="수정하기"> <a href="MemberList.do" class="btn btn-warning">취소</a>
			</form>
		</div>
	</main>
</body>
</html>