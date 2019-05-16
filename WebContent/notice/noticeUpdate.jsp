<%@page import="com.rim.notice.noticeDAO"%>
<%@page import="com.rim.notice.noticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	int num = Integer.parseInt(request.getParameter("num"));
    	noticeDTO dto= new noticeDTO();
    	noticeDAO dao = new noticeDAO();
    	dto = dao.selectOne(num);
    %>
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
		
		
		<form action="./noticeUpdateProcess.jsp" method="post">
			<input type="hidden" class="form-control" id="num" name="num" value=<%=num %>>
			<div class="form-group">
				<label for="title">제목</label> 
				<input type="text" class="form-control" id="title" name="title"
					value="<%=dto.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="contents">내용</label> 
				<textarea class="form-control" rows="10" id="contents" placeholder="Write Contents" 
					name="contents"><%=dto.getContents() %></textarea>
			</div>		
			<button class="btn btn-primary">Update</button>
		</form>
	
		
	</div>

	<%@include file="../temp/footer.jsp" %>

</body>
</html>