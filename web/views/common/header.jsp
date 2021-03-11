<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="user.model.vo.User"%>
<%   User loginUser = (User)session.getAttribute("loginUser"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"    href="/jiksan/resources/css/jiksan-header.css" />


<script type="text/javascript"
   src="/jiksan/resources/js/jquery-3.5.1.min.js"></script>
<%--jQuery 함수 : "전체메뉴" 버튼 --%>
<script type="text/javascript">
$(document).ready(function(){
   $(".full-slide").click(function() {
      $(".full-menu").stop().slideToggle(300);
         $('.hamburger .line').css('transition', 'all 0.2s ease-in-out');

         if($('.hamburger').hasClass('is-active')){
            $('.hamburger span:nth-child(1)').css({'transform':'translateY(0) rotate(0)'});
            $('.hamburger span:nth-child(2)').css({'opacity':'1'});
            $('.hamburger span:nth-child(3)').css({'transform':'translateY(0) rotate(0)'});            
            $('.hamburger').removeClass('is-active');
         } else {
            $('.hamburger span:nth-child(1)').css({'transform':'translateY(12px) rotate(45deg)'});
            $('.hamburger span:nth-child(2)').css({'opacity':'0'});
            $('.hamburger span:nth-child(3)').css({'transform':'translateY(-4px) rotate(-45deg)'});
            $('.hamburger').addClass('is-active');
         }
    });
});
</script>
<%--쿠키 설정해주는 함수--%>
<script type="text/javascript">
   function setCookie(name, value, expiredays) {
      var todayDate = new Date();
      todayDate.setDate(todayDate.getDate() + expiredays);
      document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
   }
   function getCookie(name) {
      var nameOfCookie = name + "=";
      var x = 0;
      while (x <= document.cookie.length) {
         var y = (x + nameOfCookie.length);
         if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
               endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
         }
         x = document.cookie.indexOf(" ", x) + 1;
         if (x == 0)
            break;
      }
      return "";
   }
</script>

