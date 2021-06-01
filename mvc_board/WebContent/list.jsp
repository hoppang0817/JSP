<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.bDto" %>
<%@ page import="dao.BDao" %>
  
<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
<body>
	<% 
		BDao dao = new BDao();
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		
		int count = dao.selectCnt(keyField, keyWord); // 전체데이터 수
		
		String tempStart = request.getParameter("page"); // 현재 페이지 
		
		int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=3; // 한페이지에 출력할 데이터 수
		
		count = (int)Math.ceil((double)count/(double)onePageCnt); // 페이지 수 저장
		
		if(tempStart != null){ // 처음에는 실행되지 않는다.
			startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		}
		
		ArrayList<bDto> v = dao.selectPage(keyField, keyWord, startPage, onePageCnt);
	%>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		
		 <c:forEach items="${v}" var="v">
		 	<tr>
		 		<td>${v.bId}</td>
		 		<td>${v.bName}</td>
		 		<td>${v.bTitle}</td>
		 		<td>${v.bDate}</td>
		 		<td>${v.bHit}</td>
		 	</tr>
		 </c:forEach>
		<tr>
			<td clospan="5"><a href="write_view.do">글작성</a></td>
		</tr>
	</table><br>
		<form action="search.do">
		<select name="keyField" class="form-control" id="keyField">
				<option>-</option>						
				<option value="bTitle" id="bTitle">제목</option>
				<option value="bName" id="bName">이름</option>
				</select>
		
		<input type="text" name="keyWord" value="${keyWord}">
		<button type="submit">검색</button> 
		</form>
		
	
		<%
		for(int i=1; i<=count; i++){ %>
			
			<a href="list.jsp?page=<%=i %>">[<%=i%>]
			</a>
		<% }; %>
	
	<br>
<script type="text/javascript">
var keyField ='${keyField}';
//alert(keyField);
	
	if(keyField == "bTitle"){
		//alert("여기");
		$("#keyField").val("bTitle").prop("selected", true);
	}else{
		$("#bName").attr("selected", true);
	}
</script>
</body>
</html>