// 네비게이션 고정 이건 더 알아봐야할듯
$(function() {
    var jbOffset = $('.nav_header').offset();
    $(window).scroll( function() {
        if ($(document).scrollTop() > jbOffset.top) {
            $('.menuArea').addClass('jbFixed');
        }
        else {
            $('.menuArea').removeClass('jbFixed');
        }
    });
});

// 박스 선택하면 선택영역에 추가하기
function selectBoxCliked () {
    // 잊어버린 내용 innerHTML은 <div>, <span>의 텍스트 노드값을 자식으로 갖고있으면 복사해온다.
    var selectVal = document.querySelector('#selectVal');
    var resultProduct = document.querySelector('.resultProduct');
    var opt_block = document.querySelector('.opt_block');

    resultProduct.innerHTML = selectVal.innerHTML;

    if (!(resultProduct === null) && resultProduct !== "") {
        opt_block.style.display = 'block';
        selectVal.addEventListener('click', function() {
            alert('이미 선택한 상품입니다.');
        });
    }
}

// 결제페이지로 이동
function goPayment() {
	var prdOption0 = document.getElementById('prdOption0');
	
	if(prdOption0.style.display === 'none') {
		alert('일정을 선택해주세요');
		
	} else {
		document.frm.submit();
	}

	
}

// 부트스트랩 드롭다운
$(function() {
    $('.dropdown-toggle').dropdown();
});