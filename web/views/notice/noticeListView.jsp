<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.util.ArrayList, notice.model.vo.Notice, java.sql.Date"  %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
 	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	String category = (String)request.getAttribute("category");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항: 목록보기</title>
<script type="text/javascript" >


function showWriteForm(){
	location.href = "/jiksan/views/Notice/NoticeAdminWrite.jsp?page=<%= currentPage	%>";
}
</script>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menubar.jsp" %>
<div class="lnb">    
   <h2 class="lnb_title">커뮤니티</h2>      
   <ul class="lnb_menu">
      <li><a href="nlist">공지사항</a></li>
      <li><a href="faqlist">자주묻는 질문</a></li>
      <li><a href="qalist">Q&A 게시판</a>
   </ul>            
   <div class="lnb_box01">
      <dl class="lnb_txt01">
         <dt><b>직산 가정의학과 의원</b></dt>
      </dl>
      <p class="num">041-573-5595</p>
   </div>
   <div class="lnb_box02">
      <p class="num02"><span>평일</span> 08:30 ~ 18:00</p>
      <p class="num02"><span>토요일</span> 09:00 ~ 13:00</p>
      <p class="num02"><span>점심시간</span> 13:00 ~ 14:00</p>
      <p class="time_comment">화요일 야간진료는 21:00 까지이며, <br>일요일/공휴일은 휴무입니다.</p>
   </div>
   <hr id="floatClear">
</div>
<BR><BR>

<h1 align="center">공지사항</h1>

   <form align="center" action="/jiksan/nsearch" method="post">
      <select name="category">
      		<option value="title" selected>제목</option>
      		<option value="content">내용</option>
      </select>
      <input type="search" name="keyword" size=40px;>
      <input type="submit" value="검색" >
   </form>

   
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
<tr>
	<th width="70">번호</th>
	<th>제목</th>
	<!-- <th width="70">작성자</th> -->
	<th width="70">첨부파일</th>
	<th width="100">등록날짜</th>
	<th width="70">조회수</th>
</tr>
		<% for(Notice n : list){ %>
			<tr>
					<td align="center"><%=n.getNoticeNo() %></td>
					<td align="center"><a href="/jiksan/ndetail?notice_no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle()  %></a></td>
					<%-- <td align="center"><%=n.getNoticeWriter()%></td> --%>
					<td align="center"><% if(n.getNoticeOriginFileName() != null){%>
														■
													<%}else{ %>
														x
													<%} %></td>
					<td align="center"><%=n.getNoticeDate() %></td>
					<td align="center"><%=n.getNoticeCount() %></td>
			</tr>
		<%} %>
</table>
<%-- 검색용 번호 리스트  --%>
<% if(keyword == null){ %>
<div style="text-align: center;">

<%  if(currentPage <= 1){  %>
[맨처음]
<%}else{ %>
<a href="/jiksan/nlist?page=1">[맨처음]</a>
<% }  %> &nbsp;

<%  if((currentPage-10) < startPage && (currentPage - 10) >= 1){  %>
<a href="/jiksan/nlist?page=<%= startPage-10 %>">[이전]</a>
<%}else{ %>
[이전]
<% }  %> &nbsp;


<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){	
%>
<font size="4" color="red">[<%= p  %>]</font>
<% }else{ %>
<a href="/jiksan/nlist?page=<%= p %>"><%= p  %></a>
<% }
		} %> &nbsp;

<%  if((currentPage+10) > endPage && (currentPage + 10) < maxPage){  %>
<a href="/jiksan/nlist?page=<%= startPage+10 %>">[다음]</a>
<%}else{ %>
[다음]
<% }  %> &nbsp;


<%  if(currentPage >= maxPage){  %>
[맨끝]
<%}else{ %>
<a href="/jiksan/nlist?page=<%= maxPage %>">[맨끝]</a>
<% }  %>
&nbsp;
<%}else{ %>


<%-- 검색용 번호 리스트  --%>
<div style="text-align: center;">
<%  if(currentPage <= 1){  %>
[맨처음]
<%}else{ %>
<a href="/jiksan/nsearch?page=1&category=<%= category %>&keyword=<%= keyword %>">[맨처음]</a>
<% }  %> &nbsp;

<%  if((currentPage-10) < startPage && (currentPage - 10) >= 1){  %>
<a href="/jiksan/nsearch?page=<%= startPage-10 %>&category=<%= category %>&keyword=<%= keyword %>">[이전]</a>
<%}else{ %>
[이전]
<% }  %> &nbsp;


<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){	
%>
<font size="4" color="red">[<%= p  %>]</font>
<% }else{ %>
<a href="/jiksan/nsearch?page=<%= p %>&category=<%= category %>&keyword=<%= keyword %>"><%= p  %></a>

<% }
		} %> &nbsp;

<%  if((currentPage+10) > endPage && (currentPage + 10) < maxPage){  %>
<a href="/jiksan/nsearch?page=<%= startPage+10 %>&category=<%= category %>&keyword=<%= keyword %>">[다음]</a>
<%}else{ %>
[다음]
<% }  %> &nbsp;


<%  if(currentPage >= maxPage){  %>
[맨끝]
<%}else{ %>
<a href="/jiksan/nsearch?page=<%= maxPage %>&category=<%= category %>&keyword=<%= keyword %>">[맨끝]</a>
<% }  %>
&nbsp;
<% } %>

</div>

<hr>
<%@ include file ="../common/footer.jsp"  %>
</body>
</html>
