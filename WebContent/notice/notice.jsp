<%@page import="com.rim.notice.noticeDAO"%>
<%@page import="com.rim.notice.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	noticeDAO dao = new noticeDAO();
    	ArrayList<noticeDTO> arr = new ArrayList<noticeDTO>();
    	int curPage;
    	//String kind = request.getParameter("kind");
    	String search = request.getParameter("search");
    	
    	try{
    		curPage= Integer.parseInt(request.getParameter("curPage"));
        	
    	}catch (Exception e){
    		curPage =1;
    	}
    	
    	if(search==null){
    		search="";
    	}
    	
    	int totalCount = dao.countTotal();
    	int perPage=10;
    	
    	int startRow=perPage*(curPage-1)+1;
    	int lastRow=perPage*curPage;
    	
    	int totalPage = totalCount/perPage;
    	if(totalCount%perPage!=0)
    		totalPage++;
    	
    	int perBlock=5;
    	
    	int totalBlock = totalPage/perBlock;
    	if(totalPage%perBlock!=0)
    		totalBlock++;
    	
    	
    	int curBlock = curPage/perBlock;
    	if(curPage%perBlock!=0)
    		curBlock++;
    	
    	int startNum = perBlock*(curBlock-1)+1;
    	int lastNum = perBlock*curBlock;
    	
    	if(curBlock==totalBlock)
     		lastNum=totalPage;
     	
    	if(startNum<0){
     		startNum=1;
     		lastNum=5;
     		curPage=1;	
     		startRow=1;
     		lastRow=10;
     	}
     	
    	arr = dao.selectList(search,startRow, lastRow);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include css file -->
<%@include file="../temp/css_meta.jsp" %>

<!-- stylesheet -->
<style type="text/css">
	.main{
		min-height:800px;
	}
	table{
		text-align: center;
	}
	table>thead{
		background-color: #0f1f3d;
		color:white;
	}
	
	.txt>a{
		text-decoration: none;
		color:black;
	}
</style>


</head>
<body>
	<%@include file="../temp/header_nav.jsp" %>
	
	
	<div class="container main">
		<div class="row">
			<h1> notice page </h1>
		</div>
		
		<!--------------- table --------------->
		<div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="5%">NO</th>
						<th width="70%">Title</th>
						<th width="10%">Writer</th>
						<th width="10%">Date</th>
						<th width="5%">HIT</th>
					</tr>
				</thead>
				<tbody>
				<%for(noticeDTO dto: arr){%>
					<tr>
						<td><%=dto.getNum() %></td>
						<td class="txt" title="<%=dto.getNum() %>"><%=dto.getTitle() %></td>
						<td><%=dto.getWriter() %></td>
						<td><%=dto.getReg_date() %></td>
						<td><%=dto.getHit() %></td>
					</tr>				
				<%}%>
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<form action="./notice.jsp">
				<select>
					<option value="t">제목</option>
					<option value="w">작성자</option>
					<option value="c">내용</option>
				</select>
				<input type="text">
				<button>검색</button>			
			</form>
		</div>
			
		<div class="row">
 			<%if(curBlock>1){ %>
 				<a href="./notice.jsp?curPage=<%=startNum-1%>">이전</a>
 			<% }%>
 				
 			<% for(int i=startNum;i<=lastNum;i++){ %>
 				<a href="./notice.jsp?curPage=<%=i%>" ><%=i %></a>
 			<% } %>
 			
 			<%if(curBlock<totalBlock){ %>
 				<a href="./notice.jsp?curPage=<%=lastNum+1%>">다음</a>
 			<% }%>
 		</div>
		
		<div>
		<form action="./noticeSelect.jsp" method="post">
			<input type="hidden" id="num" name="num" value="">
			<button id="click_btn"style="display:none;">click</button>
		</form>
		</div>
		
		
		<div class="row">
			<a href="./noticeWrite.jsp" class="btn btn-primary" 
			style="background-color: #1e3f7b; border-color:#1e3f7b; ">Write</a>
		</div>
		
		
	</div>

	<%@include file="../temp/footer.jsp" %>
	<script type="text/javascript">
		
		$(".txt").click(function() {
			var n = $(this).attr("title");
			$("#num").val(n);
			$("#click_btn").click(); //혹은 .submit();
		})
	</script>

	
</body>
</html>
		
		