<%-- 예약페이지로 넘어가게하는 함수 --%>
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
   <div id="wrap" class="mw1600" style="position: relative;">
      <div class="mw1600">
         <header class="bg-white mw">
            <div id="header-wrap" class="inner cf">
               <a href="/jiksan/index.jsp"><img
                  src="/jiksan/resources/main_images/jiksan_logo.png"
                  alt="직산 가정의학과 의원" style="width: auto; max-width: 22%"></a>

               <section>
                  <%--홈페이지 우측상단 버튼 4개 --%>
                  <% if(loginUser == null){ %><%--***** 로그인 안 했다면 ***** --%>
                  <nav>
                     <a href=/jiksan/views/user/userLogin.jsp><img
                        src="/jiksan/resources/main_images/nav-icon01.png" alt="LOGIN"><span>LOGIN</span></a>
                     <a href="/jiksan/views/user/userEnroll.jsp"><img
                        src="/jiksan/resources/main_images/nav-icon02.png" alt="JOIN"><span>JOIN</span></a>
                     <a href="/jiksan/views/about/contact-us.jsp"><img
                        src="/jiksan/resources/main_images/nav-icon03.png"
                        alt="CONTACT US"><span>CONTACT US</span></a> <a href="#n"
                        class="full-slide">
                        <div class="row">
                           <div class="three col">
                              <div class="hamburger" id="hamburger-1">
                                 <span class="line"></span> <span class="line"></span> <span
                                    class="line"></span>
                              </div>
                           </div>
                        </div> <span style="font-weight: 500; color: #74afc9;">전체메뉴</span>
                     </a>
                  </nav>
            </div>
            <div class="full-menu bg-white">
               <div class="inner">
                  <ul class="full-list inner cf">
                     <li>
                        <div>병원안내</div>
                        <ol>
                           <li><a href="/jiksan/views/about/about-clinic.jsp">병원안내</a></li>
                           <li><a href="/jiksan/views/about/about-services.jsp">진료안내</a></li>
                           <li><a href="/jiksan/views/about/about-team.jsp">의료진 소개</a></li>
                           <li><a href="/jiksan/views/about/contact-us.jsp">오시는길</a></li>
                        </ol>
                     </li>
                     <li>
                        <div>당뇨클리닉</div>
                        <ol>
                           <li><a href="/jiksan/disease?disease_no=108">당뇨병이란?</a></li>
                           <li><a href="/jiksan/views/diabetes/diabetes-diet.jsp">당뇨병과 식생활</a></li>
                           <li><a href="/jiksan/views/diabetes/diabetes-exercise.jsp">당뇨병과 운동</a></li>
                           <li><a href="/jiksan/disease?disease_no=108#complications">당뇨병 합병증</a></li>
                        </ol>
                     </li>
                     <li>
                        <div>건강정보</div>
                        <ol>
                           <li><a href="/jiksan/dlist">질환백과</a></li>
                           <%-- <li><a href="#">최근 환자 분석</a></li>  시간 없으면 생략가능 --%>
                        </ol>
                     </li>
                     <li>
                        <div>진료 예약</div>
                        <ol>
                           <li><a href="/jiksan/views/reservation/about-appt.jsp">예약안내</a></li>
                           <li><a href="javascript:redirect()">진료 예약하기</a></li>
                           <%-- <a href="#">예방접종 안내</a> 시간 없으면 생략가능 --%>
                        </ol>
                     </li>
                     <li>
                        <div>커뮤니티</div>
                        <ol>
                           <li><a href="/jiksan/nlist">공지사항</a></li>
                           <li><a href="/jiksan/faqlist">자주묻는 질문</a></li>
                           <li><a href="/jiksan/qalist">Q&A 게시판</a></li>
                           <%--<li><a href="#">방문 리뷰</a></li> 시간 없으면 생략가능 --%>
                           <%-- 네이버 방문기록, 블로그 등 자동 불러오기 또는 몇개만 가져오기 --%>
                        </ol>
                     </li>
                  </ul>
               </div>
               <% } else if (loginUser != null && loginUser.getUserLv() > '1'){ %><%--***** 관리자가 로그인했다면 *****--%>
               <nav >
                  <a href="/jiksan/logout"><img
                     src="/jiksan/resources/main_images/nav-icon01.png" alt="LOGOUT"><span>LOGOUT</span></a>
                  <a href="/jiksan/views/user/userMyPage.jsp">
                  <%-- 안되면 이걸로 ㄱㄱ /jiksan/views/user/userMyPage.jsp--%>
                     <img src="/jiksan/resources/main_images/nav-icon02.png" alt="MY PAGE"><span>MY PAGE</span></a>
                  <a href="javascript:redirectAdmin()"><img
                     src="/jiksan/resources/main_images/nav-icon04.png"
                     alt="RESERVATION"><span>RESERVATION</span></a> <a href="#n"
                     class="full-slide">
                     <div class="row">
                        <div class="three col">
                           <div class="hamburger" id="hamburger-1">
                              <span class="line"></span> <span class="line"></span> <span
                                 class="line"></span>
                           </div>
                        </div>
                     </div> <span style="font-weight: 500; color: #74afc9;">전체메뉴</span>
                  </a>
               </nav>
            </div>
            <div class="full-menu bg-white">
               <div class="inner">
                  <ul class="full-list inner cf">
                     <li>
                        <div>병원안내</div>
                        <ol>
                           <li><a href="/jiksan/views/about/about-clinic.jsp">병원안내</a></li>
                           <li><a href="/jiksan/views/about/about-services.jsp">진료안내</a></li>
                           <li><a href="/jiksan/views/about/about-team.jsp">의료진 소개</a></li>
                           <li><a href="/jiksan/views/about/contact-us.jsp">오시는길</a></li>
                        </ol>
                     </li>
                     <li>
                        <div>당뇨클리닉</div>
                        <ol>
                           <li><a href="/jiksan/disease?disease_no=108">당뇨병이란?</a></li>
                           <li><a href="/jiksan/views/diabetes/diabetes-diet.jsp">당뇨병과 식생활</a></li>
                           <li><a href="/jiksan/views/diabetes/diabetes-exercise.jsp">당뇨병과 운동</a></li>
                           <li><a href="/jiksan/disease?disease_no=108#complications">당뇨병 합병증</a></li>
                        </ol>
                     </li>
                     <li>
                        <div>건강정보 관리</div>
                        <ol>
                           <li><a href="/jiksan/dlist">질환백과</a></li>
                           <%-- <li><a href="#">최근 환자 분석</a></li>  시간 없으면 생략가능 --%>
                        </ol>
                     </li>
                     <li>
                        <div>진료 예약 관리</div>
                        <ol>
                           <li><a href="/jiksan/views/reservation/about-appt.jsp">예약안내</a></li>
                           <li><a href="/jiksan/reservation">진료 예약하기</a></li>
                           <%-- <a href="#">예방접종 안내</a> 시간 없으면 생략가능 --%>
                        </ol>
                     </li>
                     <li>
                        <div>커뮤니티 관리</div>
                        <ol>
                           <li><a href="/jiksan/nlist">공지사항</a></li>
                           <li><a href="/jiksan/faqlist">자주묻는 질문</a></li>
                           <li><a href="/jiksan/qalist">Q&A 게시판</a></li>
                           <%--<li><a href="#">방문 리뷰</a></li> 시간 없으면 생략가능 --%>
                           <%-- 네이버 방문기록, 블로그 등 자동 불러오기 또는 몇개만 가져오기 --%>
                        </ol>
                     </li>
                     <li>
                        <div>회원 관리</div>
                        <ol>
                           <li><a href="#">회원 리스트</a></li>
                           <li><a href="#">#</a></li>
                           <li><a href="#">#</a></li>
                        </ol>
                     </li>
                  </ul>
               </div>
            </div>
            <% } else { %><%--***** 환자가 로그인했다면 *****--%>
            <nav>
               <a href="/jiksan/logout"><img
                  src="/jiksan/resources/main_images/nav-icon01.png" alt="LOGOUT"><span>LOGOUT</span></a>
                  <a href="/jiksan/views/user/userMyPage.jsp">
                  <%-- 안되면 이걸로 ㄱㄱ /jiksan/views/user/userMyPage.jsp--%>
                     <img src="/jiksan/resources/main_images/nav-icon02.png" alt="MY PAGE"><span>MY PAGE</span></a>
                  <a href="javascript:redirect()"><img
                  src="/jiksan/resources/main_images/nav-icon04.png"
                  alt="RESERVATION"><span>RESERVATION</span></a> <a href="#n"
                  class="full-slide">
                  <div class="row">
                     <div class="three col">
                        <div class="hamburger" id="hamburger-1">
                           <span class="line"></span> <span class="line"></span> <span
                              class="line"></span>
                        </div>
                     </div>
                  </div> <span style="font-weight: 500; color: #74afc9;">전체메뉴</span>
               </a>
            </nav>
      </div>
      <div class="full-menu bg-white">
         <div class="inner">
            <ul class="full-list inner cf">
               <li>
                  <div>병원안내</div>
                  <ol>
                           <li><a href="/jiksan/views/about/about-clinic.jsp">병원안내</a></li>
                           <li><a href="/jiksan/views/about/about-services.jsp">진료안내</a></li>
                           <li><a href="/jiksan/views/about/about-team.jsp">의료진 소개</a></li>
                           <li><a href="/jiksan/views/about/contact-us.jsp">오시는길</a></li>
                  </ol>
               </li>
               <li>
                  <div>당뇨클리닉</div>
                  <ol>
                           <li><a href="/jiksan/disease?disease_no=108">당뇨병이란?</a></li>
                           <li><a href="/jiksan/views/diabetes/diabetes-diet.jsp">당뇨병과 식생활</a></li>
                           <li><a href="/jiksan/views/diabetes/diabetes-exercise.jsp">당뇨병과 운동</a></li>
                           <li><a href="/jiksan/disease?disease_no=108#complications">당뇨병 합병증</a></li>
                  </ol>
               </li>
               <li>
                  <div>건강정보</div>
                  <ol>
                     <li><a href="/jiksan/dlist">질환백과</a></li>
                     <%-- <li><a href="#">최근 환자 분석</a></li>  시간 없으면 생략가능 --%>
                  </ol>
               </li>
               <li>
                  <div>진료 예약</div>
                  <ol>
                     <li><a href="/jiksan/views/reservation/about-appt.jsp">예약안내</a></li>
                     <li><a href="javascript:redirectAdmin()">진료 예약하기</a></li>
                     <%-- <a href="#">예방접종 안내</a> 시간 없으면 생략가능 --%>
                  </ol>
               </li>
               <li>
                  <div>커뮤니티</div>
                  <ol>
                     <li><a href="/jiksan/nlist">공지사항</a></li>
                     <li><a href="/jiksan/faqlist">자주묻는 질문</a></li>
                     <li><a href="/jiksan/qalist">Q&A 게시판</a></li>
                     <%--<li><a href="#">방문 리뷰</a></li> 시간 없으면 생략가능 --%>
                     <%-- 네이버 방문기록, 블로그 등 자동 불러오기 또는 몇개만 가져오기 --%>
                  </ol>
               </li>
            </ul>
         </div>
      </div>
      <% } %>
      </section>
      </header>
   </div>
   </div>

</body>
</html>