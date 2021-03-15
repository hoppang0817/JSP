<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//로그인시 저장한 sessionId 를 불러온다. 이것의 값이 없으면 비회원으로 처리
	String sessionId = (String)session.getAttribute("sessionId");
%>


	<nav class="navbar navbar-expand  navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="<c:url value="/welcome.jsp"/>">Home</a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
							</li>					
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원가입</a>
							</li>						
						</c:when>
						<c:otherwise>
							<li style="padding-top: 7px; color: white;">
								[<%=sessionId %>님]
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
							</li>					
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원수정</a>
							</li>								
						</c:otherwise>					
					</c:choose>
					
				<li class="nav-item">
				<a class="nav-link" href="<c:url value="/product.jsp"/>">상품목록</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="<c:url value="/addProduct.jsp"/>">상품등록</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="<c:url value="/editProduct.jsp?edit=update"/>">상품수정</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="<c:url value ="/editProduct.jsp?edit=delete"/>">상품삭제</a>
				</li>
			</ul>
		</div>
		</div>
</nav>