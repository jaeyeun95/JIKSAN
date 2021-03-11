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
<script type="text/javascript">
	function fnDel(no){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.href = "/jiksan/ndelete.ad?no=" + no;
	}
		return false;
	}
</script>
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


<h1 align="center">관리자용 공지사항</h1>
<form action="/jiksan/nupdate.ad" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" value="<%= notice.getNoticeNo() %>">
<input type="hidden" name="ofile" value="<%= notice.getNoticeOriginFileName() %>">
<input type="hidden" name="rfile" value="<%= notice.getNoticeRenameFileName() %>">
 
<table align="center" >
	<tr><th>제목</th><td colspan="3" align="left"><input type="text" value="<%= notice.getNoticeTitle() %>"name="title" size="50" ></td></tr>
<%-- 	<tr><td align="center" width="70">작성자</td><td colspan="3"><input type="text" readonly value="<%=notice.getNoticeWriter() %>"name="writer"></td></tr> --%>
	<tr><th>등록날짜</th><td align="left"><input type="date" readonly value="<%=notice.getNoticeDate() %>" ></td><td width="70">조회수</td><td><%=notice.getNoticeCount() %></td></tr>
	<tr><th>첨부파일</th>
			<td colspan="3" align="left"><% if(notice.getNoticeOriginFileName() !=null){ %>
										<a href="/jiksan/nfdown?ofile=<%=notice.getNoticeOriginFileName()  %>&rfile=<%= notice.getNoticeRenameFileName()  %>"><%= notice.getNoticeOriginFileName() %></a>
										&nbsp; <input type="checkbox" name="deleteFlag" value="yes">파일삭제<br>
										<%}else{ %>
										<input type="checkbox" name="deleteFlag" value="yes">첨부파일 없음<br>
										<% } %>
										<input type="file" name="upfile">
										
			</td>
	</tr>
	
	<tr height="300"><td colspan="4"><textarea name="content" rows="20" cols="120"><%=notice.getNoticeContent() %></textarea></td></tr>
	<tr>
		<td colspan="4" align="right">
			<%-- <input type="button"  value="목록" onclick="javascript:location.href='/jiksan/nlist;'">
			<input type="submit" value ="수정">
			<input type="button" value ="삭제" onclick="javascript:location.href='/jiksan/ndelete.ad?no=<%= notice.getNoticeNo() %>&rfile=<%= notice.getNoticeRenameFileName()  %>';return false;"> --%>
			<input type="button"  value="목록" onclick="javascript:location.href='/jiksan/nlist;'">
			<input type="submit" value ="수정">
			<input type="button" value="삭제" onclick="fnDel('<%= notice.getNoticeNo() %>&rfile=<%= notice.getNoticeRenameFileName()  %>')">
		</td>
	</tr>
</table>
</form>
<hr>
<%@ include file = "../common/footer.jsp" %>

</body>
</html>