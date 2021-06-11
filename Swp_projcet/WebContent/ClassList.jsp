<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Dao.ClassDao" %>
<%
	 ClassDao dao= ClassDao.getInstance();
	String search = request.getParameter("search");
	String searchKey = request.getParameter("searchKey");
	
	String tempPage = request.getParameter("page");
	System.out.println(tempPage);
	if(tempPage == null){
		tempPage ="1";
	}
	//현재 페이지
	Integer nowPage = Integer.parseInt(tempPage);
	System.out.println(nowPage);
	
	
	//총데이터수
	int totalCount = dao.selectCnt(search, searchKey);
	System.out.println(totalCount);
	
	
	int onePageCnt=10; // 한페이지에 출력할 데이터 수 
	int pagePerBlock = 5;//블럭당 페이지 개수  
	int totalPage = totalCount / onePageCnt; //총 페이지수
	// 페이지 수 저장(총 블록개수)
	
	
	if(totalCount % onePageCnt>0){
		totalPage++;
	}
	
	if(totalPage< nowPage){
		nowPage = totalPage;
	}
	
	 int from = (nowPage * onePageCnt) - (onePageCnt-1); //(1*10)-(10-1)=10-9=1 //from
	 int to=(nowPage * onePageCnt); //(1*10) = 10 //to
	
	
	int fromPage = ((nowPage-1)/pagePerBlock*pagePerBlock)+1;  //보여줄 페이지의 시작
    int toPage = ((nowPage-1)/pagePerBlock*pagePerBlock)+pagePerBlock; //보여줄 페이지의 끝
    if(toPage> totalPage){ // 예) 20>17
        toPage = totalPage;
    }
	
	totalCount = (int)Math.ceil((double)totalCount/(double)onePageCnt); 

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="./resources/img/favicon.ico"  type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>수업 목록</h2>
		</div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>수업 번호</th>
						<th>수업명</th>
						<th>인원수</th>
						<th>시간</th>
						<th>등급</th>
						<th>수업 수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr <c:if test ="${list.count >= list.c_limitedNum}" >class="table-danger"</c:if> >
							<td>${list.c_num}</td>
							<td>${list.c_name}</td>
							<td>${list.count}/${list.c_limitedNum}</td>
							<td>${list.c_time}</td>
							<td>${list.c_grade}</td>
							<td><a class="badge badge-primary" href="updateClassView.do?c_num=${list.c_num}&page=<%=tempPage%>">수정하기</a>
						</tr>
				
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 처리 -->
			<div class="text-center">
				
			<%
			   if(nowPage>pagePerBlock){ //처음, 이전 링크
			%>
					
					[<a href="ClassList.do?page=1">◀◀</a>]
					[<a href="ClassList.do?page=<%=nowPage-1 %>">◀</a>]
			<%
				}else{
			%>
					  [<span style="color:gray">◀◀</span>]   
               		  [<span style="color:gray">◀</span>]
            <%
				}
            %>
			
			<%
				for(int i=fromPage; i<= toPage; i++){ 
					 if(i==nowPage){
			
			%>
				 [<%=i%>]
			<% 
					 }else{
						 
			%>
					<a href="ClassList.do?page=<%=i %>">[<%=i%>]</a>
				
			<%		
					 }
				}
			%>
			
			<%	
				 if(toPage<totalPage){ //다음, 이후 링크
			 %>
					[<a href="ClassList.do?page=<%=nowPage+1 %>">▶</a>]
					[<a href="ClassList.do?page=<%=totalPage %>">▶▶</a>]
			<%
				}else{
			%>
				[<span style="color:gray">▶</span>]
                [<span style="color:gray">▶▶</span>]
			<%
				}
			%>
	
			</div>
		</div>
	</main>
</body>
</html>
