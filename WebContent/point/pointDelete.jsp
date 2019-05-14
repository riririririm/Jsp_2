<%@page import="com.rim.point.PointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%
  		int idx = Integer.parseInt(request.getParameter("idx"));
  
  		PointDAO dao = new PointDAO();
  		int result= dao.delete(idx);
  		
  		String msg="delete fail";
  		if(result>0){
  			msg="delete success";
  		}
  				
  
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	alert("<%=msg%>");
	location.href="./point.jsp";


</script>
</head>
<body>

</body>
</html>