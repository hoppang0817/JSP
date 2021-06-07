<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 시스템 날짜를 불러옴 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name ="frmSubmit"class="form-horizontal">
	<input type="hidden" name="l_num" value="${l_num}">
			<div class="form-group row">
				<label class="control-lable col-sm-3"> 회원번호  </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="m_id">
				</div>
				<div>
					<button class="btn btn-primary" onClick="test()">변경</button>
					<button class="btn btn-warning" onClick="test2()">환불</button>
				</div>
			</div>
	</form>
	<script type="text/javascript">
	var theForm = document.frmSubmit;
		function test() {
			if(confirm("변경하시겠습니까?")==true){
				theForm.action = "changeUesr.do";
			}else{
				return false;
			}
		}
		
		function test2() {
			var edd = '${l_end}';
			var sdd = '${today}';
		    var ar1 = sdd.split('-');
		    var ar2 = edd.split('-');
		    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
		    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		    var dif = da2 - da1;
		    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		    var result = dif/cDay;
			if(confirm("환불 하시겠습니까?")==true){
				alert("남은기간 :"+result+"일 \n환불금액 :"+result*500+"원 입니다.");
				theForm.action ="refundLocker.do";
			}else{
				return;
			}
			
		}
	</script>

</body>
</html>
