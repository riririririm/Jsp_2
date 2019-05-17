<%@page import="com.rim.member.MemberDAO"%>
<%@page import="com.rim.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="memberDTO" class="com.rim.member.MemberDTO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="memberDTO" />

<%

	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.memberJoin(memberDTO);
	String msg="Join Fail";
	if(result>0){
		msg = "Join Success";
	}
	request.setAttribute("message", msg);
	request.setAttribute("path", "../index.jsp");
	
	//RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
	//view.forward(request, response);
	
%>
<jsp:forward page="../common/test/result.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>