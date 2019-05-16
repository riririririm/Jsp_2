<%@page import="com.rim.point.PointDAO"%>
<%@page import="com.rim.point.PointDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%
  		int idx = Integer.parseInt(request.getParameter("idx"));
  		String p_name = request.getParameter("p_name");
  		int kor = Integer.parseInt(request.getParameter("kor"));
  		int eng = Integer.parseInt(request.getParameter("eng"));
  		int math = Integer.parseInt(request.getParameter("math"));
  		int total = kor+eng+math;
  		double p_avg = total/3.0;
  		
  		PointDTO dto = new PointDTO();
  		dto.setIdx(idx);
  		dto.setP_name(p_name);
  		dto.setKor(kor);
  		dto.setEng(eng);
  		dto.setMath(math);
  		dto.setTotal(total);
  		dto.setP_avg(p_avg);
  		
  		PointDAO dao = new PointDAO();
  
  		int result=0;

  		
  		String msg="update fail";
  		if(result>0){
  			msg="update success";
  			request.setAttribute("message", msg);
  			request.setAttribute("path", "./point.jsp");
  			
  			RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");//이동해야할 경로
  	    	view.forward(request, response); 
  		}else{
  			
  			response.sendRedirect("./pointUpdate.jsp");
  		}
  				
  
  %>
