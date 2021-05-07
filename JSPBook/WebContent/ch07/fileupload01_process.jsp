<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
	//파일 업로드 객체multi생성(request,저장경로,파일용량,인코딩,중복됬을겨우+1)
	//new DefaultFileRenamePolicy() 파일명이 중복일경우 파일명뒤에 숫자를 덧붙여 파일명이 중복되지 않게 해줌
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());

	//일반 파라메터들도 multi객체를 통행입력받음
	String pname = multi.getParameter("name");
	String subject = multi.getParameter("subject");
	out.println(pname + " = " + subject + "<br>");
	
	//Enumeration params = multi.getParameterNames();

	//while (params.hasMoreElements()) {
	//	String name = (String) params.nextElement();
	//	String value = multi.getParameter(name);
	//	out.println(name + " = " + value + "<br>");
	//}
	out.println("-----------------------------------<br>");
	//파일업로드 
	String filename = multi.getFilesystemName("filename");

	out.println("저장 파일 이름 : " + filename + "<br>");


//	Enumeration files = multi.getFileNames();

//	while (files.hasMoreElements()) {
//		String name = (String) files.nextElement();
//		String filename = multi.getFilesystemName(name);
//		String original = multi.getOriginalFileName(name);
//		String type = multi.getContentType(name);
//		File file = multi.getFile(name);

//		out.println("요청 파라미터 이름 : " + name + "<br>");
//		out.println("실제 파일 이름 : " + original + "<br>");
//		out.println("저장 파일 이름 : " + filename + "<br>");
//		out.println("파일 콘텐츠 타입 : " + type + "<br>");

//		if (file != null) {
//			out.println(" 파일 크기 : " + file.length());
//			out.println("<br>");
//		}
//	}
%>