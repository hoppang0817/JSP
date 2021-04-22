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
<title>Login</title>
</head>
<body>
	<style>
#img {
	height: 90px;
	display: block;
	margin: 50px auto;
}
</style>
	
	<div class="container" align="center" >
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">
				<a href="#"><img src="./resources/img/a2.png" id="img"></a>
			</h5>
			<form action="LoginAction.do" class="form-signin" method="post">
				<div class="form-group">
					<label for="inputUserId" class="sr-only">User Id</label> 
					<input type="text" name="id" class="form-control" placeholder="ID"  required autofocus>
				</div>
			</form>

		</div>
	</div>
</body>
</html>