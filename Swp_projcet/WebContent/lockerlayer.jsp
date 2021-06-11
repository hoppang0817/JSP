<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="inputUesr.do" class="form-horizontal" id="frm">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="l_num" value="${l_num}">
			<div class="form-group row">
				<label class="control-lable col-sm-3"> 회원번호  </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="id" id="id">
					<span id="checkId" style="color:red"></span>
				</div>
			<button class="btn btn-primary" type="button" onclick="checkId()">확인</button>
			</div>
	</form>
<script type="text/javascript">
function checkId() {
	var id = $("#id").val();
	 $.ajax({ 
			type : 'POST', //데이터 전송 방식
			url : 'checkMemberId.jsp',
			data : {id : id},
			datatype : "jsp",
			//통신이 성공할경우 결과값 (data)에 저장
			success : function(data){
				if(data == 1){
					var Text ='<font>없는회원입니다.</font>';
					$("#checkId").text(""); //checkMessage 영역 초기화
					$("#checkId").show(); 
					$("#checkId").append(Text);
					$("#id").focus();
					return false;
				  }
				else{
					var Text
					$("#checkId").text("");
					$("#frm").submit();
				 }
				},
				  error : function(error){
					  alert("error : " + error);
				  }
			});//ajax end
	
}
</script>
</body>
</html>
