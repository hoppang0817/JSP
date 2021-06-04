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
		
		
		String tempStart = request.getParameter("page"); // 현재 페이지  page
		if(tempStart == null){
			tempStart="1";
		}
		Integer page1 = Integer.parseInt(tempStart);
		int count = dao.selectCnt(keyField, keyWord); // 전체데이터 수(전체 게시물의 수) totalcount
		int onePageCnt=3; // 한페이지에 출력할 데이터 수  contList
		int pagePerBlock = 3;//블럭당 페이지 개수  countPage
		
		int totalPage = count / onePageCnt;
		
		if(count % onePageCnt>0){
			totalPage++;
		}
		
		if(totalPage< page1){
			page1 = totalPage;
		}
		
		int startPage = ((page1-1)/3)*3+1;
		System.out.print("시작 페이지 :"+startPage);
		
		int endPage = startPage + pagePerBlock-1;
		System.out.print("마지막페이지 :"+endPage);
		System.out.print("총페이지 :"+totalPage);

		if (endPage > totalPage) {
			  endPage = totalPage;
		}

		count = (int)Math.ceil((double)count/(double)onePageCnt); // 페이지 수 저장(총 블록개수)
		//nowBlock = (int)Math.ceil(Double.parseDouble(tempStart)/pagePerBlock);
		
	//	if(tempStart != null){ // 처음에는 실행되지 않는다.
		//	cPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		//}
		
		//ArrayList<bDto> v = dao.selectPage(keyField, keyWord, cPage, onePageCnt);
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
				<option value="bTitle" id="bTitle">제목</option>
				<option value="bName" id="bName">이름</option>
				</select>
		<input type="text" name="keyWord" value="${keyWord1}">
		<button type="submit">검색</button> 
		</form>
		
	<%
	if (startPage > 1) {
	%>
	<a href="search.do?page=<%=page1-1%>&keyField=${keyField}&keyWord=${keyWord1}">이전</a>
	<%
	};
	%>
		<%
		for(int i=startPage; i<=endPage; i++){ %>
			
			<a href="search.do?page=<%=i %>&keyField=${keyField}&keyWord=${keyWord1}">[<%=i%>]
			</a>
		<% }; %>
	
	<%	
	if (page1 < totalPage) {
	 %>
   <a href="search.do?page=<%=page1+1 %>&keyField=${keyField}&keyWord=${keyWord1}">다음</a>
	<% 
	}
	%>
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