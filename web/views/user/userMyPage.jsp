<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직산 가정의학 의원</title>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menubar.jsp" %>
<div class="lnb">    
	<h2 class="lnb_title">병원안내</h2>		
	<ul class="lnb_menu">
									<li class="on"><a href="/jiksan/views/about/about-clinic.jsp">병원안내</a></li>
									<li><a href="/jiksan/views/about/about-services.jsp">진료안내</a></li>
									<li><a href="/jiksan/views/about/about-team.jsp">의료진 소개</a></li>
									<li><a href="/jiksan/views/about/contact-us.jsp">오시는길</a></li>
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

<section>
<table border="1">
	<caption>회원정보</caption>
	<tr><th>아이디</th><td><%= loginUser.getUserNm() %></td><th>닉네임</th><td><%= loginUser.getNickNm() %></td></tr>
	<tr><th>휴대폰</th><td><%= loginUser.getPhone() %></td><th>생년월일</th><td><%= loginUser.getBirthday() %></td></tr>
	<tr><th>주소</th><td colspan="3"><%= loginUser.getAddress() %></td></tr>
	<tr><td colspan="4"><input type="button" value="정보수정" onclick="location.href='/jiksan/views/user/userUpdateView.jsp'"></td></tr>
</table>
</section>

<section>
<table width="500">
<caption>예약 내역</caption>
<tr><th>1</th><td><a href="#">링크</a></td></tr>
</table>
</section>

<section>
<table width="500">
<caption>좋아요 누른 게시물</caption>
<tr><th>1</th><td><a href="#">링크</a></td></tr>
</table>
</section>

</body>
</html>