<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//주문하기눌렀을때 보내온 id를 카트리스트에 담아서 세션에저장
	String id = request.getParameter("id");
	
	//만약 id값이 널이거나 빈칸일때 목록으로 돌아간다 trim()-공백없애주기 기능
	if(id==null && id.trim().equals("")){
		response.sendRedirect("book.jsp");
		return;
	}
	//dao 스택틱 객체를 가져온다
	BookRepository dao = BookRepository.getInstance();
	//아이디를 못찾을경우
	Book goods = dao.getBookById(id);
	if(goods==null){
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	//카드리스트에 추가해서 저장한다. 이때  먼저 카트리스트를 불러온다
	ArrayList<Book> list = (ArrayList<Book>)session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}
	
	//장바구니에 이미 담긴 상품이면 갯수+1
	boolean isNotInList = true;
	for(Book b: list){
		if(b.getBookId().equals(id)){
			b.setQuantity(b.getQuantity()+1);
			isNotInList =false;//카트리스트에 담겨있다
		}
	}
	
	//장바구니에 없는 상품이면 갯수=1
	if(isNotInList){
		goods.setQuantity(1);
		list.add(goods);//카트리스트에 추가한다
	}
	
	response.sendRedirect("Books.jsp?id="+id);
%>