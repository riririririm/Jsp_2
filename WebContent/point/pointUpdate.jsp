<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String user="user03";
 		String password ="user03";
 		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
 		String driver="oracle.jdbc.driver.OracleDriver";
 	
 		Class.forName(driver);
 	
 		Connection conn = DriverManager.getConnection(url, user, password);
    	
    	String sql="select * from point where idx=?";
    	PreparedStatement pst = conn.prepareStatement(sql);
    	pst.setInt(1, Integer.parseInt(request.getParameter("idx")));
    	
    	ResultSet rs = pst.executeQuery();
    	rs.next();
    	String p_name=rs.getString("p_name");
    	int kor = rs.getInt("kor");
    	int eng= rs.getInt("eng");
    	int math = rs.getInt("math");
    	int total = rs.getInt("total");
    	double p_avg = rs.getDouble("p_avg");
    		
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- --------------------------------------------- -->
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
<!-- --------------------------------------------- -->	
</head>
<body>

	<%@include file="../temp/header_nav.jsp"%>
	
	<!-- Container -->
	<div class="container main">
		<div class="row">
			<h1>Update point</h1>
		</div>

		<form action="./pointUpdateProcess.jsp">
			<input type="hidden" class="form-control" id="idx" value=<%=request.getParameter("idx") %>
					name="idx">
			
			<div class="form-group">
				<label for="p_name">이름:</label> 
				<input type="text" class="form-control" id="p_name" value=<%=p_name %>
					name="p_name">
			</div>
			<div class="form-group">
				<label for="kor">국어점수:</label> 
				<input type="text" class="form-control" id="kor" placeholder="Enter kor" name="kor" value=<%=kor %>>
			</div>
			<div class="form-group">
				<label for="eng">영어점수:</label> 
				<input type="text" class="form-control" id="eng" placeholder="Enter eng" name="eng" value=<%=eng %>>
			</div>
			<div class="form-group">
				<label for="math">수학점수:</label> 
				<input type="text" class="form-control" id="math" placeholder="Enter math" name="math" value=<%=math %>>
			</div>

			<button type="submit" class="btn btn-primary">Update</button>
		</form>
	</div>
	<%
	rs.close();
	pst.close();
	conn.close();
	
	%>

	<%@include file="../temp/footer.jsp"%>


</body>
</html>