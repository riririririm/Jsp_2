<%@page import="com.rim.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rim.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	PointDAO dao = new PointDAO();
 	ArrayList<PointDTO> arr = new ArrayList<PointDTO>();
 	arr =dao.selectList();

 %>   
<!DOCTYPE html>
<html>
<head>

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
	</style>

</head>
<body>
	<%@ include file="../temp/header_nav.jsp" %>

 	<!-- container -->
 	<div class="container main">
 		<div class="row">
 			<h1>point page</h1>
 		</div>
 		<div class="row div_a">
 			<a href="./pointWrite.jsp" class="btn btn-primary">write</a> 			
 		</div>
 		
 		<div class="row" style="clear:both;">
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
 				<% for(PointDTO dto:arr){%>
 					<tr>
 						<td><%=dto.getIdx() %></td>
 						<td><a href="./pointSelect.jsp?idx=<%=dto.getIdx() %>"><%=dto.getP_name() %></a></td>
 						<td><%=dto.getKor() %></td>
 						<td><%=dto.getEng() %></td>
 						<td><%=dto.getMath() %></td>
 						<td><%=dto.getTotal() %></td>
 						<td><%=dto.getP_avg() %></td>
 					</tr>
 				<%} %>
 				</tbody>
 			</table>		
 		</div>
 			
 	</div>
  
 	<%@ include file="../temp/footer.jsp" %>

</body>
</html>