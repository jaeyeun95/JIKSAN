<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int currentPage = Integer.parseInt(request.getParameter("page"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판: 정보 등록하기</title>
<style type="text/css">
	#table tr th td{
		background:white;
	}
</style>
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

<h2 align="center">Qa 원글 등록 페이지</h2>
<%-- form 의 입력값 전송시, 파일업로드도 함께 하려면
     반드시 enctype="multipart/form-data" 속성 추가해야 함 --%>
<form action="/jiksan/qainsert" method="post">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="3" id="table">
<tr><th>제 목</th><td><input type="text" name="qtitle" size="50"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="qwriter" value="<%= loginUser.getUserId() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="qcontent" rows="5" cols="50"></textarea></td></tr>
<tr><th colspan="2"><input type="submit" value="원글등록"> &nbsp; 
<input type="reset" value="작성취소"></th></tr>
<tr><th colspan="2">
	<a href="/jiksan/qalist?page=<%= currentPage %>">목록</a> &nbsp; 
	<a href="javascript:history.go(-1);">이전 페이지로</a>
</th></tr>
</table>
</form>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>