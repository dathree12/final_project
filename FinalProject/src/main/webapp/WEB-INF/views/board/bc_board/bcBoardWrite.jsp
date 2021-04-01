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
    <title>Document</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_board/bcBoardWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
</head>
<body>
    <section class="propose-write-section-1th">
        <article class="propose-write-article-1th">
            <div class="write-header">
                <div class="board-name">북 클럽 제안서 작성</div>
                <div class="write-btn">
                    <a href="#">취소</a>
                    <a href="#">작성</a>
                </div>
            </div>
        </article>
    </section>
    <section class="propose-write-section-2th">
        <article class="propose-write-article-2th">
            <form action="" method="post" id="post_form" target="hidden_frame">
                <div class="board_summary">
                    <div class="left">
                        <div class="avatar">
                            <img alt="프로필 이미지" src="https://cdn.imweb.me/thumbnail/20161214/5850d6a2c09a8.jpg" class="avatar-image">
                        </div>
                        <div class="author">
                            <div class="write">김동민</div>
                        </div>
                    </div>
                </div>
                <div class="editor_box">
                    <span>
                        <input name="member_secret_pass" class="basic_input" type="password" value="" placeholder="비밀번호">
                    </span>
                </div>
                <div class="table-cell">
                    <input id="post_subject" class="post_subject" name="subject" value="" placeholder="제목" type="text">
                </div>
                <textarea name="content" id="ckeditor"></textarea>
            </form>
        </article>
    </section>
    <script>
        // 3. CKEditor5를 생성할 textarea 지정
        ClassicEditor
            .create( document.querySelector( '#ckeditor' ) )
            .catch( error => {
                console.error( error );
        } );
    </script>
    
<%@ include file="../../common/footer.jsp" %>