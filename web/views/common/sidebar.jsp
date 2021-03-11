<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIDEBAR MENU DO NOT USE LIVE</title>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/sidebar.css"/>

<%-- --------------------------  --%>

</head>
<body>
<%-- 

본인이 작업중인 뷰~View.jsp 페이지들에게 모두 적용하기!!

 (1) <head> 영역에 다음  스타일시트 ( .css)를 적용하기
 				<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
 (2) <body> 영역에 밑에 있는           "SIDE BAR MENU 사이드 메뉴"         코드를 복사 붙여넣기
 (3) <ul class="lnb_menu"> 안에 있는 <li> 태그 메뉴를 추가/삭제하고 수정하기  (순서는 메뉴바와 동일하게)
 (4) <a> 태그에 맞는 주소 적어주기

--%>


<%-- -------------------------------------------------- SIDE BAR MENU 사이드 메뉴  [구문 START] --------------------------------------------------   --%>
<div class="lnb">    
	<h2 class="lnb_title">병원안내</h2>		
	<ul class="lnb_menu">
		<li class="on"><a href="#">병원안내</a></li>
		<li><a href="#">진료안내</a></li>
		<li><a href="#">의료진소개</a></li>
		<li><a href="#">오시는길</a>
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
</body>
</html>