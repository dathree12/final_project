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
    <link rel="stylesheet" href="${ path }/css/board/bc_board/bcBoardRead.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
</head>
<body>
    <section class="propose-read-section-1th">
        <article class="propose-read-article-1th">
            <div class="board_title">
                <p class="view_title">테스트</p>
            </div>
            <div class="board_summary">
                <div class="left">
                    <div class="avatar">
                        <img alt="프로필 이미지" src="https://cdn.imweb.me/thumbnail/20161214/5850d6a2c09a8.jpg" class="avatar-image">
                    </div>
                    <div class="author">
                        <div class="write">김동민</div>
                    </div>
                </div>
                <div class="board_txt_area">
                    <p>
                      dwaddawdwadwad 
                    
                    </p>
                </div>
                <div class="comment_section">
                    <div class="comment-block">
                        <div class="btn-group-wrap">
                            <i class="far fa-heart"></i>
                            <span class="view_like_count">0</span>
                        </div>
                    </div>
                </div>
                <div class="comment_textarea">
                    <form action="" method="" class="comment_form">
                        <div class="custom-textarea">
                            <textarea class="comment_body" style="border: 0px; outline: none;" name="comment_body" id="comment_body" rows="1" placeholder="댓글을 남겨주세요"></textarea>
                            <div class="write_button_wrap">
                                <div class="none"></div>
                                <div class="write_button">
                                    <a href="#" style="color: #fff;">작성</a>
                                </div>
                            </div>
                         </div>
                    </form>
                    <div class="list_button_wrap">
                        <div class="none"></div>
                        <div class="write_button">
                            <a href="#" style="color: #fff;">목록</a>
                        </div>
                    </div>
                    <div class="bottom_list_wrap">
                        <ul>
                            <li class="next">
                                <span><a><i class="fas fa-chevron-down"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음글</a></span>
                                <span><a href="#" id="next_title">비밀글 테스트</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </article>
    </section>

    <script>
        $(document).ready(function() {
            $('.comment_body').on('keyup', function(e) {
                $(this).css('height', 'auto');
                $(this).height(this.scrollHeight);
            });
            $('.comment_body').keyup();
        })
    </script>

<%@ include file="../../common/footer.jsp" %>