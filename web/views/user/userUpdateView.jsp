<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User" %>
<%
	//생년월일(birthday)을 값을 각각의 문자열로 분리 처리
	String[] Birthday = user.getBirthday().toString().split("/");
	
	//주소(address)를 값을 각각의 문자열로 분리 처리
	String[] Address = user.getAddress().split(",");
%>    
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

<%@ include file="../common/header.jsp" %>
<hr>
<h1 align="center">회원 정보 수정 페이지</h1>
<br>
<form action="/jiksan/uupdate" method="post">
<table id="outer" align="center" width="500" cellspacing="5" cellpadding="0">
<tr><th width="120">이 름</th>
	<td><input type="text" name="user_nm" value="<%= user.getUserNm() %>" readonly></td>
</tr>
<tr><th width="120">아이디</th>
	<td><input type="text" name="user_id" value="<%= user.getUserId() %>" readonly></td></tr>
<tr>	<th width="120">비밀번호</th>
	<td><input type="password" name="user_pw" id="user_pw1">&nbsp;
	영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~20자</td></tr>
	<tr><th width="120">비밀번호 확인</th>
	<td><input type="password" id="user_pw2"></td></tr>
<tr><th width="120">휴대폰</th>
	<td><input type="tel" name="phone" value="<%= user.getPhone() %>"></td></tr>

<tr><th width="120">주소</th>
		<td>
			<table>
			<tr><td><input type="text" name="address" > &nbsp; <input type="button" value="우편번호" onclick=";"></td></tr>
	 		<tr><td><input type="text" name="address" placeholder="우편번호 검색 시 자동입력">&nbsp; 기본주소</td></tr>
 			<tr><td><input type="text" name="address" >&nbsp; 나머지 주소</td></tr>
			</table>
		</td>
	</tr>
	
<tr><th width="120">닉네임</th>
	<td><input type="text" name="nick_nm" value="<%= user.getNickNm() %>" readonly>
	
	<tr><th width="120">생년월일</th>
	<td><input style="width:33px;" type="text" name="birthday" placeholder="yyyy" id="birthday">년&nbsp;
		<input style="width:33px;" type="text" name="birthday" placeholder="mm">월&nbsp;
		<input style="width:33px;" type="text" name="birthday" placeholder="dd">일&nbsp;
	</td></tr>

<tr><th width="120">성 별</th>
	<td>
	<% if(user.getGender().equals("M")){ %>
		<input type="radio" name="gender" value="M" checked readonly> 남자 &nbsp; 
		<input type="radio" name="gender" value="F" readonly> 여자
	<% }else{ %>
		<input type="radio" name="gender" value="M" readonly> 남자 &nbsp; 
		<input type="radio" name="gender" value="F" checked readonly> 여자
	<% } %>
	</td></tr>


<tr><th width="120" colspan="2">
	<input type="button" value="탈퇴하기" onclick="location.href=''"> &nbsp; 
	<input type="submit" value="수정하기">
</th></tr>
</table>
</form>



<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>