<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항: 상세보기</title>
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

<h1 align="center">공지사항</h1>
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><th align="center" width="70">제목</th><td colspan="3" align="left"><%= notice.getNoticeTitle() %></td></tr>
	<%-- <tr><td align="center" width="70">작성자</td><td colspan="3"><%=notice.getNoticeWriter() %></td></tr> --%>
	<tr><th align="center" width="70">등록날짜</th><td width="380" align="left"><%=notice.getNoticeDate() %></td><td align="center" width="70">조회수</td><td><%=notice.getNoticeCount() %></td></tr>
	<tr><th align="center" width="70">첨부파일</th>
			<td colspan="3" align="left"><% if(notice.getNoticeOriginFileName() !=null){ %>
										<a href="/jiksan/nfdown?ofile=<%=notice.getNoticeOriginFileName()  %>&rfile=<%= notice.getNoticeRenameFileName()  %>"><%= notice.getNoticeOriginFileName() %></a>
										<%}else{ %>
										첨부파일 없음
										<%} %>
			</td>
	</tr>
	
	<tr height="300"><td colspan="4" align="left"><%=notice.getNoticeContent() %></td></tr>
	<tr>
		<td colspan="4" align="right">

			<button onclick="javascript:location.href='/jiksan/nlist;'">목록</button>
		</td>
	</tr>
</table>
<hr>
<%@ include file = "../common/footer.jsp" %>

</body>
</html>