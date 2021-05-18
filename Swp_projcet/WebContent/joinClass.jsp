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
			<h2>수업 신청</h2>
			<br>
			<form action="joinClass.do?c_num=${c_num}" method="post" class="form-horizontal">
				<div class="form-group row">
					<label class="control-lable col-sm-2"> 회원 번호</label>
					<div class="col-sm-3">
					   <input type="text" name="Id"	class="form-control">
					 </div>
					 <div>
					<a class="ls-modal btn btn-primary" data-toggle="modal" data-target="#modal" href="findId.jsp">검색</a>
					<input class ="btn btn-primary" type="submit" value="신청">
					</div>
				</div>
			</form>
			
				<!-- Modal -->
			<div class="modal fade" id="modal" >
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<h4 class="modal-title">회원 검색</h4>
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
						</div>
						
						<!-- body -->
						<div class="modal-body"></div>
						
						<!-- Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			
			
		<div class="container">
			<table class="table table-hover" id ="table-1">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>성별</th>
					<th>이메일</th>
				</tr>
				</thead>
				<tbody>
				<h3 class="mt-5">수강 회원</h3>
			<c:forEach items="${member_view}" var="member_view">
				<tr>
					<td>${member_view.m_id}</td>
					<td>${member_view.m_name}</td>
					<td>${member_view.m_phone}</td>
					<td>${member_view.m_arrd}</td>
					<td>${member_view.m_sex}</td>
					<td>${member_view.m_email}</td>
				</tr>
			</c:forEach>	
				</tbody>
			</table>
		</div>
		</div>
	</main>
<script type="text/javascript">
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault();
		  $('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
</script>
</body>
</html>