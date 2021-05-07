<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo 리스트</title>
</head>
<body>
	<!-- 1.html form 작성 할일을 입력받을 form생성 -->
	<form action="todo-demo.jsp">
	새 할일 : <input type ="text" name = "theItem"> 
	<input type="submit" value="입력">
	</form>
	<!-- 1.5.입력 아이템을 테스트 출력 -->
	<%=request.getParameter("theItem") %>
	
	<!-- 2.세션에  할일 목록을 추가해서 저장-->
	
	<%
	//세션에 저장된 todo리스트를 꺼낸다
	//세션에 목록이 하나라도 있다면 먼저 꺼낸후 새로운 목록을추가하고 같이 저장하기때문에  먼저 get해야함
	List<String> items = (List<String>)session.getAttribute("todoList");
	
	
	//만약 todo리스트가 없으면 새로 만든다
	if(items == null){
		items = new ArrayList<String>();
		session.setAttribute("todoList", items);
	}
	
	//입력 아이템 추가하다
	String theItem = request.getParameter("theItem");
	//버그발견 1.빈칸입력된다 2.할일 중복된다
	//.trim()좌우 공백 제거 (스페이스만 입력해도 추가 되지안게하기위해)
	//contains()대상 문자열에 특정 문자열이 포함되어 있는지 확인하는 함수이다.
	//! 부정
	
	if(theItem !=null){
	boolean isItemNotEmpty = theItem.trim().length()>0;
	boolean isItemNotDuplicate = !items.contains(theItem.trim());
	
	if(isItemNotEmpty && isItemNotDuplicate){
		items.add(theItem);//할일 리스트추가
		session.setAttribute("todoList", items);//추가된 items을 세션에 저장
		
		}
	}
	%>
	
	<!-- 3.화면에 출력하기 -->
	<hr>
	<b>할일 목록</b><br>
	
	<ol>
	<%
	
	for(String temp : items){
		out.print("<li>"+temp+"</li>");
	}
	
	%>
	</ol>
	
	
	
	
</body>
</html>