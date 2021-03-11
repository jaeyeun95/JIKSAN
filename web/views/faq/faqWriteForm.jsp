<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="faq.model.vo.Faq" errorPage="./views/common/error.jsp"%>
<%
	Faq faq = (Faq)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 자주묻는 질문</title>
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
<h1 align="center">FAQ 자주 묻는 질문</h1>
<br>
<form action="/jiksan/faqinsert" method="post">
<%-- <div align="center">
	<input type="hidden" name="faq_date" value="<%= faq.getFaqDate() %>">
	<p><label>제목 : <input type="text" name="faq_title" size="70"></label></p> 
	<p><label>내용 : <textarea rows="10" cols="70" name="faq_text"></textarea></label></p>
	<input type="submit" value="등록하기"> &nbsp; 
	<input type="reset" value="작성취소" onclick="javascript:history.go(-1); return false;"> &nbsp; 
	<input type="button" value="목록" onclick="javascript:history.go(-1); return false;">
</div> --%>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr><th>제 목</th>
<td><input type="text" name="faq_title" size="70"></td></tr>
<tr><th>내 용</th>
<td><textarea rows="10" cols="70" name="faq_text"></textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="등록하기"> &nbsp; 
	<input type="reset" value="작성취소" onclick="javascript:history.go(-1); return false;"> &nbsp; 
	<input type="button" value="목록" onclick="javascript:history.go(-1); return false;"></th></tr>
</table>


</form>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>