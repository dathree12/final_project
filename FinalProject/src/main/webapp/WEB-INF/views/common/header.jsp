<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="${path}/css/common/header.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="${path}/js/jquery-3.5.1.js"></script>

    <title>nav</title>
</head>
<body>
    <div class="nav_header" id="nav_header">
        <div class="nav_anbArea">
            <div class="nav-c-width">
                <ul class="nav-anb">
                	<li>
                        <a href="${path}/member/login">로그인</a>
                    </li>
                    <li>
                        <a href="${path}/member/enrollTerms">회원가입</a>
                    </li>
                    <li>
                        <a href="#">마이쇼핑</a>
                    </li>
                    <li>
                        <a href="#">주문조회</a>
                    </li>
                    <li>
                        <a href="#">장바구니</a>
                    </li>
                </ul>
                <div class="topArea">
                    <div class="nav-c-width">
                        <h1 class="-logo">
                            <a href="/" class="this">
                                <img id="checks-logo" src="${path}/images/head-logo.png" alt="책스초코">
                            </a>
                        </h1>
                        <div class="nav-center">
                            <form action="" id="searchBarForm" name="" method="get" enctype="" target="">
                                <input type="text" id="banner_action" name="banner_action" value="" type="">
                                <div class="-search">
                                    <fieldset>
                                        <legend>검색</legend>
                                        <input type="text" id="keyword" name="keyword" class="inputTypeText" placeholder="검색 하던지 말던지.." value="">
                                        <span class="btn_h_search" onclick="">
                                            <i class="fas fa-search"></i>
                                        </span>
                                    </fieldset>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="menuArea">
                    <div class="-menu">
                        <div id="category" class="-category">
                            <div class="position">
                                <ul class="-board-1th">
                                    <li class="xans-record-"><a href="${path}/board/br_board/brBoardMain">Review</a></li>
                                    <li class="xans-record-"><a href="#">Funding</a></li>
                                    <li class="xans-record-"><a href="#">Clubs</a></li>
                                    <li class="xans-record-"><a href="#">Locations</a></li>
                                </ul>
                                <ul class="-board-2th">
                                    <li class="_bul">|</li>
                                    <li class="xans-record-">
                                        <a href="${path}/board/cs_board/notiBoardMain">공지사항</a>
                                    </li>
                                    <li class="xans-record-">
                                        <a href="${path}/board/cs_board/qnaBoardMain">Q&A</a>
                                    </li>
                                    <li class="xans-record-">
                                        <a href="#">사용후기</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class="navbar__toggleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </div>

    <script>
        const toggleBtn = document.querySelector('.navbar__toggleBtn');
        const menu1 = document.querySelector('.position ul');

        toggleBtn.addEventListener('click', () => {
            /* menu에 classList 중 toggle이 되면 active가 적용되는 쿼리 */
            menu1.classList.toggle('active');
        });
    </script>