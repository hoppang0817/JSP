<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="./resources/img/favicon.ico"  type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body, html {
	height: 100%;
}

#demo a{
    display: flex;
    flex-direction: column;
    align-items: center;
	text-decoration:none;
}
#demo1 a{
 	display: flex;
    flex-direction: column;
    align-items: center;
 	text-decoration:none;
}

@media{
	img{
	 width: 100%;
	 height:200px;
	
	}
}
@media ( max-width : 768px){
	img{
	 width: 0;
	 height:0;
	
	}
}
@media ( min-width : 768px) {
	aside {
		height: 100%;
	}
}

@media ( max-width : 768px) {
	main {
		margin-top:15%;
	}
}



</style>
</head>
<body>
	<div class="container-fluid ">
		<div class="row h-100">
			<aside class="col-12 col-md-2 p-0 bg-dark fixed-top">
					<a href="main.jsp"><img src="resources/img/a1.png" ></a>
				<nav
					class="navbar navbar-expand navbar-dark bg-dark flex-md-column flex-row align-items-start py-2">
					<div class="collapse navbar-collapse align-items-start">
						<ul
							class="flex-md-column flex-row navbar-nav w-100 justify-content-between">
						
							 <c:choose>
							 	<c:when test="${empty sessionId}">
							 		<li class="nav-item"><a class="nav-link pl-0" href="Login.jsp"><i
									class="fa fa-list fa-fw"></i> <span class="d-none d-md-inline">로그인</span></a>
									</li>
							 	</c:when>
							 	<c:otherwise>
							<li class="nav-item"><a class="nav-link pl-0 dropdown-toggle" href="#" data-toggle="collapse" data-target="#demo">
								<i class="far fa-heart"></i> <span class="d-none d-md-inline">회원 관리</span></a> <span class="caret"></span>
								<div class="collapse" id="demo">
									<a class="text-white" href="nextid.do">회원 등록</a> 
									<a class="text-white" href="searchList.do">회원 목록</a>
								</div>
							</li>
							<li class="nav-item"><a class="nav-link pl-0 dropdown-toggle" href="#" data-toggle="collapse" data-target="#demo1">
							<i class="fa fa-book fa-fw"></i> <span class="d-none d-md-inline">수업 관리</span></a><span class="caret"></span>
								<div class="collapse" id="demo1">
									<a class="text-white" href="ClassList.do">수업 목록</a>
									<a class="text-white" href="joinClassList.do">수업 신청</a> 
									<a class="text-white" href="addClass.jsp">수업 개설</a> 
									<a class="text-white" href="changeClassView.do">수업 변경</a>
								</div>
								</li>
							<li class="nav-item"><a class="nav-link pl-0" href="paymentView.jsp"><i
									class="fa fa-heart fa-fw"></i> <span class="d-none d-md-inline">결제 관리</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-0" href="locker.do"><i
									class="fa fa-heart fa-fw"></i> <span class="d-none d-md-inline">보관함 관리</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-0" href="checkMember.jsp"><i
									class="fa fa-heart fa-fw"></i> <span class="d-none d-md-inline">출석 체크</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-0" href="mCheckList.jsp"><i
									class="fa fa-heart fa-fw"></i> <span class="d-none d-md-inline">출석 관리</span></a>
							</li>
									<li class="nav-item"><a class="nav-link pl-0" href="logout.jsp">
									<span>[${sessionId}]</span> <span class="d-none d-md-inline">로그아웃</span></a>
									</li>
							 	</c:otherwise>
							 </c:choose>
							
							
						</ul>
					</div>
				</nav>
			</aside>
		</div>
	</div>
</body>
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
</html>
