<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_boardList.css" type="text/css">
	<title>책스초코 펀딩 게시판</title>
	<script src="${path}/js/jquery-3.5.1.js"></script>
</head>

<%@ include file="../../common/header.jsp" %>

	<div class="fd_boardList_body">
	
    <div class="fdboard_top">
        <div class="fdboard_top_title">
            <a href="#">책스초코 펀딩 프로젝트</a>
        </div>
        
        <div class="fdboard_top_menu">
            <li><a href="${path}/board/bf_board/bf_boardList_viewCount">인기 프로젝트</a></li>
            <li><a href="${path}/board/bf_board/bf_boardList">전체보기</a></li>
            <li><a href="${path}/board/bf_board/bf_boardList_remainDate">마감 임박 프로젝트</a></li>
            <li><a href="${path}/board/bf_board/bf_boardList_endDate">마감된 프로젝트</a></li>
        </div>
    </div>
    
    <hr>
    <div class="fdboard_mid">
        <div class="fdboard_mid_searchbar">
            <!-- 제목과 내용으로만 검색하기, 페이징처리x, 새로운 jsp로 이동한다. -->
            <form class="fdboard_mid_searchbar_form" action="${path}/board/bf_board/bf_searchList" method="get">
                <select name="fd_search_sort" class="fdboard_mid_searchbar_item sort">
                    <option value="bfTitle">제목</option>
                    <option value="bfContent" >내용</option>
                </select>
                <input name="keyword" placeholder="검색어를 입력해주세요">
                <input type="submit" value=" 검색 ">
                <!-- <a  onclick="document.getElementById('bf_searchList').submit();">검색</a> -->
                <!-- <div class="fdboard_mid_searchbar_item inputbox">
                    <input type="search" class="fd_search_inputbox" placeholder="검색어를 입력해주세요" name="fd_searchword">
                </div> -->
            </form>
        </div>
<!--         <div class="fdboard_mid_sortprice">
            <a href="">상품명</a>&nbsp
            <a href="">낮은가격</a>&nbsp
            <a href="">높은가격</a>
        </div> -->
        
        <security:authorize access="hasRole('USER')">
	        <div class="fdboard_top_enroll">
	            <a href="${path}/board/bf_board/bf_agreement">프로젝트 신청하기</a>
	        </div>
 		</security:authorize>
 		
        <div class="fdboard_mid_container">
        	<c:if test="${list == null}">
	            <div class="fdboard_mid_box" id="fdboard_01">
	                <div class="fdboard_thumbnail">
	                    <div class="fdboard_attainRate"></div>
	                    <a href="#" class="fdboard_img" name="fdboard_img">
	                        <img src="#" width="180px" height="270px">
	                    </a>
	                </div>
	                <div class="fdboard_contants">
	                    <p>조회된 게시글이 없습니다.</p>
	                    <p>관리자에게 문의해주세요.</p>
	                    <p></p>
	                </div>
	            </div>        		
        	</c:if>
        	
        	<c:if test="${list != null}">
        		<c:forEach var="board" items="${list}">
		            <div class="fdboard_mid_box" id="fdboard_01">
		            	<input type="hidden" name="bfNo" value="${board.bfNo}">
		                <div class="fdboard_thumbnail">
		                    <div class="fdboard_attainRate"><c:out value="${board.bfAttainRate}"/>%</div>
		                    <a href="${path}/board/bf_board/bf_viewDetail?bfNo=${board.bfNo}" class="fdboard_img" name="fdboard_img">
		                        <img src="${ path }/upload/bf_board/${ board.bfReImgName }" width="180px" height="270px">
		                    </a>
		                </div>
		                <div class="fdboard_contants">
		                    <c:if test="${board.bfRemainDate < 0}">
		                    <p>마감되었습니다.</p>
		                    </c:if>
		                    <p><c:out value="${board.bfTitle}"/></p>
		                    <%-- <p><c:out value="${board.bfPrice}"/>원</p> --%>
		                    <p><c:out value="${-board.bfRemainDate}"/>일 지남</p>
		                    
		                </div>
		            </div>        			
        		</c:forEach>
        	</c:if>
        </div>
    </div>
    
    <div class="fdboard_mid_bottom">
        <div class="fdboard_mid_pageCount">
            <a href="${path}/board/bf_board/bf_boardList_endDate?page=1">&lt;&lt;</a> &nbsp &nbsp
            <a href="${path}/board/bf_board/bf_boardList_endDate?page=${pageInfo.prvePage}">&lt;</a> &nbsp &nbsp
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<a disabled><u><b><b><c:out value="${status.current}"/></b></b></u></a> &nbsp &nbsp
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<a href="${path}/board/bf_board/bf_boardList_endDate?page=${status.current}"><c:out value="${status.current}"/></a>
					&nbsp &nbsp
   				</c:if>
			</c:forEach>            
      
            <a href="${path}/board/bf_board/bf_boardList_endDate?page=${pageInfo.nextPage}">&gt;</a> &nbsp &nbsp
            <a href="${path}/board/bf_board/bf_boardList_endDate?page=${pageInfo.maxPage}">&gt;&gt;</a>
        </div>
    </div>	
	
<%@ include file="../../common/footer.jsp" %>

