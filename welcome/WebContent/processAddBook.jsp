<%@ page import="dto.Book" %>
<%@ page import="java.util.*"%>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());


	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String description = multi.getParameter("description");
	String publisher = multi.getParameter("publisher");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String totalPages = multi.getParameter("totalPages");
	String releaseDate = multi.getParameter("releaseDate");
	String condition = multi.getParameter("condition");
	String filename = multi.getFilesystemName("bookImage");

	Integer price;
	
	if(unitPrice.isEmpty())price =0;
	else price= Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty()) stock =0;
	else stock = Long.valueOf(unitsInStock);
	
	long pages;
	
	if(totalPages.isEmpty()) pages=0;
	else pages=Long.valueOf(totalPages);
	
	BookRepository dao =  BookRepository.getInstance();
	
	Book newbook = new Book();
	newbook.setBookId(bookId);
	newbook.setName(name);
	newbook.setUnitPrice(price);
	newbook.setAuthor(author);
	newbook.setDescription(description);
	newbook.setPublisher(publisher);
	newbook.setCategory(category);
	newbook.setUnitsInStock(stock);
	newbook.setTotalPages(pages);
	newbook.setReleaseDate(releaseDate);
	newbook.setCondition(condition);
	newbook.setFilename(filename);
	
	dao.addBook(newbook);

	response.sendRedirect("Book.jsp");
%>