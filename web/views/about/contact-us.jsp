<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./views/common/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는길</title>
<link rel="stylesheet" type="text/css"
	href="/jiksan/resources/css/jiksan-sidebar.css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/menubar.jsp"%>
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
				<dt>
					<b>직산 가정의학과 의원</b>
				</dt>
			</dl>
			<p class="num">041-573-5595</p>
		</div>
		<div class="lnb_box02">
			<p class="num02">
				<span>평일</span> 08:30 ~ 18:00
			</p>
			<p class="num02">
				<span>토요일</span> 09:00 ~ 13:00
			</p>
			<p class="num02">
				<span>점심시간</span> 13:00 ~ 14:00
			</p>
			<p class="time_comment">
				화요일 야간진료는 21:00 까지이며, <br>일요일/공휴일은 휴무입니다.
			</p>
		</div>
		<hr id="floatClear">
	</div>
	<br>

	<!--
   * Daum 지도 - 약도서비스
   * 한 페이지 내에 약도를 2개 이상 넣을 경우에는
   * 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
	<!-- 1. 약도 노드 -->
	<h1 id="content_title">오시는길</h1>

	<div id="daumRoughmapContainer1609734364814"
		class="root_daum_roughmap root_daum_roughmap_landing"></div>
	<div class="section section_address">
	<br>
	<ul>
	<li>
	<span class="tit">주소</span>
	충청남도 천안시 서북구 직산읍 직산로 31 2층
	</li>
	<li>
	<span class="tit">전화</span>
	041-583-8500
	</li>
	<li>
	<span class="tit">진료시간</span>
	AM 08:30 - PM 18:00
	</li>
	<br>
	</ul>
	</div>
		<!--  <br> <strong class="tit">주소</strong> <span class="txt">충청남도
			천안시 서북구 직산읍 직산로 31 2층</span>
	</div>
	<div class="phone">
		<strong class="tit">전화</strong> <span class="txt">041-583-8500</span>
	</div>
	<strong class="tit">버스</strong>
	<span class="txt"> <span class="icon_bus1"></span> <a
		href="http://kko.to/VFpWo3ND0">101,103번(천안시청-성환터미널)105번,112번(고속터미널-군서2리)
			직산 한도아파트</a>에서 하차<br>
	</span> -->
	
	<p>
		&nbsp;<img
			style="border: 0px solid rgb(0, 0, 0); border-image: none; width: 640px; height: 360px; vertical-align: baseline;"
			alt="직산 가정의학과 의원 정문입니다."
			src="/jiksan/resources/photos/jiksan-outside-1.jpg">
	</p>
	<!-- 2. 설치 스크립트 -->
	<script charset="UTF-8" class="daum_roughmap_loader_script"
		src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1609734364814",
			"key" : "23qmr",
			"mapWidth" : "640",
			"mapHeight" : "360"
		}).render();
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>