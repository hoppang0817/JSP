<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%! //문자열 데이터를 입력받아 소문자로 변환해서 리턴하는 함수
	String makeItLower(String data) {
		return data.toLowerCase();
	}%>
	<%
		out.println(makeItLower("Hello World"));
	%>
</body>
</html>