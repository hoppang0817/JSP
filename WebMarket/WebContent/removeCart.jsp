<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	//제품의 id가 같이 넘어온다.
	String id = request.getParameter("id");
	//id가 널이거나 공백이면 제품목록으로 보낸다
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("product.jsp");
		return;
	}
	//스태틱 객체 dao를 가져온다
	ProductRepository dao = ProductRepository.getInstance();
	//dao에서 id로 검색해서 제품을 찾아 product에 저장
	Product product = dao.getProductById(id);
	if (product == null) {//제품을 못찾은 경우
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);//리스트에 id가 같은게 있음 제거
		}
	}
	//다시 장바구니로 돌아감
	response.sendRedirect("cart.jsp");
%>
