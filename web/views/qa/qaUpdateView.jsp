<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qa.model.vo.Qa" %>
<%
	Qa qa = (Qa)request.getAttribute("qa");
	int currentPage = ((Integer)request.getAttribute("page")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판: 수정하기</title>
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
<br><br>
<h2 align="center"><%= qa.getQaNo() %>번 게시글 수정 페이지</h2>
<%-- 원글 수정 --%>
<% if(qa.getQaReplyLev() == 1){ %>
<form action="/jiksan/qaoriginup" method="post">
<input type="hidden" name="qanum" value="<%= qa.getQaNo() %>">
<input type="hidden" name="page" value="<%= currentPage %>">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="3">
<tr><th>제 목</th><td><input type="text" name="qtitle" size="50" value="<%= qa.getQaTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="qwriter" value="<%= qa.getQaWriter() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="qcontent" rows="5" cols="50"><%= qa.getQaContent() %></textarea></td></tr>
<tr><th colspan="2"><input type="submit" value="수정하기"> &nbsp; 
<input type="reset" value="수정취소"></th></tr>
<tr><th colspan="2">
	<a href="/jiksan/qalist?page=<%= currentPage %>">목록</a> &nbsp; 
	<a href="javascript:history.go(-1);">이전 페이지로</a>
</th></tr>
</table>
</form>
<% }else{ %>
<%-- 댓글 | 대댓글 수정 --%>
<form action="/jiksan/qareplyup" method="post">
<input type="hidden" name="qanum" value="<%= qa.getQaNo() %>">
<input type="hidden" name="page" value="<%= currentPage %>">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="3">
<tr><th>제 목</th><td><input type="text" name="qtitle" size="50" value="<%= qa.getQaTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="qwriter" value="<%= qa.getQaWriter() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="qcontent" rows="5" cols="50"><%= qa.getQaContent() %></textarea></td></tr>
<tr><th colspan="2"><input type="submit" value="수정하기"> &nbsp; 
<input type="reset" value="수정취소"></th></tr>
<tr><th colspan="2">
	<a href="/jiksan/qalist?page=<%= currentPage %>">목록</a> &nbsp; 
	<a href="javascript:history.go(-1);">이전 페이지로</a>
</th></tr>
</table>
</form>
<% } %>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>