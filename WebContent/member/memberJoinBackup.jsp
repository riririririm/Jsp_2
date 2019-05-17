<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include css file -->
<%@include file="../temp/css_meta.jsp" %>


<style type="text/css">
.main{
		min-height:800px;
	}
.btn{	
	background-color: #1e3f7b; 
	border-color:#1e3f7b; 
	color:white;
}
</style>


</head>
<body>

<%@include file="../temp/header_nav.jsp" %>

<div class="container main">
	<div class="row">
		<h1>Join form</h1>
	</div>
		<form action="../index.jsp" name="jform">
			<div class="form-group">
				<label for="id">ID:</label> 
				<input type="text"
					class="form-control" id="id" placeholder="Enter id" required="required"
					name="id">
				<input type="button"  class="btn btn-default" value="중복확인" 
					id="id_check" style="margin-top:5px; margin-right:10px;  margin-bottom:10px; float:left;">
				<div id="id_check_result" style="margin-top:10px; margin-right:10px; float:left;"></div>
				<div id="id_result" style="margin-top:10px;"></div>
			</div>
			
			
			<div class="form-group" style="clear:both; margin-top:10px;">
				<label for="pwd">Password:</label> 
				<input type="password"
					class="form-control" id="pwd" placeholder="Enter password" required="required"
					name="pwd">
				<div id="result"></div>
			</div>
			
			<div class="form-group">
				<label for="pwd">Password:</label> 
				<input type="password"
					class="form-control" id="pwd2" placeholder="Enter password" required="required"
					name="pwd2">
				<div id="result2" ></div>
			</div>
			
			<div class="form-group">
				<label for="email">Email:</label> 
				<input type="email"
					class="form-control" id="email" placeholder="Enter email" required="required"
					name="email">
			</div>
			
			<div class="form-group">
				<label for="phone">phone:</label> 
				<input type="text"
					class="form-control" id="phone" placeholder="Enter phone number" required="required"
					name="phone">
			</div>
			
			<input type="button" class="btn btn-default" value="join" id="join">
		
		</form>
	</div>


	

	<!-- footer -->
	<%@include file="../temp/footer.jsp" %>
	<!-- footer end -->
	
	<!-- -------------스크립트------------- -->
<script type="text/javascript">
		$(".btn_ok").click(function(){
			var c = $("#checkAll").prop("checked");
			if(c){
				alert("회원가입 성공!!");
				$("#Jform").submit();
			}else{
				alert("필수 약관에 모두 동의해주세요.");
			}
		});
		
		$("#checkAll").click(function() {
			var c = $(this).prop("checked");
			$(".check").prop("checked",c);
		});
		
		$(".check").click(function() {
			var c = true;
			$(".check").each(function() {
				if(!$(this).prop("checked")){
					c=false;
				}
			});
			$("#checkAll").prop("checked",c);
		});


</script>
</div>
<!--  end of container -->


</body>
</html>