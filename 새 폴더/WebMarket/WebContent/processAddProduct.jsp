<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%
//addProduct 페이지에서 넘어온 파라메터들으 처리한다
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//파일 업로드 객체multi생성(request,저장경로,파일용량,인코딩,중복됬을겨우+1)
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	//이미지의 파일이름을 받아온다.
	String fileName = multi.getFilesystemName("productImage");
	//가격과 재고수는 문자열로 넘어왔지만 숫자로처리해야함.
	Integer price;
	
	//가격을 적지않으면 0, 숫자문자열을 숫자로 변환
	if(unitPrice.isEmpty())price =0;
	else price = Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty())stock = 0;
	else stock = Long.valueOf(unitsInStock);
	
	//상품 리파지토리 객체를 가져온다(Static 객체)
	ProductRepository dao = ProductRepository.getInstance();
	//새상품 객체를 만든후 변수값을 입력한다
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	//다시 목록페이지로이동
	response.sendRedirect("product.jsp");
	
%>