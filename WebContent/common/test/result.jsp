<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String msg = (String)request.getAttribute("message");
    	String path = (String)request.getAttribute("path");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- -------스크립트---------- -->
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=path%>";
</script>

</head>
<body>

</body>
</html>