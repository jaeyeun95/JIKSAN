<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* html { font-size: calc(1em + 1vw) } */
body, div, dl, dt, dd, h1, h2, h3, h4, h5, h6, pre, legend, 
p, form, fieldset, input, textarea, select, blockquote, th, td { font-family: 'Nanum Gothic', sans-serif !important; line-height: 1.5; }

.nav { display: flex; align: center; width: 100%; height:50px; }
.nav .gnb {  margin : auto; }
.nav .gnb li {display: inline-block; font-size: 17px; font-weight: 600; }
.nav .gnb li a { display: block; color: #272727; text-align: center; padding: 0 50px; line-height: 50px; height: 50px; text-decoration: none; }

/* .nav .gnb .dropbtn {width: 40px;} */
.nav .gnb .dropbtn:hover {color: #fff; background: #0071bc}

.nav .gnb .dropdown-content { display: none; align: center; position: absolute; width: 100%; max-width: 180px; z-index: 9000; }
.nav .gnb .dropdown-content a { color: #265277; padding: 0px 20px; text-decoration: none; display: block; align: center; text-align: center; font-size: 14px; background: rgba(255,255,255, 0.94);}
.nav .gnb .dropdown-content a:first-child { border-top: none; }
.nav .gnb .dropdown:hover .dropdown-content { display: block; align: center;}
.nav .gnb .dropdown-content a:hover {color: #fff; background: #0071bc}}
</style>


</head>
<body>
<div class="nav">
				<ul class="gnb">
					<li class="dropdown">
						<a href="/jiksan/views/about/about-clinic.jsp" class="dropbtn">병원안내</a>
						<div  class="dropdown-content">
							<a href="/jiksan/views/about/about-services.jsp">진료안내</a>
							<a href="/jiksan/views/about/about-team.jsp">의료진 소개</a>
                            <a href="/jiksan/views/about/contact-us.jsp">오시는길</a>
						</div>
					</li>
					<li class="dropdown">
						<a href="/jiksan/disease?disease_no=108" class="dropbtn">당뇨클리닉</a>
						<div  class="dropdown-content">
							<a href="/jiksan/disease?disease_no=108" >당뇨병이란?</a>
							<a href="/jiksan/views/diabetes/diabetes-diet.jsp" >당뇨병과 식생활</a>
							<a href="/jiksan/views/diabetes/diabetes-exercise.jsp" >당뇨병과 운동</a>
							<a href="/jiksan/views/diabetes/diabetes-complications.jsp" >당뇨병 합병증</a>
						</div>
					</li>
					<li class="dropdown">
						<a href="/jiksan/dlist"  class="dropbtn">건강정보</a>
						<div class="dropdown-content">
							<a href="/jiksan/dlist">질환백과</a>
							<%-- <a href="#">예방접종 안내</a> 시간 없으면 생략가능 --%>
							<%-- <a href="#">최근환자 분석</a> 시간 없으면 생략가능 --%>
						</div>
					</li>
					<li class="dropdown">
						<a href="/jiksan/views/reservation/about-appt.jsp"  class="dropbtn">진료 예약</a>
						<div  class="dropdown-content">
							<a href="/jiksan/views/reservation/about-appt.jsp">예약안내</a>
							<a href="/jiksan/reservation">진료 예약하기</a>
						</div>
					</li>
					<li class="dropdown">
						<a href="/jiksan/nlist"  class="dropbtn">커뮤니티</a>
						<div  class="dropdown-content">
							<a href="/jiksan/nlist">공지사항</a>
							<a href="/jiksan/faqlist">자주묻는 질문</a>
							<a href="/jiksan/qalist">Q&A 게시판</a>
						</div>
					</li>
				</ul>
			</div>

</body>
</html>