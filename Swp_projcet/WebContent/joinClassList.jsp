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
		</div>
		<div class="container">
			<table class="table table-hover" id="table-1">
				<thead>
					<tr>
						<th>수업 번호</th>
						<th>수업명</th>
						<th>인원수</th>
						<th>시간</th>
						<th>등급</th>
						<th>신청</th>
						<th>등록 회원</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.c_num}</td>
							<td>${list.c_name}</td>
							<td>${list.count}/${list.c_limitedNum}</td>
							<td>${list.c_time}</td>
							<td>${list.c_grade}</td>
							<td><button
									<c:choose>
							<c:when test ="${list.count < list.c_limitedNum}"> onClick="location.href='joinClassView.do?c_num=${list.c_num}'" class="btn btn-primary btn-sm"</c:when>
							<c:otherwise>class="btn btn-danger btn-sm"  disabled="disabled"</c:otherwise>
							</c:choose>>신청</button></td>
							<!-- 모달창 열수있는 버튼 -->
						<td><a class="ls-modal btn btn-outline-primary" data-toggle="modal"
							href="modalList.do?c_num=${list.c_num}" data-target="#modal">보기</a></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<!-- Modal -->
			<div class="modal fade" id="modal" >
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<h4 class="modal-title">회원 목록</h4>
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