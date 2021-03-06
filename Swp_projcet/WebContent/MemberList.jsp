<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="Dao.MemberDao" %>
<!-- 시스템 날짜를 불러옴 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  

<%
	MemberDao dao = MemberDao.getInstance();
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
<link rel="shortcut icon" href="./resources/img/favicon.ico"  type="image/x-icon">
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="col offset-sm-1 bg-faded">
		<div class="container" style="margin-top: 70px">
			<h2>회원 목록</h2>
		</div>
		<!-- 검색창 시작 -->
		<div class="container">
			<form action="searchList.do" >
				<div class="form-group row">
					<div class="col-sm-2">
						<select name="search" class="form-control">
							<option value="m_id" id="m_id">회원번호</option>
							<option value="m_name" id="m_name">이름</option>
						</select>
					</div>
					<div class="col-sm-2">
						<input type="text" name="searchKey"class="form-control" value="${searchKey}">
					</div>
					<div class="col-sm-2">
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</div>
			</form>
		</div>
		<div class="container">
			<table class="table table-hover w-auto">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>성별</th>
						<th>이메일</th>
						<th>수강 수업 </th>
						<th>시작일</th>
						<th>마지막일</th>
						<th>회원 수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mdto">
						<tr <c:if test="${mdto.endDate < today}">
							class="table-danger" 
							onclick="location.href='endDayMember.do?m_id=${mdto.m_id}'"
						</c:if>>
							<td>${mdto.m_id}</td>
							<td>${mdto.m_name}</td>
							<td>${mdto.m_phone}</td>
							<td>${mdto.m_arrd}</td>
							<td>${mdto.m_sex}</td>
							<td>${mdto.m_email}</td>
							<td>${mdto.c_num}</td>
							<td>${mdto.startDate}</td>
							<td>${mdto.endDate}</td>
							<td><a class="badge badge-primary" href="updateMemberView.do?m_id=${mdto.m_id}&page=<%=tempPage%>">수정하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 처리 -->
			<div class="text-center">
				
			<%
			   if(nowPage>pagePerBlock){ //처음, 이전 링크
			%>
					
					[<a href="searchList.do?page=1">◀◀</a>]
					[<a href="searchList.do?page=<%=nowPage-1 %>">◀</a>]
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
					<a href="searchList.do?page=<%=i %>">[<%=i%>]</a>
				
			<%		
					 }
				}
			%>
			
			<%	
				 if(toPage<totalPage){ //다음, 이후 링크
			 %>
					[<a href="searchList.do?page=<%=nowPage+1 %>">▶</a>]
					[<a href="searchList.do?page=<%=totalPage %>">▶▶</a>]
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
	<script type="text/javascript">
		var search ='${search}';
		
		if(search == "m_name"){
			$("#m_name").attr("selected",true);
		}else{
			$("#m_id").attr("selected",true);
		}
		
	</script>
</body>
</html>
