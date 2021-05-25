<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

</head>

<body>
<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>보관함 관리</h2>
		</div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>보관함 번호</th>
						<th>사용 회원</th>
						<th>종료일</th>
						<th>등록</th>
						<th>기간 연장</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.l_num}</td>
							<td>${list.m_id}</td>
							<td>${list.l_end}</td>
							<td>
							<a
								<c:choose> 
									<c:when test="${list.m_id eq 0}">
										class="ls-modal btn btn-outline-primary" data-toggle="modal"
										href="LockerUesr.do?l_num=${list.l_num}" data-target="#modal"
									</c:when>
									<c:otherwise>class="btn btn-outline-primary"  disabled="disabled"</c:otherwise>
								</c:choose>>
							등록</a>
							</td>
							<td><a class="btn btn-primary" href="extend.do?l_num=${list.l_num}">연장</a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="modal" >
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
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
	</main>
<script type="text/javascript">
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault();
		  $('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
</script>
</body>
</html>
