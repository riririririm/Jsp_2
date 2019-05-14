<%@page import="com.rim.point.PointDAO"%>
<%@page import="com.rim.point.PointDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int idx = Integer.parseInt(request.getParameter("idx"));
   		PointDAO dao = new PointDAO();
    	PointDTO dto = new PointDTO();
    	dto = dao.selectOne(idx);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="../temp/css_meta.jsp" %>
<style type="text/css">
		.main{
			min-height: 800px;
		}
		.point_tb{
			width:100%;
			text-align: center;
			border:1px solid gray;
			margin-top:10px;
		}
		.point_tb>thead{
			background-color: #003366;
			color: white;
		}
		.div_a{
			float:right;
		}
		.btn2{
		maring-left:10px;
		}
	</style>


</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>


 	<!-- container -->
 	<div class="container main">
 		<div class="row">
 			<h2>검색 결과</h2>
 		</div>
 	
 		<%if(dto!=null) {%>
 		<div class="row">
 			<table class="table table-bordered point_tb">
 				<thead>
 				<tr>
 					<th>idx</th>
 					<th>이름</th>
 					<th>국어</th>
 					<th>영어</th>
 					<th>수학</th>
 					<th>총점</th>
 					<th>평균</th>
 				</tr>
 				</thead>
 				<tbody>
 					<tr>
 						<td><%=dto.getIdx() %></td>
 						<td><%=dto.getP_name() %></a></td>
 						<td><%=dto.getKor() %></td>
 						<td><%=dto.getEng() %></td>
 						<td><%=dto.getMath() %></td>
 						<td><%=dto.getTotal() %></td>
 						<td><%=dto.getP_avg() %></td>
 					</tr>
 				</tbody>
 			</table>	
 			<div class="row">
 				<a href="./pointUpdate.jsp?idx=<%=request.getParameter("idx") %>" class="btn btn-primary btn2">Update</a> 
 				<a href="./pointDelete.jsp?idx=<%=request.getParameter("idx") %>" class="btn btn-primary btn2">Delete</a>			
 			</div>
 			
 		</div>
 		<%  
		 	}else{ %>
 			<div class="row">
 				<h2>검색 결과 없음</h2>
 			</div>
 		<%} %>
 			
 		
 	</div>
  
 	<%@ include file="../temp/footer.jsp" %>


</body>
</html>