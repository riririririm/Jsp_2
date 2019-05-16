<%@page import="com.rim.notice.noticeDTO"%>
<%@page import="com.rim.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    	int num = Integer.parseInt(request.getParameter("num"));
    	String title=request.getParameter("title");
    	String contents = request.getParameter("contents");
    	
    	noticeDAO dao= new noticeDAO();
    	noticeDTO dto  = new noticeDTO();
    	dto.setNum(num);
    	dto.setTitle(title);
    	dto.setContents(contents);
    	
    	int result=dao.update(dto);
    	String msg ="update fail";
    	if(result>0)
    		msg="update success!!";
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- -------스크립트---------- -->
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="./notice.jsp";
</script>
</head>
<body>

</body>
</html>