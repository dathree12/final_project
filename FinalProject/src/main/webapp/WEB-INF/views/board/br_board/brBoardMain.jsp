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
    <title>북리뷰게시판 메인</title>
    <link rel="stylesheet" href="${ path }/css/board/br_style/brBoardMain.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    
</head>
<%@ include file="../../common/header.jsp" %>
<div id="wrap">
<section class="brboard-body">    
    <section class = "brboard-top">
        <div class = "brboard-top-title">
            <a href="#">북리뷰 게시판</a>
        </div>
        <div class = "brboard-top-menu">
            <li><a href="#">전체</a></li>
            <li><a href="#">소설</a></li>
            <li><a href="#">어린이/청소년</a></li>
            <li><a href="#">경제/경영</a></li>
            <li><a href="#">인문/사회/역사</a></li>
            <li><a href="#">종교/역학</a></li>
            <li><a href="#">자기개발</a></li>
        </div>
        <div class = "brboard-top-button">
            <a href="${path}/board/br_board/brBoardWrite" class="write-button">글쓰기</a>
        </div>
        <hr id="line">
    </section>
    <section class="brboard-mid">
        <div class="brboard-mid-searchbar">
            <form action="test" method="GET">
                <select name="br_search_sort" class="brboard-mid-searchbar_item sort">
                    <option value="br_search_id" selected>작성자</option>
                    <option value="br_search_title">제목</option>
                    <option value="br_search_content">내용</option>
                </select>
                <div class="brboard-mid-searchbar_item inputbox">
                    <input type="search" class="br-search-inputbox" placeholder="검색어를 입력해주세요" name="br_searchword"/>
                </div>
                <div class = "brboard-mid-searchbar_item searchbutton">
                    <a class="searchbutton">검색</a>
                </div>
                <div class = "brboard-mid-searchbar_item sorting">
                    <a onclick="location.href='#'" id="sorting_newest">최신순</a>
                    <a onclick="location.href='#'" id="sorting_best">추천순</a>
                </div>
                
            </form>    
        </div>
        <section class="brboard-mid-container">
            <div class="brboard-reviewbox" id="bookreview1">
                <div class="thumbnail">
                    <a href="#" name="thumbnailbox"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-A5U34i3_y1GNyv8o_I9piMiSFg52KPQzw&usqp=CAU" id="thumbnailpic"></a>
                </div>    
                <div class="review-description">
                    <div class="book-description">
                        <p id="review-title"><a href="#">리뷰제목</a></p>
                        <p id="review-booktitle">책제목</p>
                        <p id="review-writer">리뷰작성자</p>
                    </div>
                    <div class="count-description">
                        <p id="review-writedate">2021.03.25</p>
                        <span id="review-viewcount"><img src="${ path }/images/storytelling.png" id="viewcount-icon">조회수</span>
                        <span id="review-recocount"><img src="${ path }/images/redheart.png" id="recocount-icon">추천수</span>
                    </div>
                </div>
            </div> 
        </section>
    </section>
    <section class="brboard-bot">
        <div class="brboard-pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
        </div>
<!--http://ecudemo121656.cafe24.com/ 참고하기-->
    </section>
</div>    
</div>    
<%@ include file="../../common/footer.jsp" %>
