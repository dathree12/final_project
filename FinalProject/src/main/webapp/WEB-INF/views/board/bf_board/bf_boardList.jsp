<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="main.js" defer></script>
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_boardList.css" type="text/css">
	<title>책스초코 펀딩 게시판</title>
	<script src="${path}/js/jquery-3.5.1.js"></script>
</head>

<body>
    <div class="fdboard_top">
        <div class="fdboard_top_title">
            <a href="#">책스초코 펀딩 프로젝트</a>
        </div>
        
        <div class="fdboard_top_menu">
            <li><a href="#">인기 프로젝트</a></li>
            <li><a href="#">전체보기</a></li>
            <li><a href="#">성공 임박 프로젝트</a></li>
            <li><a href="#">마감된 프로젝트</a></li>
        </div>
    </div>
    
    <hr>
    <div class="fdboard_mid">
        <div class="fdboard_mid_searchbar">
            <form class="fdboard_mid_searchbar_form" action="test" method="GET">
                <select name="fd_search_sort" class="fdboard_mid_searchbar_item sort">
                    <option value="fd_search_id" selected>작성자</option>
                    <option value="fd_search_title">제목</option>
                    <option value="fd_search_content">내용</option>
                </select>
                <div class="fdboard_mid_searchbar_item inputbox">
                    <input type="search" class="fd_search_inputbox" placeholder="검색어를 입력해주세요" name="fd_searchword">
                </div>
                <a href="">검색</a>
            </form>
        </div>
        <div class="fdboard_mid_sortprice">
            <a href="">상품명</a>&nbsp
            <a href="">낮은가격</a>&nbsp
            <a href="">높은가격</a>
        </div>
        <div class="fdboard_top_enroll">
            <a href="#">프로젝트 신청하기</a>
        </div>

        <div class="fdboard_mid_container">
            <div class="fdboard_mid_box" id="fdboard_01">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" class="fdboard_img" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_02">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_03">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_04">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_05">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_06">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_07">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_08">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_09">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_10">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_11">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>

            <div class="fdboard_mid_box" id="fdboard_12">
                <div class="fdboard_thumbnail">
                    <div class="fdboard_attainRate">달성%</div>
                    <a href="#" name="fdboard_img">
                        <img src="./image/book.jpg" width="180px" height="270px">
                    </a>
                </div>
                <div class="fdboard_contants">
                    <p>펀딩 책 제목</p>
                    <p>100,000원</p>
                    <p>종료까지 123일 남음</p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="fdboard_mid_bottom">
        <div class="fdboard_mid_pageCount">
            <a href="#">&lt;&lt;</a>
            <a href="#">&lt;</a>
            <a href=""> 1 </a><a href=""> 2 </a><a href=""> 3 </a><a href=""> 4 </a><a href=""> 5 </a>
            <a href="#">&gt;</a>
            <a href="#">&gt;&gt;</a>
        </div>
    </div>	
	
<%@ include file="../../common/footer.jsp" %>

