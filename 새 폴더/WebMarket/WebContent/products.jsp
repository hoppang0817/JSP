<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!-- db연결 -->
<%@ include file="dbconn.jsp" %>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<html>
<head>
<link rel="stylesheet" 	href="resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>
	<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit(); //yes면 서버로 보낸다
		}else{
			document.addForm.reset(); //no면 안보낸다.리셋
		}
	}
	
	
	</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		//product페이지에서 넘어온 아이디의 값을 가져온다.
		//만약 id가 넘어오지 않으면 오류발생-> 에러페이지에서 처리
		String id = request.getParameter("id");
		//스테틱 인스턴스 객체를 가져와서 업데이트 된 제품 리스트레서 제품 찾음
		//ProductRepository dao = ProductRepository.getInstance();
		// Product product = dao.getProductById(id);
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		//DB에서 id를 입력하여 제품행을 가져온다
		String sql = "select * from product where p_id=?";
		pstmt = conn.prepareStatement(sql);//sql문준비
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); //만약 id에 맞는 상품이 잇으면 결과가 있음
		if(rs.next()){//괄호와 괄호 사이에 rs.메소드로 상품의 정보를 가져온다
	%>
	<div class="container">
		<div class="row">
		<div class="col-md-5">
		<img style="width:100%" src="/upload/<%=rs.getString("p_fileName")%>">
		</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>분류</b> : <%=rs.getString("p_category")%>
				<p><b>재고 수</b> : <%=rs.getString("p_unitsInStock")%>
				<h4><%=rs.getString("p_unitPrice")%>원</h4>
				<p>
				<form name ="addForm" action="addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
				   <a href="#" onclick="addToCart();" class="btn btn-info"> 상품 주문 &raquo;</a>
				   <a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a> 
				   <a href="./product.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
			
	<%
		}
	
	%>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
