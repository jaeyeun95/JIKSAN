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
<h2 align="center">마이페이지</h2>
<br>
<table id="outer" align="center" width="500" cellspacing="5" cellpadding="0">
<tr><th width="120">이 름</th><td><%= loginUser.getUserNm() %></td></tr>
<tr><th width="120">아이디</th><td><%= loginUser.getUserId() %></td></tr>
<tr><th width="120">비밀번호</th><td><%= loginUser.getUserPw() %></td></tr>
<tr><th width="120">휴대폰</th><td><%= loginUser.getPhone() %></td></tr>
<tr><th width="120">주소</th><td><%= loginUser.getAddress() %></td></tr>
<tr><th width="120">닉네임</th><td><%= loginUser.getNickNm() %></td></tr>
<tr><th width="120">생년월일</th><td><%= loginUser.getBirthday() %></td></tr>
<tr><th width="120">성별</th><td><%= loginUser.getGender() %></td></tr>
<tr><th width="120" colspan="2">
	<button onclick="moveUpdateView();">수정 페이지로 이동</button> &nbsp; 
	<button onclick="sendDelete();">탈퇴하기</button>	
</th></tr>
<script type="text/javascript">
function moveUpdateView(){
	//요청한 회원의 정보를 조회해서 수정페이지를 내보내는 서블릿을 요청함
	//회원의 아이디를 전송함
	//html <a href="연결대상"> == javascript : location.href = "연결대상";
	//연결대상으로 값도 전송할 경우, 쿼리 스트링(Query String)을 이용함
	//쿼리스트링 : ?전송이름=값&전송이름=값
	//전송값에 Expression Tag 사용할 수 있음
	location.href = "/jiksan/uupview?user_id=<%= loginUser.getUserId() %>";
}

function sendDelete(){
	//탈퇴는 삭제처리함
	//요청한 회원의 아이디를 탈퇴 처리하는 서블릿으로 전송해서 회원 테이블에서 삭제 처리함
	location.href = "/jiksan/udel?user_id=<%= loginUser.getUserId() %>";
}
</script>
</table>
</section>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>