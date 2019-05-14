<%@page import="com.rim.point.PointDTO"%>
<%@page import="com.rim.point.PointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%
  		String p_name = request.getParameter("p_name");
  		int kor = Integer.parseInt(request.getParameter("kor"));
  		int eng = Integer.parseInt(request.getParameter("eng"));
  		int math = Integer.parseInt(request.getParameter("math"));
  		int total = kor+eng+math;
  		double p_avg = total/3.0;
  		
  		PointDTO dto = new PointDTO();
  		dto.setP_name(p_name);
  		dto.setKor(kor);
  		dto.setEng(eng);
  		dto.setMath(math);
  		dto.setTotal(total);
  		dto.setP_avg(p_avg);
  		
  		PointDAO dao = new PointDAO();
  		int result= dao.insert(dto);
  		
  		String msg="insert fail";
  		if(result>0){
  			msg="insert success";
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