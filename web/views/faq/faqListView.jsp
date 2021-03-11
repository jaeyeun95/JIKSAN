<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./views/common/error.jsp"%>
<%@ page import="java.util.ArrayList, faq.model.vo.Faq" %>
<!DOCTYPE html>
<%
   ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
%>
<!-- .accordion -->
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 자주묻는 질문</title>
<script type = "text/javascript" src="/jiksan/resources/js/jquery-3.5.1.min.js"></script>
<script src="/jiksan/resources/js/faq-jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("#accordion").accordion({
		collapsible: true
	});
});
</script>
<style type="text/css">
	#accordion {
	display: flex;
	align: center;
	}
	
   .accordionMenu{
		font : 12px/20px 돋움;
		color:#424242;
		width:500px;
		align: center;
		margin: 0;
		padding:10px;
		margin:auto;
		
	}
	.accordionMenu h2{
		margin:5px 0;
		padding:0;
	}

	.accordionMenu h2 a{
		font-size:15px;
		display:block;
		font-weight:normal;
		color:#424242;
		text-shadow:2px 2px 2px #aeaeae;
		text-decoration:none;
		margin:0;
		padding:10px;
		background:#8f8f8f;
	}

	.accordionMenu h2 a{
		font-size:15px;
		display:block;
		font-weight:normal;
		color:#424242;
		text-shadow:2px 2px 2px #aeaeae;
		text-decoration:none;
		margin:0;
		padding:10px;
		background:-moz-linear-gradient(top,#cecece,#8f8f8f);
		background:-webkit-gradient(linear,left top, left bottom, from(#cecece), to(#8f8f8f));
		filter: progid:DXImageTransform.Microsoft.gradient
		(startColorstr=#ffcecece, endColorstr=#ff8f8f8f);
		-ms-filter: "progid:DXImageTransform.Microsoft.gradient
		(startColorstr=#ffcecece, endColorstr=#f8f8f8f)";
		-webkit-border-radius:5px;
		-moz-border-radius:5px;
		border-radius:5px;
	}

 	.accordionMenu :target h2 a,
	.accordionMenu h2 a:focus,
	.accordionMenu h2 a:hover,
	.accordionMenu h2 :active {
		background:#2288dd;
		background:-moz-linear-gradient(top,#6bb2ff,#2288dd);
		background:-webkit-gradient(linear,left top, left bottom, from(#6bb2ff), to(#2288dd));
		-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#ff6bb2ff, endColorstr=#ff2288dd)";
		color:#fff;
	} 
	

	.accordionMenu p {
		padding:0 10px;
		margin:0;
		height:0;
		overflow:hidden;
		-moz-transition:height 0.5s ease-in;
		-webkit-transition:height 0.5s ease-in;
		-o-transition:hegith 0.5s ease-in;
		tansition:height 0.5s ease-in;
	}

	.accordionMenu :target p{
		overflow: auto;
		height:100px;
	} 
</style>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menubar.jsp" %>
<div class="lnb">    
   <h2 class="lnb_title">커뮤니티</h2>      
   <ul class="lnb_menu">
      <li><a href="nlist">공지사항</a></li>
      <li><a href="faqlist">자주묻는 질문</a></li>
      <li><a href="qalist">Q&A 게시판</a>
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

<h1>자주묻는 질문</h1>
<h2><i >Frequently Asked Questions (FAQ)</i></h2>

<br>
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
<b>직산 가정의학과 의원</b>의 진료 및 기타 의료관련 서비스에 관하여 문의하실게 있으시면 먼저 다음 <b>자주묻는 질문(FAQ)</b>을 먼저 참고하여 주시길 바랍니다. 
<div id="accordion">
<div class="accordionMenu">
 		<% for(int i = 0 ; i < list.size(); i++){
 			Faq f = list.get(i);
 			%>
 		
		<div id="d<%= i %>" class="menuSection">
			<h2><a href="#d<%= i %>"><%= f.getFaqTitle() %></a></h2>
			<p>
			<%= f.getFaqText() %>
			</p>
		</div>
		<% } //for each %>
</div>
</div>
<br><br>
<p style="text-align: center; ">
<b><i>건강이나 생명에 위협한 상황, 응급상황인 경우에는 가장 먼저 EMS(119)에 연락하여주시길 바랍니다.</i></b>
</p>
<br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>