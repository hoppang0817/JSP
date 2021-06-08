<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<%@ page import="Dao.LockerDao" %>
<%
	LockerDao dao= LockerDao.getInstance();
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
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

</head>

<body>
<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>보관함 관리</h2>
		</div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>보관함 번호</th>
						<th>사용 회원</th>
						<th>종료일</th>
						<th>등록</th>
						<th>기간 연장</th>
						<th>회원변경</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr <c:if test="${list.l_end < today}">
							class="table-danger" 
							</c:if>>
							<td>${list.l_num}</td>
							<td>${list.m_id}</td>
							<td>${list.l_end}</td>
							<td>
							<a
								<c:choose> 
									<c:when test="${list.m_id eq 0}">
										class="ls-modal btn btn-outline-primary" data-toggle="modal"
										href="LockerUesr.do?l_num=${list.l_num}" data-target="#modal"
									</c:when>
									<c:otherwise>class="btn btn-danger"  disabled="disabled"</c:otherwise>
								</c:choose>>
							등록</a>
							</td>
							<td>
							<a id="extend" class="btn btn-primary" href="extend.do?l_num=${list.l_num}"
								<c:if test="${list.m_id eq 0}">
									onclick="checkId()"
								</c:if>
							>연장</a>
						</td>
							<td><a class ="ls-modal2 btn btn-primary" data-toggle="modal" data-target="#modal" href="changeUesrNum.do?l_num=${list.l_num}&l_end=${list.l_end}">변경</a> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 처리 -->
			<div class="text-center">
				
			<%
			   if(nowPage>pagePerBlock){ //처음, 이전 링크
			%>
					
					[<a href="locker.do?page=1">◀◀</a>]
					[<a href="locker.do?page=<%=nowPage-1 %>">◀</a>]
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
					<a href="locker.do?page=<%=i %>">[<%=i%>]</a>
				
			<%		
					 }
				}
			%>
			
			<%	
				 if(toPage<totalPage){ //다음, 이후 링크
			 %>
					[<a href="locker.do?page=<%=nowPage+1 %>">▶</a>]
					[<a href="locker.do?page=<%=totalPage %>">▶▶</a>]
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
			<!-- Modal -->
			<div class="modal fade" id="modal" >
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
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
	</main>
<script type="text/javascript">
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault();
		  $('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
	 
	 $('.ls-modal2').on('click', function(e){
		  e.preventDefault();
		  $('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
	 
	 function checkId() {
		 alert("사용중인 보관함이 아닙니다");
	}
	
</script>
</body>
</html>
