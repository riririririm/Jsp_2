<%@page import="com.rim.notice.noticeDAO"%>
<%@page import="com.rim.notice.noticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
   		response.setCharacterEncoding("UTF-8");
    	String title = request.getParameter("title");
    	String contents = request.getParameter("contents");
    	String writer = request.getParameter("writer");
    	
    	noticeDAO dao = new noticeDAO();
    	noticeDTO dto = new noticeDTO();
    	dto.setTitle(title);
    	dto.setContents(contents);
    	dto.setWriter(writer);
    	
    	int result = dao.insert(dto);
    	
    	String msg="insert fail";
    	if(result>0)
    		msg="insert success!";
    	
    	request.setAttribute("message", msg);
    	request.setAttribute("path", "./notice.jsp");
    	
    	//common/result.jsp
    	//forward
    	RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");//이동해야할 경로
    	view.forward(request, response); 
    	
    	//redirect
    	//response.sendRedirect("../common/test/result.jsp");
    
    %>
