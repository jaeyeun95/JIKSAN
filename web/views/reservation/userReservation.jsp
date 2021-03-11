<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/jiksan/resources/css/calendar.css">
  <script src="/jiksan/resources/js/jquery-3.5.1.min.js"></script>
  <script src="/jiksan/resources/js/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>
<form>
   <table>
   <tr>
      <td>
      <table>
      <tr><th>병명(질환명)선택</th></tr>
      <tr><td><input type="text" value="병명(질환명)을 입력하세요."></td></tr>
      <tr><td>만성질환</td></tr>
      </table>
      </td>
      
      <td rowspan="2">
      <table>
      <tr><th>담당의사 선택</th></tr>
      <tr><td><input type="text" value="담당의사를 입력하세요."></td></tr>
      <tr><td>김박사</td></tr>
      </table>
      </td>

      <td>
      <table>
      <tr><th>진료날짜 및 시간 선택</th></tr>
      <tr><td><div id="datepicker"></div></td></tr>
      </table>
      </td>
      
   </tr>

   <tr>
   <td>
      <table>
      <tr><th>진료과 선택</th></tr>
      <tr><td><input type="text" value="진료과를 입력하세요."></td></tr>
      <tr><td>내과</td></tr>
      </table>
   </td>

   <td>
      <table>
      <tr><th>예약정보 확인</th></tr>
      <tr><td>본인예약</td></tr>
      <tr><td>진료병원</td><td>직산병원</td><td><input type="button" onclick="" value="위치보기"></td></tr>
      <tr><td>진료과</td><td>내과</td></tr>
      <tr><td>담당의사</td><td>김박사</td></tr>
      <tr><td>진료날짜</td><td>2020년 12월 31일</div></td></tr>
      <tr><td>진료시간</td><td>13:30</td></tr>
      <tr><td><input type="button" onclick="" value="진료예약신청"></td></tr>
      </table>
   </td>
    </tr>
   </table>
</form>
