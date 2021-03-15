<%@page import="java.util.ArrayList"%>
<%@ page import ="dao.BookRepository" %>
<%@ page import ="dto.Book" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	//제품의 id가넘어옴
	String id = request.getParameter("id");
	//id가 널이거나 공백이면 제품목록으로이동
	if(id == null || id.trim().equals("")){
		response.sendRedirect("Book.jsp");
		return;
	}
	//스태틱 객체 dao를 가져온다
	BookRepository dao = BookRepository.getInstance();
	//dao에서 id로 검색해서 제품을 찾아 book에저장
	Book book = dao.getBookById(id);
	if(book==null){//제품을 못찾을경우
		response.sendRedirect("exceptionNoBookId");
	}
	
	ArrayList<Book> cartlist = (ArrayList<Book>)session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for(int i=0; i<cartlist.size(); i++){//상품리스트를 하나씩 출력
		goodsQnt = cartlist.get(i);
		if(goodsQnt.getBookId().equals(id)){
			cartlist.remove(goodsQnt);//리스트에 id가 같은게 있음제거
		}
	}
	//다시 장바구니로 돌아간다
	response.sendRedirect("cart.jsp");

%>
