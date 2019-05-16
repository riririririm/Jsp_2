<%@page import="com.rim.notice.noticeDAO"%>
<%@page import="com.rim.notice.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	noticeDAO dao = new noticeDAO();
    	ArrayList<noticeDTO> arr = new ArrayList<noticeDTO>();
    	arr = dao.selectList();
    
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
	table{
		text-align: center;
	}
	table>thead{
		background-color: #0f1f3d;
		color:white;
	}
	.row>a{
		background-color: #1e3f7b;
		border-color:#1e3f7b; 
		
	}
	.txt>a{
		text-decoration: none;
		color:black;
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
				<thead>
					<tr>
						<th width="5%">NO</th>
						<th width="70%">Title</th>
						<th width="10%">Writer</th>
						<th width="10%">Date</th>
						<th width="5%">HIT</th>
					</tr>
				</thead>
				<tbody>
				<%for(noticeDTO dto: arr){%>
					<tr>
						<td><%=dto.getNum() %></td>
						<td class="txt"><a href="./noticeSelect.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
						<td><%=dto.getWriter() %></td>
						<td><%=dto.getReg_date() %></td>
						<td><%=dto.getHit() %></td>
					</tr>				
				<%}%>
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>
		</div>
		
		
	</div>

	<%@include file="../temp/footer.jsp" %>
		
</body>
</html>