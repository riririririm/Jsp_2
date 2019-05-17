<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include css file -->
<jsp:include page="../temp/css_meta.jsp" />

</head>
<body>
<jsp:include page="../temp/header_nav.jsp" />


<div class="container main">
	<div class="row">
		<h1>Join form</h1>
	</div>
		<form action="./memberJoinProcess.jsp" name="jform" method="post" id="jform">
			<div class="form-group">
				<label for="id">ID:</label> 
				<input type="text"
					class="form-control" id="id" placeholder="Enter id" required="required"
					name="id">
			</div>
			
			
			<div class="form-group" style="clear:both; margin-top:10px;">
				<label for="pw">Password:</label> 
				<input type="password"
					class="form-control" id="pw" placeholder="Enter password" required="required">
				<div id="result"></div>
			</div>
			
			<div class="form-group">
				<label for="pwd">Password:</label> 
				<input type="password"
					class="form-control" id="pwd2" placeholder="Enter password" required="required" name="pw">
				<div id="result2" ></div>
			</div>
			
			<div class="form-group" >
				<label for="name">name:</label> 
				<input type="text"
					class="form-control" id="name" placeholder="Enter name" required="required"
					name="name">
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
			
			<div class="form-group">
				<label for="age">age:</label> 
				<input type="text"
					class="form-control" id="age" placeholder="Enter age" required="required"
					name="age">
			</div>
			
			<input type="button" class="btn btn-default" value="join" id="join">
		
		</form>
	</div>


	

	<!-- footer -->
	<jsp:include page="../temp/footer.jsp" />
	<!-- footer end -->
	
	<script type="text/javascript">
	$('#join').click(function() {
		var r = true;
		$(".form-control").each(function() {
			if($(this).val() == ''){
				r=false;
			}
		});
		
		if(r){
			$('#jform').submit();
		}else {
			alert('모두 작성');
		}
		
		
	});
	</script>
	
</div>
<!--  end of container -->


</body>
</html>