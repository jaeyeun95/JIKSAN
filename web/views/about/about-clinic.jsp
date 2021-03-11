<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원안내</title>
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

<h1 id="content_title" style="align: left">병원안내</h1>
<br><br>
<!-- <table><td style="border: none; background-color: none;"> -->
<button onclick="javascript:location.href='/jiksan/views/reservation/about-appt.jsp;'">진료 예약안내</button>
&nbsp; &nbsp;  &nbsp; &nbsp; 
<button onclick="javascript:location.href='/jiksan/reservation;'">예약하기</button>
<br><br>
<!-- </td></table> -->
<ul>
		<li><b>진료 안내 및 문의 : </b>(041)-573-5595</li>
		<li><b>진료시간 : </b></li>
			<ul>
			<li> &nbsp; &nbsp;  &nbsp; &nbsp; <b>평일 &nbsp; &nbsp; </b> 08:30 ~ 18:00</li>
			<li> &nbsp; &nbsp;  &nbsp; &nbsp; <b>토요일 &nbsp; &nbsp; </b> 09:00 ~ 13:00</li>
			<li> &nbsp; &nbsp;  &nbsp; &nbsp; <b>점심시간 &nbsp; &nbsp; </b> 13:00 ~ 14:00</li>
			<li> &nbsp; &nbsp;  &nbsp; &nbsp; 화요일 야간진료는 21:00 까지이며,일요일/공휴일은 휴무입니다.</li>
			</ul>
</ul>
<br><br>
<p>
		&nbsp;<img
			style="border: 0px solid rgb(0, 0, 0); border-image: none; width: 600px; height:300px; vertical-align: baseline;"
			alt="직산 가정의학과 의원 정문입니다."src="/jiksan/resources/photos/jiksan-outside-1.jpg">
			
			
	</p>
<br><br><br><br><br><br><br><br>

 <%@ include file="../common/footer.jsp" %>
</body>
</html>