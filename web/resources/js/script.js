//��ȸ�� �˻�
function Journal_Frm(vol,num)
	{
		theForm = document.Journal_form;
		if(!theForm.key_word.value) {
			alert("�˻�� �Է��Ͽ� �ֽʽÿ�.");
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

// ���� �����̵�
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

// ���� �޴� (con01-right) ȣ��
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

// �Ѹ����
$(document).ready(function(){
	$('.con04-benner').slick({
	  slidesToShow: 5,
	  slidesToScroll: 1,
	  autoplaySpeed: 2000,
	  autoplay: true
	  
	});
});

// ���޴�
$(document).ready(function(){
	var currentPosition = parseInt($(".quick").css("top"));
    $(window).scroll(function() {
		var position = $(window).scrollTop(); // ���� ��ũ�ѹ��� ��ġ���� ��ȯ�մϴ�.
        $(".quick").stop().animate({"top":position+currentPosition+"px"},1000);
    });
});