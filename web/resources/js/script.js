//학회지 검색
function Journal_Frm(vol,num)
	{
		theForm = document.Journal_form;
		if(!theForm.key_word.value) {
			alert("검색어를 입력하여 주십시오.");
			theForm.key_word.focus();
			return false;
		}
		if (!theForm.key.value)
			{
				theForm.key.value = "all";
			}
			//theForm.action = "/paper/list.html";
			theForm.action = "/new_paper/list.html";
			theForm.submit();
	}

// 메인 슬라이드
$(document).ready(function(){
	$('.con01-visual').slick({
		dots: true,
		arrows: false,
		infinite: true,
		autoplay: true,
		autoplayspeed: 2000,
		speed: 1000,
		cssEase: 'linear'
	});
});

// 메인 메뉴 (con01-right) 호버
$(function(){
	$('.con01-hover').hide();
	$('.con01-right >ul >li').mouseenter(function(){
		$(this).children('.con01-hover').stop().fadeIn(); 
		$(this).children('.con01-inner').stop().fadeOut(100); 
	});

	$('.con01-right >ul >li').mouseleave(function(){
		$('.con01-inner').stop().fadeIn(); 
		$('.con01-hover').stop().fadeOut(100); 
	});
});

// 롤링배너
$(document).ready(function(){
	$('.con04-benner').slick({
	  slidesToShow: 5,
	  slidesToScroll: 1,
	  autoplaySpeed: 2000,
	  autoplay: true
	  
	});
});

// 퀵메뉴
$(document).ready(function(){
	var currentPosition = parseInt($(".quick").css("top"));
    $(window).scroll(function() {
		var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
        $(".quick").stop().animate({"top":position+currentPosition+"px"},1000);
    });
});