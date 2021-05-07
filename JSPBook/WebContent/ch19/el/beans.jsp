<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bean" class="ch19.ELBean"/>
<jsp:setProperty property="siteName" name="bean"/>
사이트명1: <jsp:getProperty property="siteName" name="bean"/><br>
사이트명2: <%=bean.getSiteName() %><br>
<!--Spring에서는 변수를 사용하는것이 getter호출 -->
사이트명3: ${bean.siteName}<br>