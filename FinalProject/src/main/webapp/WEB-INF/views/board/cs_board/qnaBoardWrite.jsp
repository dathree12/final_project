<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A 글쓰기</title>
    <link rel="stylesheet" href="${ path }/css/board/cs_style/notiQnaWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
     <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
</head>
<body>
	 <div class="wrap">
    <section class="brboard-write">
        <section class = "brboard-top">
            <div class = "brboard-top-title">
                <a href="#">Q&A</a>
            </div>
            <div class = "brboard-top-button">
                <a href="#" class="write-button">글쓰기</a>
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
                <textarea name="content" id="ckeditor"></textarea>
            </form>
        </section>
        <section class="brboard-write-bottom">
            <a href="#" id="write-bottom-cancelbtn">취소</a>
            <a href="#" id="write-bottom-enrollbtn">등록</a>
        </section>
    </div>    
    <script>
    // 3. CKEditor5를 생성할 textarea 지정
    ClassicEditor
        .create( document.querySelector( '#ckeditor' ) )
        .catch( error => {
            console.error( error );
        } );
    </script>
    </div>
</body>

<%@ include file="../../common/footer.jsp" %>
