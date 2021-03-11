<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항: 정보 등록하기</title>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>

<script type="text/javascript">
	function fnCan(no){
		if(confirm("정말로 취소 하시겠습니까?")){
			location.href = "/jiksan/nlist?no=" + no;
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
<h1 align="center">공지사항 글쓰기</h1>
<form action="/jiksan/ninsert.ad" method="post" enctype="multipart/form-data">
<!-- 테이블 테스트 -->
<table align="center">
	<tr><th>제목</th><td align="left"><input type="text" name="title" size="50" ></td></tr>
<!-- 	<tr><td align="center" width="70">작성자</td><td colspan="3"><input type="text" name="writer" size="50"></td></tr> -->
	<tr><th>첨부파일</th><td align="left"><input type="file" name="ofile"></td></tr>
	
	<tr><td colspan="4"><textarea rows="10" cols="130" name="content"></textarea></td></tr>
	<tr>
		<td colspan="4" >
			<!-- <input type="reset" value="취소" onclick="javascript:location.href='/jiksan/nlist;'">
			<input type="button"  value="목록" onclick="javascript:location.href='/jiksan/nlist;'">
			<input type="submit" value ="등록">-->
			<button type="reset" onclick="fnCan('/jiksan/nlist')">취소</button>
			<button type="submit" >등록</button>
		</td>
	</tr>
</table>

</form>
<hr>

<%@ include file="../common/footer.jsp" %>
</body>
</html>