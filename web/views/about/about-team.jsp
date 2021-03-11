<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료진 소개</title>
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
	<!-- 인사말 -->
	<div class="about">
		<!-- 안녕하세요 -->
		<div class="greeting"></div>
		<h2 id="content_title">의료진 소개</h2>
		<h3>
			안녕하세요. <br> 직산가정의학과입니다.
		</h3>
		<br>
		<p class="thanks">저희 홈페이지를 찾아주셔서 감사합니다.</p>
		<p>
			<span style="font-family: Verdana;">코로나 함께의 힘으로 이겨낼수있습니다</span>
		</p>
		<p>
			<span style="font-family: Verdana;">궁금하신 사항이 있을 시 언제든지 방문하시면 친절하게 상담해 드리겠습니다.</span>
		</p>
		<br>
		<p>
			<span style="font-family: Verdana;"></span>
		</p>
		<div class="con01-inner">
						<%-- 의료진 --%>
							<div class="con01-hover">
								<img class="linehight-smoll" src="/jiksan/resources/photos/jiksan-team-2.jpg"	 alt="1"  style="width:660px;">
								<img class="linehight-smoll" src="/jiksan/resources/photos/jiksan-team-3.jpg"  alt="1" style="width:660px">
								<img class="linehight-smoll" src="/jiksan/resources/photos/jiksan-team-4.jpg"	 alt="1" style="width:660px">
															
							  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
							    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
							    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
							    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
							    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
							    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
							  </div>
							</div>
							<script type="text/javascript">
							var slideIndex = 1;
								showDivs(slideIndex);
	
								function plusDivs(n) {
								  showDivs(slideIndex += n);
								}
	
								function currentDiv(n) {
								  showDivs(slideIndex = n);
								}
	
								function showDivs(n) {
								  var i;
								  var x = document.getElementsByClassName("linehight-smoll");
								  var dots = document.getElementsByClassName("demo");
								  if (n > x.length) {slideIndex = 1}
								  if (n < 1) {slideIndex = x.length}
								  for (i = 0; i < x.length; i++) {
								    x[i].style.display = "none";  
								  }
								  for (i = 0; i < dots.length; i++) {
								    dots[i].className = dots[i].className.replace(" w3-white", "");
								  }
								  x[slideIndex-1].style.display = "block";  
								  dots[slideIndex-1].className += " w3-white";
								}
								
								carousel();

								function carousel() {
								  var i;
								  var x = document.getElementsByClassName("linehight-smoll");
								  for (i = 0; i < x.length; i++) {
								    x[i].style.display = "none"; 
								  }
								  slideIndex++;
								  if (slideIndex > x.length) {slideIndex = 1} 
								  x[slideIndex-1].style.display = "block"; 
								  setTimeout(carousel, 3000); 
								}
								
								
							</script>
						</div>

		<!-- <div style="float:left; ">
		<p>
			&nbsp;<img
				style="margin: 10px 20px 0 0; border: 0px solid rgb(0, 0, 0); border-image: none; width: 300px; height: 200px; vertical-align: baseline;"
				alt="1" src="/jiksan/resources/photos/jiksan-team-3.jpg">
		</p>

		<p>
			&nbsp;<img
				style="margin: 10px 20px 0 0; border: 0px solid rgb(0, 0, 0); border-image: none; width: 300px; height: 200px; vertical-align: baseline;"
				alt="1" src="/jiksan/resources/photos/jiksan-team-4.jpg">
		</p>
		<p>
			&nbsp;<img
				style="margin: 10px 20px 0 0; border: 0px solid rgb(0, 0, 0); border-image: none; width: 300px; height: 200px; vertical-align: baseline;"
				alt="1" src="/jiksan/resources/photos/jiksan-team-2.jpg">
		</p>
		<br>
		</div>
				<p>
			<span style="font-family: Verdana;">
			
			</span>
		</p>
	</div> -->
	<!-- /안녕하세요 -->

	<!-- 의료진소개 -->
	<div class="doctor" style="margin-top: 20px;">
		<div class="wrap">
			<ul>
				<li class="pic"><img src="" alt=""></li>
				<li class="name"><span> </span></li>
				<li class="career">
					<dl>
						<dt></dt>
						<dd>
							<span style="font-family: Verdana;"></span>
							<p>&nbsp;</p>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	<!-- 의료진소개 -->
	<div class="doctor" style="margin-top: 20px;">
		<div class="wrap">
			<ul>
				<li class="pic"><img src="" alt=""></li>
				<li class="name"><span> </span></li>
				<li class="career">
					<dl>
						<dt></dt>
						<dd>
							<span style="font-family: Verdana;"></span>
							<p>&nbsp;</p>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	<!-- 의료진소개 -->
	<div class="doctor" style="margin-top: 20px;">
		<div class="wrap">
			<ul>
				<li class="pic"><img src="" alt=></li>
				<li class="name"><span></span></li>
				<li class="career">
					<dl>
						<dt></dt>
						<dd>
							<p>
								<span style="font-family: Verdana;"></span>
							</p>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	</div>
	<!-- 인사말 -->
<br><br>
 <%@ include file="../common/footer.jsp" %>
</body>
</html>