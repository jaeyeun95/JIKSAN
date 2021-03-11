<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./views/common/error.jsp"%>
    <%@ page import="java.util.ArrayList, faq.model.vo.Faq" %>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
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

<br>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
<tr><th>순번</th><th>제목</th><th>작성일시</th></tr>
<% for(Faq f : list){ %>
	<tr>
		<td align="center"><%= f.getFaqNo() %></td>
		<td align="center"><a href="/jiksan/faqdetail?faq_no=<%= f.getFaqNo() %>"><%= f.getFaqTitle() %></a></td>
		<td align="center"><%= f.getFaqDate() %></td>
	</tr>
<% } //for each %>
</table>

<div style="text-align: center;">
<button onclick="javascript:location.href='/jiksan/views/faq/faqWriteForm.jsp';">FAQ 등록</button>
</div>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>

