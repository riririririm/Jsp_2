<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//session.setAttribute("member", null); //혹은
    	//session.removeAttribute("member"); //혹은 속성명과 값 모두 삭제
    	//session.removeValue("member"); // 혹은 속성에 대한 값만 삭제
    	session.invalidate(); //session의 시간을 0으로 초기화(없애버림)
    	response.sendRedirect("../index.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>