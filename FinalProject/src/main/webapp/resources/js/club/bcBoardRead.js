// 상단 네비고정
$(document).ready(function() {
    $('.comment_body').on('keyup', function(e) {
        $(this).css('height', 'auto');
        $(this).height(this.scrollHeight);
    });
    $('.comment_body').keyup();
})