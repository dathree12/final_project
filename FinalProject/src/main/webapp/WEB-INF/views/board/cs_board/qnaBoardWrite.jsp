<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<%@ include file="../../common/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>Q&A 글쓰기</title>
    <link rel="stylesheet" href="${ path }/css/board/cs_style/notiQnaWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    <script src="${ path }/ckeditor/ckeditor.js"></script>
</head>
	<div class="wrap" style="width: 1280px; margin: auto;">
    <section class="brboard-write">
        <section class = "brboard-top">
            <div class = "brboard-top-title">
                <a href="#">Q&A</a>
            </div>
            <div class = "brboard-top-button">
                <a href="${path}/board/cs_board/qnaBoardWrite" class="write-button">글쓰기</a>
            </div>
            <hr id="line">
        </section>    
        <section class ="brboard-write-body">
            <form action="test" method="GET">
                <p>공지사항 글쓰기</p>
                <div class="brboard-write-option">
                    <p>글제목</p>
                    <div id="brboard-write-title">
                        <input type="text" id="title" name="title" required>
                    </div>
                </div>
                <textarea name="bcContent" id="bcContent" rows="10" cols="80"></textarea>
                <script type="text/javascript">
                CKEDITOR.replace( "bcContent", {//해당 이름으로 된 textarea에 에디터를 적용
					height: 1000,
					getUploadUrl: type='image',
					filebrowserUploadUrl: '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
				});
				
				CKEDITOR.editorConfig = function( config ) { 
				config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
				};
                </script>
                <!--  
   	                <script src="${ path }/js/club/bcAdminWrite.js"></script>
                -->
                <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
            </form>
        </section>
        <section class="brboard-write-bottom">
            <a href="#" id="write-bottom-cancelbtn">취소</a>
            <a href="#" id="write-bottom-enrollbtn">등록</a>
        </section>
    </div>    

    </div>

<%@ include file="../../common/footer.jsp" %>
