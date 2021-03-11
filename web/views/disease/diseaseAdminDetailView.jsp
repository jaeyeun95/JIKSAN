<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="disease.model.vo.Disease" errorPage="./views/common/error.jsp" %>
<%
	Disease disease = (Disease)request.getAttribute("disease");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강정보(질환백과): 상세보기</title>
<script type="text/javascript">
function fnDel(disease_no){
	if(confirm("정말로 삭제 하시겠습니까?")){
		location.href = "/jiksan/ddelete.ad?disease_no=" + disease_no;
}
	return false;
}
</script>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
</head>
<body>
<%@ include file = "../common/header.jsp" %>
<%@ include file ="../common/menubar.jsp"  %>
<%-- -------------------------------------------------- SIDE BAR MENU 사이드 메뉴  [구문 START] --------------------------------------------------   --%>
<div class="lnb">    
	<h2 class="lnb_title">건강정보</h2>		
	<ul class="lnb_menu">
		<li class="on"><a href="#">질환백과</a></li>
		<li><a href="/jiksan/views/common/error.jsp">최근 환자 분석</a></li>
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
<%-- -------------------------------------------------- SIDE BAR MENU 사이드 메뉴  [구문 END] --------------------------------------------------   --%>

<br><br>
<h1 align="center">관리자용 질환백과</h1>
<br>

<form action="/jiksan/dupdate.ad" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" value="<%= disease.getDiseaseNo() %>">
<input type="hidden" name="deptno" value="<%= disease.getDeptNo() %>">
<input type="hidden" name="reservable" value="<%= disease.getReservable() %>">
<input type="hidden" name="altNm" value="<%= disease.getDiseaseAltNm() %>">

<h3 align="left"><%= disease.getDiseaseNm() %></h3>

<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect01() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><input type="text" value="<%= disease.getText01() %> name ="sect01" size="150"></td></tr>
	<tr><td align="center" width="auto" height="auto">
			<%if(disease.getPic06() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic01() %>" >
			&nbsp; <input type="checkbox" name="deleteFlag" value="yes">파일삭제<br>
			<%}else{ %> <br><%} %><input type="file" name="upfile"></td></tr>
</table>

<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect02() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%= disease.getText02() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%if(disease.getPic02() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic02() %>" >
																										<%}else{ %> <%} %></td></tr>
</table>
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect03() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%= disease.getText03() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%if(disease.getPic03() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic03() %>" >
																										<%}else{ %> <%} %></td></tr>
</table>
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect04() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%= disease.getText04() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%if(disease.getPic04() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic04() %>" >
																										<%}else{ %> <%} %></td></tr>
</table>
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect05() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%= disease.getText05() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%if(disease.getPic05() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic05() %>" >
																										<%}else{ %> <%} %></td></tr>
</table>
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect06() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%= disease.getText06() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%if(disease.getPic06() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic06() %>" >
																										<%}else{ %> <%} %></td></tr>
</table>
<table align="center" width="900" border="1" cellspacing="0" cellpadding="1" >
	<tr><td align="center" width="75%" height="50px"><%= disease.getSect07() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%= disease.getText07() %></td></tr>
	<tr><td align="center" width="auto" height="auto"><%if(disease.getPic07() !=null){%><img src="/jiksan/resources/disease_files/<%= disease.getPic07() %>" >
																										<%}else{ %> <%} %></td></tr>
	<tr>
		<td align="right">
			<button onclick="javascript:location.href='/jiksan/dlist;'">질환백과 목록</button>
			<input type="submit" value ="수정">
			<input type="button" value="삭제" onclick="fnDel('<%= disease.getDiseaseNo() %>')">
		</td>
	</tr>
</table>
<hr>


</form>
<%@ include file = "../common/footer.jsp" %>
</body>
</html>