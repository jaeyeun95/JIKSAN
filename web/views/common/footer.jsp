<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
footer {
	background:#3e4247;
	text-align : center;
	width : 100%;
	height : 10%;
	color: #d1d1d1;
	font-size : 0.8em;
	padding-top : 2%;	
	padding-bottom : 2%;	
	line-height:1;
}
footer div h3 {
	color: #fff;
	font-size : 1.2em;
	font-weight : none;
}

.footer_btn_list li {
 float: auto; overflow: hidden;
 padding-right: 10px;
 display:inline;
 line-height:2;
}

#copyright, .footer_btn_list, address{
	color: #9AA0A6 /* #80868B */
} 
hr { clear : both; }
</style>
<script type="text/javascript">
	//개인정보처리방침
	function OpenMemberPrivate() { // "개인정보처리방침" 만들기? 가져오기
		window.open(
						"/jiksan/resources/js/개인정보처리방침.asp",
						"MemberPrivate",
						"toolbar=0, left=100, top=50, location=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0, copyhistory=0, width=600 ,height=600");
	}
</script>
</head>
<body>
<footer>
<div>
				<h3><a href="/jiksan/index.jsp" style="font-weight:500;">직산 가정의학과 의원 Jiksan Family Medicine Clinic</a></h3><br>
				<address>충남 천안시 서북구 직산읍 직산로 31 직산농협 2층 &nbsp;&nbsp;&nbsp;&nbsp; (041) 583-8500
				</address>
				<br> <br>
				<p>
					평일 08:30 ~ 18:00 &nbsp;&nbsp;&nbsp;&nbsp; 토요일 09:00 ~ 13:00
					&nbsp;&nbsp;&nbsp;&nbsp; 점심시간 13:00 ~ 14:00
					&nbsp;&nbsp;&nbsp;&nbsp; 화요일 야간진료 21:00 까지 &nbsp;&nbsp;&nbsp;&nbsp;
					<i>일요일/공휴일은 휴무입니다.</i>
				</p>
				<br>
				<br>
				<label id="copyright">Copyright ⓒ 2020 by Jiksan Family Medicine Clinic. All rights reserved.</label>
				<br>
			</div>
				<ul class="footer_btn_list">
					<li><a href="#" onclick="OpenMemberPrivate();" style="cursor: pointer;">개인정보처리방침</a></li>
					<li> | </li>
					<li><a href="#">이용약관</a></li>
					<li> | </li>
					<li><a href="/jiksan/views/about/contact-us.jsp">찾아오시는길</a></li>		
				</ul>
</footer>
</body>
</html>