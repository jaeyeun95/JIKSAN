<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 건강정보(질환백과): 정보등록하기</title>
<link rel="stylesheet" type="text/css" href="/jiksan/resources/css/jiksan-sidebar.css"/>
<script type="text/javascript">
	function fnCancel(){
		if(confirm("정말로 취소 하시겠습니까?")==true){
			location.href="/jiksan/dlist";
			return true;
		}else{
		return false;
		}
	};
</script>
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

<img src="/jiksan/resources/main_images/admin-01.png" alt="관리자용 페이지" width="30px" align="center">
<br>
<h1 align="left;">건강정보(질환백과)</h1>
<form action="/jiksan/dinsert.ad" method="post" enctype="multipart/form-data">
	<table align="center" width="800" border="1" cellspacing="0" cellpadding="1" >
		
		<tr><td align="center" width="70">질환명</td><td colspan="3"><input type="text" name="diseaseNm" size="50" required></td></tr>
		<tr><td align="center" width="70"><label for="deptNo">진료과</label></td><td colspan="3">		  
		  <select id="deptNo" name="deptNo" required>
		    <option value="1">가정의학과</option>
		    <option value="2">내과</option>
		    <option value="3">소아과</option>
		    <option value="4">이비인후과</option>
		  </select>
		</td></tr>
		<tr><td align="center" width="70">진료예약 가능한가요?</td><td colspan="3">
				<input type="radio" id="Y" name="reservable" value="Y"><label for="Y" required>예약가능 (Yes)</label>&nbsp;&nbsp;
				<input type="radio" id="N" name="reservable" value="N" checked required><label for="N">예약불가능 (No)</label><br>
		</td></tr>
		
		<tr><td align="center" width="70">정의</td><td colspan="3"><input type="text" name="sect01" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text01"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic01"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>
		
		<tr><td align="center" width="70">원인 및 위험인자</td><td colspan="3"><input type="text" name="sect02" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text02"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic02"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>
		
		<tr><td align="center" width="70">증상</td><td colspan="3"><input type="text" name="sect03" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text03"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic03"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>

		<tr><td align="center" width="70">검사 · 진단</td><td colspan="3"><input type="text" name="sect04" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text04"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic04"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>

		<tr><td align="center" width="70">치료 (방법 · 종류)</td><td colspan="3"><input type="text" name="sect05" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text05"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic05"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>

		<tr><td align="center" width="70">합병증</td><td colspan="3"><input type="text" name="sect06" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text06"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic06"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>

		<tr><td align="center" width="70">주의사항</td><td colspan="3"><input type="text" name="sect07" size="50"></td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="text07"></textarea></td></tr>
		<tr><td align="center" width="70">첨부파일</td><td colspan="3"><input type="file" name="pic07"></td></tr>
		<tr><td colspan="4" style="background-color:#3d84be"></td></tr>
		
		<tr><td colspan="4" align="center">질환명 유의어 · 함께 검색되는 질병또는 질환명</td></tr>
		<tr height="200"><td colspan="4"><textarea rows="15" cols="130" name="diseaseAltNm"></textarea></td></tr>
		
		<tr>
			<td colspan="4" align="right">
				<input type="reset" value="취소" onclick="fnCancel(); return false;">				
				<input type="button"  value="목록" onclick="javascript:location.href='/jiksan/dlist;'">
				<input type="submit" value ="등록">
			</td>
		</tr>
	</table>
</form>

<%@ include file="../common/footer.jsp" %>
</body>
</html>