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
<title>Q&A 게시판: 목록보기</title>
<script type="text/javascript" src="/jiksan/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function showWriteForm(){
	location.href = "/jiksan/views/qa/qaWriteForm.jsp?page=<%= currentPage %>";
}

$(function(){
	showDiv();
	
	$("input[name=item]").on("change", function(){
		showDiv();
	});
}); //jquery document ready

function showDiv(){
	if($("input[name=item]").eq(0).is(":checked")){
		$("#titleDiv").css("display", "block");
		$("#writerDiv").css("display", "none");
	}
	
	if($("input[name=item]").eq(1).is(":checked")){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "block");
	}
	
	if($("input[name=item]").eq(2).is(":checked")){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "none");
	}
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
<br><br>

<%-- <h1 align="center">총 목록 갯수 : <%= listCount %></h1> --%>

<center>
<div>
	<h2>검색할 항목을 선택하시오.</h2>
	<input type="radio" name="item" value="title" checked> 제목 &nbsp; &nbsp; &nbsp;
	<input type="radio" name="item" value="writer"> 작성자 &nbsp; &nbsp; &nbsp;
</div>
<div id="titleDiv">
	<form action="/jiksan/qasearch" method="post">
		<input type="hidden" name="search" value="title">
		<label>검색할 제목을 입력하시오 : <input type="search" name="keyword"></label>
		<input type="submit" value="검색">
	</form>
</div>
<div id="writerDiv">
	<form action="/jiksan/qasearch" method="post">
		<input type="hidden" name="search" value="writer">
		<label>검색할 작성자 아이디를 입력하시오 : <input type="search" name="keyword"></label>
		<input type="submit" value="검색">
	</form>
</div>
</center>
<%-- 로그인한 사용자만 글쓰기 기능 사용할 수 있게 함 --%>
<% if(loginUser != null){ %>
<div style="align:center; text-align:center;">
	<button onclick="showWriteForm();">글쓰기</button>
</div>
<% } %>
<br>
<table align="center" border="1" width="700" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
</tr>
<% for(Qa qa : list){ %>
<tr>
	<td align="center"><%= qa.getQaNo() %></td>
	<td>
	<%-- 댓글일때는 제목을 들여쓰기함 --%>
	<% if(qa.getQaReplyLev() == 2){  //원글의 댓글일 때 %>
	&nbsp; &nbsp; ▶ 
	<% }else if(qa.getQaReplyLev() == 3){ //댓글의 댓글일 때 %>
	&nbsp; &nbsp; &nbsp; &nbsp; ▶▶
	<% } %>
	<%-- 로그인한 사용자만 게시글 상세보기할 수 있게 처리함 --%>
	<% if(loginUser != null){ %>
	<a href="/jiksan/qadetail?qanum=<%= qa.getQaNo() %>&page=<%= currentPage %>"><%= qa.getQaTitle() %></a>
	<% }else{ %>
	<%= qa.getQaTitle() %>
	<% } %>
	</td>
	<td align="center"><%= qa.getQaWriter() %></td>
	<td align="center"><%= qa.getQaDate() %></td>
	<td align="center"><%= qa.getQaReadCount() %></td>
</tr>
<% } //for each  %>
</table>
<br>
<%-- 페이징 처리 
	[맨처음][이전] 숫자...........  [다음][맨끝]
--%>
<div style="text-align: center;">
<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
<% if(currentPage <= 1){ %>
[맨처음]
<% }else{ %>
<a href="/jiksan/qalist?page=1">[맨처음]</a>
<% } %> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<% if((currentPage - 10) < startPage && (currentPage - 10) >= 1){ %>
<a href="/jiksan/qalist?page=<%= startPage - 10 %>">[이전]</a>
<% }else{ %>
[이전]
<% } %> &nbsp;
<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
<font size="4" color="red">[<%= p %>]</font>
<% }else{ %>
<a href="/jiksan/qalist?page=<%= p %>"><%= p %></a>
<%  } //else 
	} //for %> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){ %>
<a href="/jiksan/qalist?page=<%= endPage + 10 %>">[다음]</a>
<% }else{ %>
[다음]
<% } %> &nbsp;
<%-- 현재 페이지가 끝이 아니면 링크설정, 끝페이지이면 링크없음 --%>
<% if(currentPage >= maxPage){ %>
[맨끝]
<% }else{ %>
<a href="/jiksan/qalist?page=<%= maxPage %>">[맨끝]</a>
<% } %>
</div>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>









