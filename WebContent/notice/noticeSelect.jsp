<%@page import="com.rim.notice.noticeDTO"%>
<%@page import="com.rim.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	noticeDAO dao = new noticeDAO();
    	noticeDTO dto = new noticeDTO();
    	int num = Integer.parseInt(request.getParameter("num"));
    	int result = dao.countHit(num);
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
	.txt_btn>a{
		margin-left: 13px;
		background-color: #1e3f7b;
		border-color: #1e3f7b; 
	}
	#btn_txt{
		background-color:  #990000;
		border-color: #990000; 
	}
	table{
		text-align: center;
	}
	#cont{
		text-align: left;
	}
</style>
</head>
<body>

	<%@include file="../temp/header_nav.jsp" %>
	
	
	<div class="container main">
		<div class="row">
			<h1> notice page </h1>
		</div>
		
		<!--------------- table --------------->
		<div>
			<table class="table table-bordered">
				<thead >
					<tr>
						<th width="70%">Title</th>
						<th width="10%">Writer</th>
						<th width="15%">Date</th>
						<th width="5%">HIT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%= dto.getTitle() %></td>
						<td><%=	dto.getWriter() %></td>
						<td><%= dto.getReg_date() %></td>
						<td><%= dto.getHit() %></td>
					</tr>
					<tr id="cont">
						<td colspan="4" height="300px"><%=dto.getContents() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="txt_btn">
			<a href="./noticeUpdate.jsp?num=<%=dto.getNum()%>" class="btn btn-primary">Update</a>
			<a href="./noticeDelete.jsp?num=<%=dto.getNum()%>" class="btn btn-primary" id="btn_txt">Delete</a>
			<a href="./notice.jsp" class="btn btn-primary" style="float:right;">List</a>
		
		</div>
		
		</div>
		
		
	</div>

	<%@include file="../temp/footer.jsp" %>

</body>
</html>