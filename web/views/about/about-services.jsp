<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료안내</title>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
<style type="text/css">
	.main ul  li{
		content: ">";
	}
</style>
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

<table><td style="border: none; background-color: none;">
<h2>진료안내</h2>
      <br>
            <p>
		&nbsp;<img
			style="border: 0px solid rgb(0, 0, 0); border-image: none; width:400px; height: 250px; vertical-align: baseline;"
			alt="진료안내입니다."
			src="/jiksan/resources/photos/service.jpg.png">
	</p>
      <h2 id="content_title">진료과목</h2>
              <p>
		&nbsp;<img
			style="border: 0px solid rgb(0, 0, 0); border-image: none; width:560px; height: 250px; vertical-align: baseline;"
			alt="진료과목입니다."
			src="/jiksan/resources/photos/service2.jpg.png">
	</p>
      <h1 id="content_title">추가</h1>
      <p>
		&nbsp;<img
			style="border: 0px solid rgb(0, 0, 0); border-image: none; width: 350px; height: 400px; vertical-align: baseline;"
			alt="태반 주사 원장님과 상의하세요."
			src="/jiksan/resources/photos/jiksan-about-2.jpg">
	</p><br><br>
</td></table>
 <%@ include file="../common/footer.jsp" %>
</body>
</html>