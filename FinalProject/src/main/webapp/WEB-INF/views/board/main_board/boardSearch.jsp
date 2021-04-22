<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="../../common/header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
  
    <title>Document</title>
     <link rel="stylesheet" href="${ path }/css/board/main_style/boardSearch.css">
</head>     
<section>
    <div class="serch_container">
    <c:forEach var="board" items="${list}">
        <div class="serch_div">
        <c:choose>
			<c:when test="${board.boardType eq 'b1'}"><h5>게시물 > book 리뷰 > 소설</h5> 
				<a href="${path}/board/br_board/brReviewDetail?brNo=${board.boardNo}">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
            </c:when>
			<c:when test="${board.boardType eq 'b2'}"><h5>게시물 > book 리뷰 > 어린이/청소년</h5> 
				<a href="${path}/board/br_board/brReviewDetail?brNo=${board.boardNo}">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:when>
			<c:when test="${board.boardType eq 'b3'}"><h5>게시물 > book 리뷰 > 경영/경제</h5> 
				<a href="${path}/board/br_board/brReviewDetail?brNo=${board.boardNo}">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:when>
			<c:when test="${board.boardType eq 'b4'}"><h5>게시물 > book 리뷰 > 인문/사회/역사</h5> 
				<a href="${path}/board/br_board/brReviewDetail?brNo=${board.boardNo}">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:when>
			<c:when test="${board.boardType eq 'b5'}"><h5>게시물 > book 리뷰 > 종교/역학</h5> 
				<a href="${path}/board/br_board/brReviewDetail?brNo=${board.boardNo}">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:when>
			<c:when test="${board.boardType eq 'b6'}"><h5>게시물 > book 리뷰 > 자기개발</h5> 
				<a href="${path}/board/br_board/brReviewDetail?brNo=${board.boardNo}">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:when>
			<c:when test="${board.boardType eq 'Y'}"><h5>게시물 > 북클럽</h5> 
				<a href="">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:when>
			<c:otherwise><h5>게시물 > 북펀딩</h5>  
				<a href="">
		            <span>${board.title }</span>
		            <br>
		            <p class="searchP">${board.content }</p>
		            <h6><fmt:formatDate pattern="yy년 MM월 dd일" value="${board.boardDate }"/> </h6>
	            </a>
			</c:otherwise>
		</c:choose>
            </div>
      </c:forEach>
            <div class="pageBar">
                <a href="${path}/board/main_board/boardSearch?page=1&nav_keyword=${search}" class="first">&lt;&lt;</a>&nbsp &nbsp
                <a href="${path}/board/main_board/boardSearch?page=${pageInfo.prvePage}&nav_keyword=${search}" class="prev">&lt;</a>&nbsp &nbsp
                	<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<a disabled><u><b><b><c:out value="${status.current}"/></b></b></u></a> &nbsp &nbsp
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<a href="${path}/board/main_board/boardSearch?page=${status.current}&nav_keyword=${search}"><c:out value="${status.current}"/></a>
					&nbsp &nbsp
   				</c:if>
			</c:forEach>  
                <a href="${path}/board/main_board/boardSearch?page=${pageInfo.nextPage}&nav_keyword=${search}" class="next">&gt;</a> &nbsp &nbsp
                <a href="${path}/board/main_board/boardSearch?page=${pageInfo.maxPage}&nav_keyword=${search}" class="last">&gt;&gt;</a>
            </div>
    </div>
</section>  
<%@ include file="../../common/footer.jsp" %>  

