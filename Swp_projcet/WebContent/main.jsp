<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="./resources/img/favicon.ico"  type="image/x-icon">
<style type="text/css">
@media{
	#mainimg{
	width: 70%;
    height: auto;
    margin-left: 18%;
	
	}
}

@media ( max-width : 768px){
	#mainimg{
	width: 70%;
    height: auto;
    margin-left: 15%;
    margin-top: 20%;
	
	}
}
</style>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="cantainer" style="margin-top: 70px">
			<img id="mainimg" src="resources/img/a1.png">
		</div>
	</main>
</body>
</head>
</html>