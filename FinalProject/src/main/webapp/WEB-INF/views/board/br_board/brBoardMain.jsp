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
            <a style="color:#353535" href="#">북리뷰 게시판</a>
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
        	<c:if test="${list != null }">
        		<c:forEach var="board" items="${list}">
		            <div class="brboard-reviewbox" id="bookreview1">
		                <div class="thumbnail">
		                    <a href="#" name="thumbnailbox"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-A5U34i3_y1GNyv8o_I9piMiSFg52KPQzw&usqp=CAU" id="thumbnailpic"></a>
		                </div>    
		                <div class="review-description">
		                    <div class="book-description">
		                        <p id="review-title"><a href="#"><c:out value="${board.brTitle}" /></a></p>
		                        <p id="review-bookisbn" style="display:none"><c:out value="${board.brIsbn}"/></p>
		                        <p id="review-booktitle"></p>
		                        <p id="review-writer"><c:out value="${board.brTitle}" /></p>
		                    </div>
		                    <div class="count-description">
		                        <p id="review-writedate"><c:out value="${board.brTitle}" /></p>
		                        <span id="review-viewcount"><img src="${ path }/images/storytelling.png" id="viewcount-icon"><c:out value="${board.brViewCount}" /></span>
		                        <span id="review-recocount"><img src="${ path }/images/redheart.png" id="recocount-icon"><c:out value="${board.brLike}" /></span>
		                    </div>
		                </div>
		           	  </div>
		           </c:forEach> 
            </c:if>
        </section>
    </section>
    <section class="brboard-bot">
        <div class="brboard-pagination">
            <a href="${path}/board/br_board/brBoardMain?page=1">&lt;&lt;</a> &nbsp &nbsp
            <a href="${path}/board/br_board/brBoardMain?page=${pageInfo.prvePage}">&lt;</a> &nbsp &nbsp
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<a disabled><u><b><b><c:out value="${status.current}"/></b></b></u></a> &nbsp &nbsp
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<a href="${path}/board/br_board/brBoardMain?page=${status.current}"><c:out value="${status.current}"/></a>
					&nbsp &nbsp
   				</c:if>
			</c:forEach>            
            
            <a href="${path}/board/br_board/brBoardMain?page=${pageInfo.nextPage}">&gt;</a> &nbsp &nbsp
            <a href="${path}/board/br_board/brBoardMain?page=${pageInfo.maxPage}">&gt;&gt;</a>
        </div>
<!--http://ecudemo121656.cafe24.com/ 참고하기-->
    </section>
	</div>    
</div>
	<script>
	 $(document).ready(function () {
             $.ajax({
                 method: "GET",
                 url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                 data: { query: $("#review-bookisbn").val() },
                 headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" }
             })
                 .done(function (msg) {
                 	console.log(msg.documents[0].isbn);
                     console.log(msg.documents[0].title);
                     console.log(msg.documents[0].thumbnail);
                     $("#review-booktitle").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                 });
     });
	</script>
<%@ include file="../../common/footer.jsp" %>
