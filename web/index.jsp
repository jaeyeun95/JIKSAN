<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./views/common/error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직산 가정의학과 의원</title>
<script type = "text/javascript" src = "/jiksan/resources/js/jquery-3.5.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">

<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/main_slick.css"/>		<%-- main_slick.css = //cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css --%>
<%-- <link rel="stylesheet" href="/jiksan/resources/css/main_xeicon.min.css"/>		main_xeicon.min.css = //cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css --%>
<link rel="stylesheet" href="/jiksan/resources/css/main_bootstrap.min.css"/>		<%-- main_bootstrap.min.css = source/bootstrap/css/bootstrap.min.css --%>
<link href="/jiksan/resources/css/main_reset.css" rel="stylesheet" type="text/css" />		<%-- main_reset.css = source/css/reset.css?v=2012260915 --%>
<link href="/jiksan/resources/css/main_common.css" rel="stylesheet" type="text/css" />		<%-- main_common.css = source/css/common.css?v=2012260915 --%>
<link href="/jiksan/resources/css/main_main.css" rel="stylesheet" type="text/css" />		<%-- main_main.css = source/css/main.css?v=2012260915 --%>

<script type="text/JavaScript" src="/jiksan/resources/js/slick.js"></script>
<script type="text/JavaScript" src="/jiksan/resources/js/script.js"></script>
 <script type="text/javascript" src="/jiksan/resources/js/link.js"></script>
<script src="/jiksan/resources/js/script-functions.js"></script>
<script type="text/javascript" src="/jiksan/resources/js/EmbedFlash.js"></script>

<style type = "text/css">
.main .homepage .slideshow{position:relative}

