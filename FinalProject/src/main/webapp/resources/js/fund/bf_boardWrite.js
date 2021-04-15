// bf_boardWrite ck에디터 적용

CKEDITOR.replace( "bfContent", {//해당 이름으로 된 textarea에 에디터를 적용
	height: 500,
	getUploadUrl: type='image',
	filebrowserUploadUrl: '<c:url value="/board/bf_board/bf_boardWriteCK" />?${_csrf.parameterName}=${_csrf.token}'
});

CKEDITOR.editorConfig = function(config) {config.filebrowserUploadUrl = '/board/bf_board/bf_boardWriteCK';};
