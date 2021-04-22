<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
body, html {
	height: 100%;
}

@media ( min-width : 768px) {
	aside {
		height: 100%;
	}
}
</style>

	<div class="container-fluid h-100">
		<div class="row h-100">
			<aside class="col-12 col-md-2 p-0 bg-dark fixed-top">
				<nav
					class="navbar navbar-expand navbar-dark bg-dark flex-md-column flex-row align-items-start py-2">
					<div class="collapse navbar-collapse align-items-start">
						<ul
							class="flex-md-column flex-row navbar-nav w-100 justify-content-between">
							<li class="nav-item"><a class="nav-link pl-0 text-nowrap" href="#">
								<i class="fa fa-bullseye fa-fw"></i> <span class="font-weight-bold">SWP</span></a>
							</li>
							<li class="nav-item dropdown"><a class="nav-link pl-0 dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="far fa-heart"></i> <span class="d-none d-md-inline">회원 관리</span></a> <span class="caret"></span>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">회원 등록</a> 
									<a class="dropdown-item" href="#">회원 목록</a>
								</div>
							</li>
							<li class="nav-item dropdown"><a class="nav-link pl-0 dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-book fa-fw"></i> <span class="d-none d-md-inline">수업 관리</span></a><span class="caret"></span>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">수업 개설</a> 
									<a class="dropdown-item" href="#">수업 목록</a>
								</div>
								</li>
							<li class="nav-item"><a class="nav-link pl-0" href="#"><i
									class="fa fa-heart fa-fw"></i> <span class="d-none d-md-inline">보관함 관리</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-0" href="#"><i
									class="fa fa-list fa-fw"></i> <span class="d-none d-md-inline">마이페이지</span></a>
							</li>
						</ul>
					</div>
				</nav>
			</aside>
			 <main class="col offset-md-2 bg-faded py-3">
            <div>
            <h1>여기</h1>
            </div>
        </main>
		</div>
	</div>
</body>
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
</html>