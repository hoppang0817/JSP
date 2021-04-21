<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ include file = "dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//주문한 제품을 (제품ID가 파라메타로 넘어온다.)카트리스트에 담아서 세션에 저장한다.
	String id = request.getParameter("id");
	
	//id가 널이거나 "" 빈칸일때 상품목록 페이지로 돌아가기
	if(id == null && id.trim().equals("")){
		response.sendRedirect("product.jsp");//sendRedirect()-JSP 페이지에서 특정한 작업을 수행한 후 지정한 페이지로 이동하고 싶은 경우
		return;
	}
	
	//dao 스태틱 객체를 가져온다.
	
	//ProductRepository dao = ProductRepository.getInstance();
	//아이디를 못찾을경우
	//Product goods = dao.getProductById(id);
	//if(goods == null){//제품 아이디로 제품을 못찾았을때
	//	response.sendRedirect("exceptionNoProductId.jsp");		
	//	}
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	String sql ="select * from product where p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs =pstmt.executeQuery();
	if(!rs.next()){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	//카드리스트에 추가해서 저장한다. 이때  먼저 카트리스트를 불러온다
	List<Product> items = (List<Product>)session.getAttribute("cartlist");
	
	if(items == null){
		items = new ArrayList<Product>();
		session.setAttribute("cartlist", items);
	}
	
	//만약 장바구니에 이미 담긴 상품이라면 갯수+1
	boolean isNotInList = true; //리스트에 상품이 안들어있다
	for(Product p : items){
		if(p.getProductId().equals(id)){//같은 제품이 카트리스트에 담겨있다
			p.setQuantity(p.getQuantity() + 1);
			isNotInList = false; //리스트에 담겨있다
		}
	}
	
	//장바구니에 없는 제품이라면 갯수=1
	if(isNotInList){
		//goods.setQuantity(1);
		//items.add(goods);//카드 리스트에 추가한다
		Product newItem = new Product();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs =pstmt.executeQuery();
		if(rs.next()){
			newItem.setProductId(rs.getString(1));
			newItem.setPname(rs.getString(2));
			newItem.setUnitPrice(Integer.valueOf(rs.getString(3)));
			newItem.setDescription(rs.getString(4));
			newItem.setCategory(rs.getString(5));
			newItem.setManufacturer(rs.getString(6));
			newItem.setUnitsInStock(Long.valueOf(rs.getString(7)));
			newItem.setCondition(rs.getString(8));
			newItem.setFilename(rs.getString(9));
			newItem.setQuantity(1);
			
		}
		items.add(newItem);
	}
	
	//장바구니에 담은 다음에 다시 원래페이지로 돌아간다
	response.sendRedirect("products.jsp?id="+id);
	

%>