// ckeditor 적용
CKEDITOR.replace( "proposeContent", {//해당 이름으로 된 textarea에 에디터를 적용
	height: 1000,
	getUploadUrl: type='image',
	filebrowserUploadUrl: '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
});

CKEDITOR.editorConfig = function( config ) { 
	config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
};

// 앵커태그 눌렀을때 폼 전송
function submitButton() {
	document.post_form.submit();
}