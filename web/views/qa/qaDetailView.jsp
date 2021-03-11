<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qa.model.vo.Qa" %>   
<%
	Qa qa = (Qa)request.getAttribute("qa");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판: 상세보기</title>
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

<table align="center" >
   <tr><th>제목</th><td colspan="3" align="left"><input type="text" value="<%= qa.getQaTitle() %>"name="qtitle" size="50" ></td></tr>
   <tr><th>등록날짜</th><td align="left"><input type="date" readonly value="<%=qa.getQaDate() %>" ></td><td width="70">조회수</td><td><%= qa.getQaReadCount() %></td></tr>
   <tr><th>내 용</th><td><%= qa.getQaContent() %></td></tr>
   <tr height="300"><td colspan="4"><textarea name="qcontent" rows="20" cols="120"><%= qa.getQaContent() %></textarea></td></tr>
   <tr>
      <td colspan="4" align="right">
     	 <% if(loginUser != null){ //로그인한 경우 %>
			<% if(qa.getQaReplyLev() < 3) { %>
      	 <input type="button" value="댓글달기" onclick="javascript:location.href='/jiksan/views/qa/qaReplyForm.jsp?qanum=<%= qa.getQaNo() %>&page=<%= currentPage %>'">
         <input type="button"  value="목록" onclick="javascript:location.href='/jiksan/qalist;'">
         <% } %>
			<% if(loginUser.getUserId().equals(qa.getQaWriter()) == true){ //회원 자신의 글일때만 수정/삭제할 수 있게 함 %>
         <input type="button" value ="수정" onclick="javascript:location.href='/jiksan/qaupview?qanum=<%= qa.getQaNo() %>&page=<%= currentPage %>'">
         
         <!-- onclick="javascript:location.href='/jiksan/qaoriginup;' -->
         <input type="button" value ="삭제" onclick="javascript:location.href='/jiksan/qadelete?qanum=<%= qa.getQaNo() %>&level=<%= qa.getQaReplyLev() %>'">
         <!-- onclick="javascript:location.href='/jiksan/qadelete;' -->
         <% }} %>
      </td>
   </tr>
</table>

<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>





