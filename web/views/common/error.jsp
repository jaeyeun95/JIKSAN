<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%-- isErrorPage 속성의 값을 true 로 지정하면, 이 페이지는 에러 처리를 담당하는 페이지다. 라는 뜻이 됨 
	jsp 파일에서 에러가 발생하면, 자동으로 이 페이지가 실행되도록 연결하면 됨. --%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	margin-left: 10%;
	margin-top: 10%;
	margin-right: 10%;
	align: center;
	color: #9AA0A6;
}
h5 {
	color: #9AA0A6;
}
h1 {
	color:  #80868B;
}
hr {
	border: 4px dotted #E6E8E8;
}
h3{ color: #blue;}
a { text-decoration: none; }
a:visited {text-decoration: none; }
a:hover {text-decoration: black; position: relative; }
a:hover:after{
	content: url(/jiksan/resources/main_images/jiksan_logo.png); 
	zoom: 20%;
	position: center;
	display: block;
	
}

</style>

<meta charset="UTF-8">
<title>직산 가정의학과 의원</title>
</head>
<body>
<section>
<article id="alertImg">
<img src="/jiksan/resources/main_images/error_alert_01.jpg" alt="alert image" width="10%">
</article>
<h5>이용에 불편을 드려 죄송합니다.</h5>
<h1>페이지 준비중 입니다.</h1>
<hr>
<h3>직산 가정의학과 의원 Jiksan Family Medicine Clinic</h3>
<address>충남 천안시 서북구 직산읍 직산로 31 직산농협 2층 &nbsp;&nbsp;&nbsp;&nbsp; (041) 583-8500
</address>
<br><br><br>
<div id="alertMsg">
진료 안내 및 예약관련은 전화로 문의해 주세요. <br>
요청하신 페이지는 아직 준비중에 있거나 다음과 같은 오류가 발생하였습니다.
</div>
<br>
<br>

<% if(exception != null){ //다른 jsp 파일에서 예외가 발생했다면 %>
<h3>jsp 페이지 오류 : <%= exception.getMessage() %>, <%= exception.getClass().getName() %></h3>
<% }else{ %>
<h3>servlet 오류 : <%= request.getAttribute("message") %></h3>
<% } %>
<br>
<br>
<hr>
<h3><a href="/jiksan/index.jsp"><img src="/jiksan/resources/main_images/error-home-icon.png" alt="redirect home" width = "25px">&nbsp;&nbsp; 홈으로</a></h3>
<h3><a href="javascript:history.go(-1);"><img src="/jiksan/resources/main_images/error-back-icon.png" alt="redirect home" width = "25px">&nbsp;&nbsp; 이전 페이지로 이동</a></h3>
</section>
</body>
</html>