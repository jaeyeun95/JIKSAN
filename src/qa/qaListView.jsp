<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qa.model.vo.Qa, java.util.ArrayList, java.sql.Date" %>   
<%
	ArrayList<Qa> list = (ArrayList<Qa>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jiksan</title>
<script type="text/javascript">
function showWriteForm(){
	location.href = "/jiksan/views/qa/qaWriteForm.jsp?page=<%= currentPage %>";
}
</script>
</head>
<body>
<%-- <%@ include file="../common/header.jsp" %> --%>
<hr>
<div style="align:center; text-align:center;">
	<button onclick="showWriteForm();">글쓰기</button>
</div>
<br>
<table align="center" border="1" width="700" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>조회수</th><th>작성자</th><th>작성일자</th></tr>
<% for(Qa qa : list){ %>
<tr>
	<td align="center"><%= qa.getQaNo() %></td>
	<!-- <td> -->
	<%-- 댓글일때는 제목을 들여쓰기함
	<% if(board.getBoardReplyLev() == 2){  //원글의 댓글일 때 %>
	&nbsp; &nbsp; ▶ 
	<% }else if(board.getBoardReplyLev() == 3){ //댓글의 댓글일 때 %>
	&nbsp; &nbsp; &nbsp; &nbsp; ▶▶
	<% } %>
	로그인한 사용자만 게시글 상세보기할 수 있게 처리함
	<% if(loginMember != null){ %>
	<a href="/first/bdetail?bnum=<%= board.getBoardNum() %>&page=<%= currentPage %>"><%= board.getBoardTitle() %></a>
	<% }else{ %>
	<%= board.getBoardTitle() %>
	<% } %> --%>
	</td>
	<td align="center"><%= qa.getQaTitle() %></td>
	<td align="center"><%= qa.getQaCount() %></td>
	<td align="center"><%= qa.getQaWriter() %></td>
	<td align="center"><%= qa.getQaDate() %></td>
	
</tr>
<% } //for each  %> 
</table>


<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>