<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8" %>
<%@ page import= "java.util.ArrayList, disease.model.vo.Disease"  errorPage="./views/common/error.jsp" %>
<%
   ArrayList<Disease> list = (ArrayList<Disease>)request.getAttribute("list");
 	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	String category = (String)request.getAttribute("category");
	String keyword = (String)request.getAttribute("keyword");
	
	Disease disease = new Disease();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강정보(질환백과): 목록보기</title>

<!-- <link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-disease.css"/>% -->
<script type = "text/javascript" src = "/jiksan/resources/js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript">/* https://stackoverflow.com/questions/8661498/on-image-hover-display-title-alt-tag-in-center */
		$('table a img').hover(
			    function(){
			        $(this).css('opacity','.5');
			        var a = $(this).attr('alt');
			        $(this).parent().append('<div class="title">' + a + '</div>');
			    },
			    function(){
			        $(this).css('opacity','1');
			        $(this).next().remove('.title');
			    }
			);

<%-- Disease에서 .getDisease()를 실행시켜주는 함수 --%>
		function getDisNo(disease_no){
			location.href='/jiksan/disease?disease_no=' + disease_no;
		}

			
</script>
<style type="text/css">
table a img{
    position:relative;
}
.gallery{
    position:absolute;
    z-index:1000;
    top:50%;
    bottom:50%;
    right:50%;
    left:50%;
    width:100px;
    border-radius:5px;
    background: white;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menubar.jsp" %>
<%-- -------------------------------------------------- SIDE BAR MENU 사이드 메뉴  [구문 START] --------------------------------------------------   --%>
<div class="lnb">    
	<h2 class="lnb_title">건강정보</h2>		
	<ul class="lnb_menu">
		<li class="on"><a href="#">질환백과</a></li>
		<li><a href="/jiksan/views/common/error.jsp">최근 환자 분석</a></li>
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



<%-- -------------------------------------------------- diseaseContents [구문 START] --------------------------------------------------   --%>
<div class="diseaseContents">

<h1 align="center" >질환백과</h1>
<br>
   <form align="center" action="/jiksan/dsearch" method="post">
      <select name="category">
      		<option value= "diseaseNm">전체 검색</option>
      		<option value="diseaseNm" selected>질환 및 질병</option>
      		<option value="diseaseNm">검사 및 치료</option>
      </select>
      <input type="search" name="keyword" size=40px; placeholder="검색어 입력">
      <input type="submit" value="검색" >
   </form>
   <br><br>
   
<!-- <table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
<tr><th>번호</th><th>제목</th><th>(썸네일이 올자리)</th></tr> -->
<% for(Disease d : list){ %>
<%-- 		<% if(d.getPic01() !=null){ %>
			<a href="/jiksan/disease?disease_no=<%=d.getDiseaseNo() %>">
				<img src="jiksan/resources/disease_files/<%=d.getPic01() %>"  alt="<%= d.getDiseaseNm() %>"
				height="150px" class="gallery">
			</a>
		<%}else {%> --%>

			<%-- <button type="submit" onclick="getDisNo('<%= disease.getDiseaseNo() %>')"
			style="width: 150px; height: 150px;"><%= d.getDiseaseNm() %></button> --%>
			
			<button type="submit" onclick="location.href='disease?disease_no=<%=d.getDiseaseNo()%>'"
			style="width: 150px; height: 150px;"><%= d.getDiseaseNm() %></button>
			
			
			
<%-- <% } %> --%>
<% } //for each %>
<!-- </table> -->

<%-- 검색용 번호 리스트  --%>
<% if(keyword == null){ %>
<div style="text-align: center;">
<%  if(currentPage <= 1){  %>
[맨처음]
<%}else{ %>
<a href="/jiksan/dlist?page=1">[맨처음]</a>
<% }  %> &nbsp;

<%  if((currentPage-10) < startPage && (currentPage - 10) >= 1){  %>
<a href="/jiksan/dlist?page=<%= startPage-10 %>">[이전]</a>
<%}else{ %>
[이전]
<% }  %> &nbsp;


<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){	
%>
<font size="4" color="red">[<%= p  %>]</font>
<% }else{ %>
<a href="/jiksan/dlist?page=<%= p %>"><%= p  %></a>
<% }
		} %> &nbsp;

