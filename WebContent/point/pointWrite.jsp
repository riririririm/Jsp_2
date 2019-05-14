<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%@include file="../temp/css_meta.jsp"%>

<style type="text/css">
.main {
	min-height: 800px;
}
</style>

</head>
<body>
	<%@include file="../temp/header_nav.jsp"%>


	<!-- Container -->
	<div class="container main">
		<div class="row">
			<h1>Input point</h1>
		</div>

		<form action="./pointWriteProcess.jsp">
			<div class="form-group">
				<label for="p_name">이름:</label> 
				<input type="text" class="form-control" id="p_name" placeholder="Enter name"
					name="p_name">
			</div>
			<div class="form-group">
				<label for="kor">국어점수:</label> 
				<input type="text" class="form-control" id="kor" placeholder="Enter kor" name="kor">
			</div>
			<div class="form-group">
				<label for="eng">영어점수:</label> 
				<input type="text" class="form-control" id="eng" placeholder="Enter eng" name="eng">
			</div>
			<div class="form-group">
				<label for="math">수학점수:</label> 
				<input type="text" class="form-control" id="math" placeholder="Enter math" name="math">
			</div>

			<button type="submit" class="btn btn-primary">Write</button>
		</form>
	</div>

	<%@include file="../temp/footer.jsp"%>

</body>
</html>