.slideshowPics {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
.w3-content {margin-left:auto;margin-right:auto; /* max-width:980px; */}
.w3-display-container{position:relative;}
/*
.w3-display-container:hover .w3-display-hover{display:block;}
.w3-display-container:hover span.w3-display-hover{display:inline-block;}
*/
.w3-center {text-align:center!important}
.w3-container:after,.w3-container:before {content:"";display:table;clear:both;}
.w3-container {padding:0.01em 16px;}
.w3-section {margin-top:16px!important;margin-bottom:16px!important}
.w3-large {font-size:25px!important}
.w3-text-white {color:#265277!important}
.w3-display-bottommiddle{position:absolute;left:50%;bottom:0;transform:translate(-50%,0%);-ms-transform:translate(-50%,0%)}
.w3-left{float:left!important}
.w3-right{float:right!important}
.w3-hover-text-khaki:hover{color:#b4aa50!important}
/* .w3-badge{border-radius:50%;background-color:#000;color:#265277;display:inline-block;padding-left:8px;padding-right:8px;text-align:center}
.w3-border{border:1px solid rgba(38, 82, 119, 0.6)!important}
.w3-transparent {background-color:transparent!important}
.w3-hover-white:hover{color:#000!important;background-color:rgba(38, 82, 119, 0.6)!important} */

table#newnotice, #newnotice >tr, #newnotice >th {
position: relative;
width: auto;
min-width: 600px;
}

</style>

<!-- 예약페이지로 넘어가게하는 함수 -->
<script type="text/javascript">
        function redirect(){
        window.location.href = "/jiksan/drlist"
        }
        function redirectAdmin(){
        window.location.href = "/jiksan/drlist.ad"
        }
</script>
</head>
<body>
<%@ include file="./views/common/header.jsp" %>
<%-- 
<%@ include file="./views/common/sidebar.jsp" %>
<%@ include file="./views/common/menubar.jsp" %>
 --%>
	<div id="container">
		<section class="main-con01 mw">
			<div class="inner mw cf">
				<article class="con01-left">
						<div class="con01-visual">
						<%-- 배너 이미지 --%>
							<div class="main homepage slideshow">
								<img class="slideshowPics" src="/jiksan/resources/main_images/main_banner_01.jpg"	 alt="코로나-19"  style="width:660px">
								<img class="slideshowPics" src="/jiksan/resources/main_images/main_banner_02.jpg" 	 alt="가정의학과" style="width:660px">
								<img class="slideshowPics" src="/jiksan/resources/main_images/main_banner_03.png" 	 alt="ICT교육원x직산가정의학과 의원" style="width:660px">
							
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
								  var x = document.getElementsByClassName("slideshowPics");
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
								  var x = document.getElementsByClassName("slideshowPics");
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
					<div class="con01-news cf" >

						<h2><a href="/jiksan/dlist" style="color:#fff; font-weight: 500;">건강정보 검색</a></h2>

						<div class="cf">
							 <form name="search_disease" method="post" action="/jiksan/dsearch"><%--검색 함수 만들기 --%>
								<select name="category" class="form-control w25 vm search">
						      		<option value= "diseaseNm">전체 검색</option>
						      		<option value="diseaseNm" selected>질환 및 질병</option>
						      		<option value="diseaseNm">검사 및 치료</option>
								</select>

								<input type="search" name="keyword" size=40px; class="form-control w60 vm search" placeholder="검색어 입력">
								<button type="submit" onClick="" class="btn btn-default vm search">
								<image src ="/jiksan/resources/main_images/main-search-icon.png" alt="검색하기" width="30px" style="align:center">
								</button><%--검색 함수 만들기 --%>
							</form>
						</div>
					</div>

<%-- --------------------------- 공시사항을 ajax사용해서 <article> " .con01-left " 안에 넣기 ------------------------ --%>
               <ul class="con01-box cf">
                  <li>
                     <h3><a href="/jiksan/nlist" target="_blank">공지사항</a></h3>
                     <ol>
                        <li><a href="/jiksan/nlist" target="_blank" >「직산 가정의학과 의원」&nbsp;커뮤니티를&nbsp; 위한&nbsp; 최근&nbsp; 공지사항 </a></li>
                        <br>
                        <table id="newnotice">
                        <tr><th>번호</th><th>제목</th><th>날짜</th></tr>
                        </table>
                     </ol>
                  </li>
               </ul>
				<script type="text/javascript">
               $(function(){
				   $.ajax({
				      url: "/jiksan/ntop3",
				      type: "get",
				      dataType: "json",
				      success: function(data){
				         console.log("success : " + data);
				         
				         var jsonStr = JSON.stringify(data);
				         
				         var json = JSON.parse(jsonStr);
				         
				         var values = "";
				         for(var i in json.list){
				            values += "<tr><td>" + json.list[i].no
				                        +"</td><td><a href='/jiksan/ndetail.ad?notice_no="
				                        +json.list[i].no +   "'>"
				                        +decodeURIComponent(json.list[i].title)
				                        +"</a></td><td>" + json.list[i].date + "</td></tr>";
				         }
				         
				         $("#newnotice").html($("#newnotice").html() + values);
				         
				      },
				      error: function(jqXHR, textstatus, errorthrown){
				         console.log("error : " + jqXHR + ", " + textstatus + ", " +errorthrown);
				      }
				   });
               });
               </script>
				</article>
				
				<article class="con01-right">
					<ul class="cf">
						<li>
							<div class="con01-hover">
								<div>
									<ol class="linehight-smoll">
									<li><a href="/jiksan/views/about/about-clinic.jsp">병원안내</a></li>
									<li><a href="/jiksan/views/about/about-services.jsp">진료안내</a></li>
									<li><a href="/jiksan/views/about/about-team.jsp">의료진 소개</a></li>
									<li><a href="/jiksan/views/about/contact-us.jsp">오시는길</a></li>                     
									</ol>
								</div>
							</div>

							<div class="con01-inner">
								<h3>병원안내</h3>
								<span>Welcome to our clinic!</span>
								<i class="xi-plus-thin"></i>	
							</div>
						</li>

						<li>
							<div class="con01-hover">
								<div>
									<ol>                                  
									<li><a href="/jiksan/disease?disease_no=108">당뇨병이란?</a></li>
									<li><a href="/jiksan/views/diabetes/diabetes-diet.jsp">당뇨병과 식생활</a></li>
									<li><a href="/jiksan/views/diabetes/diabetes-exercise.jsp">당뇨병과 운동</a></li>
									<li><a href="/jiksan/disease?disease_no=108#complications">당뇨병 합병증</a></li>						
									</ol>
								</div>
							</div>
							<div class="con01-inner">
								<h3>당뇨클리닉</h3>
								<span>Diabetes Clinic</span>
								<i class="xi-plus-thin"></i>	
							</div>
						</li>
						<li>
							<div class="con01-hover">
								<div>
									<ol>
									<li><a href="/jiksan/dlist">질환백과</a></li>
									<%-- <li><a href="#">최근 환자 분석</a></li>  시간 없으면 생략가능 --%>
									</ol>
								</div>
							</div>
							<div class="con01-inner">
								<h3>건강정보</h3>
								<span>Health Information</span>
								<i class="xi-plus-thin"></i>	
							</div>
						</li>
						<li>
							<div class="con01-hover">
								<div>
									<ol>
									<li><a href="/jiksan/views/reservation/about-appt.jsp">예약안내</a></li>
									<li><a href="javascript:redirect()">진료 예약하기</a></li>
									<%-- <a href="#">예방접종 안내</a> 시간 없으면 생략가능 --%>
									</ol>
								</div>
							</div>
							<div class="con01-inner">
								<h3>진료 예약</h3>
								<span>Medical Appointment</span>
								<i class="xi-plus-thin"></i>	
							</div>
						</li>
						<li>
							<div class="con01-hover">
								<div>
									<ol>
									<li><a href="/jiksan/nlist">공지사항</a></li>
									<li><a href="/jiksan/faqlist">자주묻는 질문</a></li>
									<li><a href="/jiksan/qalist">Q&A 게시판</a></li>
									<%--<li><a href="#">방문 리뷰</a></li> 시간 없으면 생략가능 --%>
									<%-- 네이버 방문기록, 블로그 등 자동 불러오기 또는 몇개만 가져오기 --%>
									</ol>
								</div>
							</div>
							<div class="con01-inner">
								<h3>커뮤니티</h3>
								<span>Community</span>
								<i class="xi-plus-thin"></i>	
							</div>
						</li>
						<li>
							<div class="con01-hover">
								<div>
									<ol>
                                        <li><a href="/jiksan/views/user/userEnroll.jsp">첫방문 고객 : 회원가입</a></li>
                                        <li><a href="/jiksan/views/user/userLogin.jsp">기존 회원 : 로그인</a> </li>
                                    </ol>
								</div>
							</div>
							<div class="con01-inner">
								<h3>로그인</h3>
								<span>◆ 더 많은 서비스 이용하기 ◆ </span>
								<i class="xi-plus-thin"></i>	
							</div>
						</li>
					</ul>
				</article>
			</div>
		</section>
	</div>
 </div>
 <%@ include file="./views/common/footer.jsp" %>

</body>
</html>