// jQuery.Deferred exception
//  -> 콜백함수를 사용하여 비동기를 처리할경우, 여러 개의 콜백함수가 nesting되어 복잡도가 높아질 수 있습니다.
//  -> 스크립트 순서도 중요!
$(function() {
	$(".carousel").owlCarousel({
		margin: -10,
		loop: true,
		autoplay: true,
		autoplayTimeout:2000,
		autoplayHoverpause: true,
		responsive: {
		    0:{
		        items: 1,
		        nav: false
		    },
		    600:{
		        items: 2,
		        nav: false
		    },
		    1000:{
		        items: 3,
		        nav: false
		    },
		    1280:{
		        items: 4,
		        nav: false
		    }
		}
	});
});

var val = document.querySelector('._catelist_best');
var d_none = "d_none";

function removeFunc() {
    val.classList.add(d_none);
};

function addFunc() {
	val.classList.remove(d_none);
};
