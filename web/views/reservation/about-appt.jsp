<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약안내</title>
<link rel="stylesheet" type="text/css"
	href="/jiksan/resources/css/jiksan-sidebar.css" />
<link rel="stylesheet" type="text/css"
	href="/jiksan/resources/css/about-appt_base.min.css">
<link rel="stylesheet" type="text/css"
	href="/asset/css/about-appt_common.min.css?ver=201222">
<link rel="stylesheet" type="text/css"
	href="/jiksan/resources/css/about-appt_content.min.css"> 
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/menubar.jsp"%>
	<div class="lnb">
		<h2 class="lnb_title">진료 예약</h2>
		<ul class="lnb_menu">
			<li class="on"><a href="/jiksan/">진료 예약</a></li>
			<li><a href="/jiksan/views/reservation/about-appt.jsp">예약안내</a></li>
			<li><a href="/jiksan/reservation">진료 예약하기</a></li>
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
	<br>
	
	<div id="bodytext">
	<main id="content" class="rsvContent">
		<!-- contHeadingWrap -->
		<div class="contHeadingWrap">
			<h2>예약안내</h2>
				</div>

<!-- <글자 정렬> -->
<!-- <div style="width:100%; height:150px; position:relative;"> -->
<div style="width:99%; position:absoulute; bottom:20%;">
		<img src="/jiksan/resources/res_images/res-01.png"
			alt="요양급여의뢰서(진료의뢰서) 발급 - 1단계 요양급여기관(동네 병의원) &gt; 진료예약 &gt; 진료 &gt; 귀가 또는 협력병원입원" width="60%">
			<br><br>
		<!-- contTitleWrap -->
<!-- 		<div class="contTitleWrap">
			<h3>예약안내</h3>
		</div> -->
		<!-- //contTitleWrap -->
		<div class="rsvGuideWrap">
			<div class="contTextWrap">
					진료예약은 방문, 전화, 인터넷을 통해 하실 수 있습니다. 보다 빠른 예약을 위해 환자의 등록번호 또는 생년월일과 주소, 전화번호를 알려주십시오. 
					<br>진료의 대상은 만 15세를 기준으로 어른과 어린이가 구분됩니다.<br><br>
			</div>
			<span class="colorPoint"><a>※ 건강검진, 고혈압, 당뇨병, 갑상선, 비타민주사, 내시경, 초음파 예약가능.</a></span>
			<!-- rsvGuide -->
			
			<ul class="rsvGuide">
				<li class="skin01 a"><em>방문예약</em>
					<p>요양급여의뢰서(진료의뢰서) 및 신분증을 지참하고 방문하시어, 진료신청서 작성 후 원무접수∙수납창구에
						제출하시면 됩니다.&nbsp; &nbsp;</p>
					<ul class="listType01">
						<li class="b">평&nbsp;&nbsp;일:&nbsp;08:30 ~ 18:00</li>
						<li class="b">토요일:&nbsp;09:00 ~ 13:00</li>
						<li class="b">점심시간:&nbsp;13:00 ~ 14:00</li>
						<br>
					</ul>
				<li class="skin02 a"><em>전화예약</em>
					<p>
						직산가정의학과 <span class="colorPoint">예약센터(<a
							href="tel:041-573-5595">041-573-5595</a>)
						</span>에서 예약을 안내해드립니다.
					</p>
					<ul class="listType01">
						<li class="b">평&nbsp;&nbsp;일:&nbsp; 08:30 ~ 18:00</li>
						<li class="b">토요일:&nbsp;09:00 ~ 13:00</li>
						<li class="b">점심시간:&nbsp;13:00 ~ 14:00</li>
						<br>
					</ul>
				<li class="skin03 a"><em>인터넷예약</em>
					<p>
						병원 홈페이지에 <span class="colorPoint"><a href="/jiksan/views/user/userEnroll.jsp">회원가입</a> 후 이용</span>하실 수 있습니다. <br>
						인터넷예약은 <span class="colorPoint">24시간 이용</span>하실 수 있습니다.&nbsp;
					</p>
					<div class="btnWrap alignL">
						<span class="btnIconLink a"><a
							href="/jiksan/reservation" role="button"
							class="btnType03 btnSmall">인터넷 예약하기</a></span> <span
							class="btnIconLink a"></span>
					</div></li>
				<!-- <li class="skin04 a"><em>앱예약</em>
					<p>
						서울대학교병원&nbsp; 핸드폰 어플리케이션을 <span class="colorPoint">구글플레이 또는
							앱스토어에서 다운로드 </span>받으신 후 이용하실 수 있습니다. 어플리케이션을 통한 예약은<span
							class="colorPoint"> 24시간 이용</span>하실 수 있습니다. <br> <img
							src="http://www.snuh.org/upload/editor/images/000018/20190607105542236_TIV3L51N.jpg"
							title="" alt=""
							style="vertical-align: baseline; border: 0px solid rgb(0, 0, 0);">
					</p></li> -->
			</ul> 
			<br><br>
			<!-- //rsvGuide end -->
		</div>
		<div class="contTitleWrap">
			<h3>예약취소</h3>
		</div>
		<ul class="listType01 colorType01">
			<li class="b">인터넷예약자는 물론 전화예약하신 분들도 홈페이지에서 간편하게 예약을 취소하실 수 있습니다.<br>
				※인터넷을 통한 예약취소는 진료일 전 자정(12시)까지만 가능
			</li>
			<li class="b">단,&nbsp;<span class="colorPoint"
				style="text-decoration: underline;">진료와 함께 검사가 예약되어 있는 경우</span>나&nbsp;<span
				class="colorPoint" style="text-decoration: underline;">진료비를
					사전에 수납하신 경우</span>는 인터넷 예약취소가 불가하오니<br> <span class="colorPoint">예약센터(<a
					href="tel:041-573-5595">041-573-5595</a>)
			</span>로 전화주시기 바랍니다.
			</li>
			<li class="b">소중한 진료시간이 다른 분께 양보될 수 있도록 가능한 빨리 취소의사를 밝혀주십시오.</li>
			<li class="b">예약변경/취소 없이 진료를 받지 않을 경우 홈페이지 진료예약서비스가 제한됩니다.</li>
		</ul>

	</div>
	</main>
	</div>
	<!-- //content -->
	<!-- //content -->
	<hr>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>