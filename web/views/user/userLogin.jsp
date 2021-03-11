<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직산 가정의학 의원</title>
<style type="text/css">
section table#loginTbl {
	float: center;
	border: 1px solid black;
	width: 500px;
}
</style>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
<script type="text/javascript"> //자바스크립트 안에 자바코드
<%
String clientId = "fqQoUV89itlpdGTeJSUv";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://localhost:8800/jiksan/", "UTF-8");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;
session.setAttribute("state", state);
%>

function popupOpen(){
	var popUrl = "<%=apiURL%>";	//팝업창에 출력될 페이지 URL
	/* 그냥 띄우는 법
	var popOption = "width=460, height=690, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	window.open(popUrl,"", popOption); 
	*/ 
	
	//팝업창을 중앙에 정렬(모니터 화면 기준)
	var popupWidth =460;
	var popupHeight =690;
	var popupX =(window.screen.width/2)-(popupWidth/2);
	var popupY =(window.screen.height/2)-(popupHeight/2);
	window.open(popUrl,"", 'status=no, height=690, width=460, left='+ popupX + ', top='+ popupY);
	
	/*  팝업창을 중앙에 정렬(브라우저 화면 기준)
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (300 / 2);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('', '', 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
    */
	
}

function doneLogin(){
	location.href="/jiksan/index.jsp";
}
</script>
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

<div align="center">
<% if(loginUser == null){ //로그인 안 했다면 %>
<form action="/jiksan/login.cp" method="post">
<table id="loginTbl">
	<tr><th colspan="2">아이디 / 비빌번호 LOGIN</th></tr>
	<tr>
		<th>아이디 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="user_id"></th>
		<td align="left" rowspan="2"><input type="submit" value="로그인"></td>
	</tr>
	<tr>
		<th>비밀번호 &nbsp; <input type="password" name="user_pw"></th>
	</tr>
	<tr>
		<td align="center" colspan="2"><a href="#">아이디 찾기</a> &nbsp; | &nbsp; <a href="#">비밀번호 찾기</a></td>
	</tr> 
	<tr>
		<td align="center" colspan="2"><input type="radio" name="remember" value="rememberid">아이디 기억하기 &nbsp; 
		<input type="radio" name="remember" value="rememberidpw">로그인 상태 유지하기</td>
	</tr> 
	
	<tr>
		<td align="center" colspan="2">
			<table>
			<tr><td align="center" >소셜계정으로 로그인</td></tr>
			<tr><td align="center" >
			<a href="javascript:popupOpen();"><img src="/jiksan/resources/user_files/naver.logo.png" width="199" height="47"></a>
			<a href="#"><img src="/jiksan/resources/user_files/kakao.logo.png" width="199" height="47"></a>
			</td></tr>
			</table>
		</td>
	</tr>
		
	<tr>
		<td align="center" colspan="2">▪아직 회원가입을 하지 않으셨나요? <a href="/jiksan/views/user/userEnroll.jsp">회원가입</a></td>
	</tr>
</table>
</form>
<% }else{ //로그인했다면%>
<table id="loginTbl">
	<tr><th><%= loginUser.getUserNm() %> 님</th>
	<tr><th><a href="/jiksan/views/user/userMyPage.jsp">마이페이지</a></th>
	<td><a href="/jiksan/logout">로그아웃</a></td></tr>
</table>
<% } %>
</div>
<hr>

<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>