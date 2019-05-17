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
	
 	int curPage=1;
 	String kind = request.getParameter("kind");
 	String search = request.getParameter("search");
 	
 	if(kind==null)
 		kind="p_name";
 	else if(kind.equals("n"))
 		kind="p_name";
 	else if(kind.equals("kor"))
 		kind="kor";
 	else if(kind.equals("eng"))
 		kind="eng";
 	else if(kind.equals("math"))
 		kind="math";
 	else
 		kind="p_name";
 	
 	try{
 		curPage =Integer.parseInt(request.getParameter("curPage"));
 	}catch(Exception e){
 		
 	}
 	
 	if(search==null){
		search="";
	}
	
 	int perPage=10;
 	int startRow = perPage*(curPage-1)+1;
 	int lastRow = curPage*perPage;
 	
 	
 	
 	//총 글 개수
 	int totalCount = dao.countTotalRow(kind,search);
 	
 	//홈페이지 갯수
 	int totalPage = totalCount/perPage;
 	if(totalCount%perPage!=0){
 		totalPage+=1;
 	}
 	
 	//block당 숫자의 갯수
 	int perBlock=5;
 	
 	//총 block의 갯수(block:1~5 /6~10...)
 	int totalBlock = totalPage/perBlock;
 	if(totalPage%perBlock!=0){
 		totalBlock++;
 	}
 	
 	
 	int curBlock = curPage/perBlock;
 	if(curPage%perBlock!=0){
 		curBlock++;
 	}
 	
 	//curBlock에서 startNum, lastNum 찾기
 	int startNum = perBlock*(curBlock-1)+1;
 	int lastNum = curBlock*perBlock;
 	
 	if(curBlock==totalBlock)
 		lastNum=totalPage;
 	
 	if(startNum<0){
 		startNum=1;
 		lastNum=5;
 		curPage=1;	
 		startRow=1;
 		lastRow=10;
 	}
 	
 	arr =dao.selectList(kind,search,startRow, lastRow);

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
 		
 		<div class="row">
			<form action="./point.jsp">
				<select name="kind">
					<option value="n">이름</option>
					<option value="kor">국어</option>
					<option value="eng">영어</option>
					<option value="math">수학</option>
				</select>
				<input type="text" name="search">
				<button>검색</button>			
			</form>
		</div>
 		
 		<div>
 			<%if(curBlock>1){ %>
 				<a href="./point.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">이전</a>
 			<% }%>
 				
 			<% for(int i=startNum;i<=lastNum;i++){ %>
 				<a href="./point.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a>
 			<% } %>
 			
 			<%if(curBlock<totalBlock){ %>
 				<a href="./point.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">다음</a>
 			<% }%>
 		</div>
 			
 	</div>
  
 	<%@ include file="../temp/footer.jsp" %>

</body>
</html>