<%  if((currentPage+10) > endPage && (currentPage + 10) < maxPage){  %>
<a href="/jiksan/dlist?page=<%= startPage+10 %>">[다음]</a>
<%}else{ %>
[다음]
<% }  %> &nbsp;


<%  if(currentPage >= maxPage){  %>
[맨끝]
<%}else{ %>
<a href="/jiksan/dlist?page=<%= maxPage %>">[맨끝]</a>
<% }  %>
&nbsp;
<%}else{ %>

</div>
<%-- 검색용 번호 리스트  --%>
<div style="text-align: center;">
<%  if(currentPage <= 1){  %>
[맨처음]
<%}else{ %>
<a href="/jiksan/dsearch?page=1&category=<%= category %>&keyword=<%= keyword %>">[맨처음]</a>
<% }  %> &nbsp;

<%  if((currentPage-10) < startPage && (currentPage - 10) >= 1){  %>
<a href="/jiksan/dsearch?page=<%= startPage-10 %>&category=<%= category %>&keyword=<%= keyword %>">[이전]</a>
<%}else{ %>
[이전]
<% }  %> &nbsp;


<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){	
%>
<font size="4" color="red">[<%= p  %>]</font>
<% }else{ %>
<a href="/jiksan/dsearch?page=<%= p %>&category=<%= category %>&keyword=<%= keyword %>"><%= p  %></a>

<% }
		} %> &nbsp;

<%  if((currentPage+10) > endPage && (currentPage + 10) < maxPage){  %>
<a href="/jiksan/dsearch?page=<%= startPage+10 %>&category=<%= category %>&keyword=<%= keyword %>">[다음]</a>
<%}else{ %>
[다음]
<% }  %> &nbsp;


<%  if(currentPage >= maxPage){  %>
[맨끝]
<%}else{ %>
<a href="/jiksan/dsearch?page=<%= maxPage %>&category=<%= category %>&keyword=<%= keyword %>">[맨끝]</a>
<% }  %>
&nbsp;
<% } %>

</div>
</div>



<%--  ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇBo's Versionㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
<!-- 검색기능 --!>
<script type="text/javascript">
$(function(){
	showDiv();
	$("input[name=item]").on("change", function(){
		showDiv();
	});	
});//jquery document ready
function showDiv(){
		if($("input[name=item]").eq(0).is(":checked")){
				$("#disTypeDiv").css("display", "block");
				$("#treatTypeDiv").css("display", "none");
		}if($("input[name=item]").eq(1).is(":checked")){
			$("#disTypeDiv").css("display", "none");
			$("#treatTypeDiv").css("display", "block");
	}if($("input[name=item]").eq(2).is(":checked")){
		$("#disTypeDiv").css("display", "none");
		$("#treatTypeDiv").css("display", "none");
}
}
</script>
<div style="text-align:center;">

<div><h2> 검색할 질환 및 질병을 선택하시오.</h2>
		<input type="radio" name ="item" value="diseaseType" checked> 질환 및 질병명 &nbsp; &nbsp; &nbsp; 
		<input type="radio" name ="item" value="treatmentType"> 검사 및 치료명 &nbsp; &nbsp; &nbsp; 
		</div>
		<div id = "disTypeDiv">
				<form action="/jiksan/dsearch" method="post">
					<input type = "hidden" name="search" value="title"> 질환 및 질병명 , 검사 및 치료명 검색을 하나로 해결
					<label>질환 및 질병명 : <input type="search" name="keyword"></label>
					<input type = "submit" value="검색">
				</form>
		</div>
		<div id = "treatTypeDiv">
		<form action="/jiksan/dsearch" method="post">
			<input type = "hidden" name="search" value="writer"> 질환 및 질병명 , 검사 및 치료명 검색을 하나로 해결
			<label>검사 및 치료명 : <input type="search" name="keyword"></label>
			<input type = "submit" value="검색">
		</form>
</div>
<br><br> 
</div>
</div>
%-->
<%-- -------------------------------------------------- diseaseContents [구문 End] --------------------------------------------------   --%>


<%@ include file="../common/footer.jsp" %>
</body>
</html>