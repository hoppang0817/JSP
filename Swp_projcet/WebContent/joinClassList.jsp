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
			<h2>수업 신청</h2>
		</div>
		<div class="container">
			<table class="table table-hover" id="table-1">
				<thead>
					<tr>
						<th>수업 번호</th>
						<th>수업명</th>
						<th>인원수</th>
						<th>시간</th>
						<th>등급</th>
						<th>신청</th>
						<th>등록 회원</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.c_num}</td>
							<td>${list.c_name}</td>
							<td>${list.count}/${list.c_limitedNum}</td>
							<td>${list.c_time}</td>
							<td>${list.c_grade}</td>
							<td><button
									<c:choose>
							<c:when test ="${list.count < list.c_limitedNum}"> onClick="location.href='joinClassView.do?c_num=${list.c_num}&page=<%=tempPage %>'" class="btn btn-primary btn-sm"</c:when>
							<c:otherwise>class="btn btn-danger btn-sm"  disabled="disabled"</c:otherwise>
							</c:choose>>신청</button></td>
							<!-- 모달창 열수있는 버튼 -->
						<td><a class="ls-modal btn btn-outline-primary" data-toggle="modal"
							href="modalList.do?c_num=${list.c_num}" data-target="#modal">보기</a></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<!-- 페이징 처리 -->
			<div class="text-center">
				
			<%
			   if(nowPage>pagePerBlock){ //처음, 이전 링크
			%>
					
					[<a href="joinClassList.do?page=1">◀◀</a>]
					[<a href="joinClassList.do?page=<%=nowPage-1 %>">◀</a>]
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
					<a href="joinClassList.do?page=<%=i %>">[<%=i%>]</a>
				
			<%		
					 }
				}
			%>
			
			<%	
				 if(toPage<totalPage){ //다음, 이후 링크
			 %>
					[<a href="joinClassList.do?page=<%=nowPage+1 %>">▶</a>]
					[<a href="joinClassList.do?page=<%=totalPage %>">▶▶</a>]
			<%
				}else{
			%>
				[<span style="color:gray">▶</span>]
                [<span style="color:gray">▶▶</span>]
			<%
				}
			%>
	
			</div>
			
			
			<!-- Modal -->
			<div class="modal fade" id="modal" >
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<h4 class="modal-title">회원 목록</h4>
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
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

		</div>
	</main>
	
<script type="text/javascript">
	//jQury class는 .으로 불러옴
	//.ls-modal 클릭시 함수 실행
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault(); //기본 동작 중단
		  //.modal-body부분  href주소에 연결된 화면 출력
		  $('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
</script>
</body>
</html>
