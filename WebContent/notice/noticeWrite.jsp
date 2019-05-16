<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include css file -->
<%@include file="../temp/css_meta.jsp" %>

<!-- stylesheet -->
<style type="text/css">
	.main{
		min-height:800px;
	}
</style>
</head>
<body>
	<%@include file="../temp/header_nav.jsp" %>
	
	
	<div class="container main">
		<div class="row">
			<h1> noticeWrite page </h1>
		</div>
		
		
		<form action="./noticeWriteProcess.jsp" method="post">
			<div class="form-group">
				<label for="title">제목:</label> 
				<input type="text" class="form-control" id="title" placeholder="Enter title"
					name="title">
			</div>
			<div class="form-group">
				<label for="contents">내용:</label> 
				<textarea class="form-control" rows="10" id="contents" placeholder="Write Contents" 
					name="contents"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자:</label> 
				<input type="text" class="form-control" id="writer" placeholder="Enter writer"
					name="writer">
			</div>		
			<button class="btn btn-primary">Write</button>
		</form>
	
		
	</div>

	<%@include file="../temp/footer.jsp" %>
		
</body>
</html>