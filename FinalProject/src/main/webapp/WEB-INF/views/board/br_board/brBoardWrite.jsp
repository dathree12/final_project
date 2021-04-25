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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북리뷰 글쓰기</title>
    <link rel="stylesheet" href="${path}/css/board/br_style/brBoardWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    <script src="${path}/js/jquery-3.5.1.js"></script>
    <script src="${path}/ckeditor/ckeditor.js"></script>
    <!-- bar-rating -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<script src="${path}/css/fontawesome-stars.css"></script>
	<script src="${path}/js/jquery.barrating.min.js"></script>
</head>
<%@ include file="../../common/header.jsp" %>
	 <div class="wrap">
    	<section class="brboard-write">    
	        <section class = "brboard-top">
	            <div class = "brboard-top-title">
	                <a href="${path}/board/br_board/brBoardMain">북리뷰 게시판</a>
	            </div>
	            <div class = "brboard-top-menu">
	               <li><a href="${path}/board/br_board/brBoardMain" style="font-weight:bold">전체</a></li>
		            <li><a href="${path}/board/br_board/brBoardMain1">소설</a></li>
		            <li><a href="${path}/board/br_board/brBoardMain2">어린이/청소년</a></li>
		            <li><a href="${path}/board/br_board/brBoardMain3">경제/경영</a></li>
		            <li><a href="${path}/board/br_board/brBoardMain4">인문/사회/역사</a></li>
		            <li><a href="${path}/board/br_board/brBoardMain5">종교/역학</a></li>
		            <li><a href="${path}/board/br_board/brBoardMain6">자기계발</a></li>
	            </div>
	            <security:authorize access="hasRole('USER')">
					<div class="brboard-top-button">
						<a href="${path}/board/br_board/brBoardWrite" class="write-button">글쓰기</a>
					</div>
				</security:authorize>
	            <hr id="line">
	        </section>
	        <section class ="brboard-write-body">
	            <form action="${ path }/board/br_board/brBoardWrite?${_csrf.parameterName}=${_csrf.token}" method="POST" id="brboardwrite" enctype="multipart/form-data">
	                <p>북리뷰 글쓰기</p>
	                <div class="brboard-write-option">
	                    <p>글제목</p>
	                    <div id="brboard-write-title" >
	                        <input type="text" id="title" name="brTitle" required>
	                    </div>
	                    
						<p>작성자</p>
	                    <div id="brboard-write-writer" >
	                        <input type="text" name="userName" value="${user.userNname}" readonly>
	                        <input name="userNo" value="${user.userNo}" style="display:none" required>
	                    </div>
	                    
	                    <p>책장르</p>
	                    <div id="brboard-write-booktype">
							<input type="radio" id="book-check1" value="b1" name="brBookType"> <label id="radio_text">소설&nbsp;</label> 
							<input type="radio" id="book-check2" value="b2" name="brBookType"> <label id="radio_text">어린이/청소년&nbsp;</label> 
							<input type="radio" id="book-check3" value="b3" name="brBookType"> <label id="radio_text">경제/경영 &nbsp;</label> 
							<input type="radio" id="book-check4" value="b4" name="brBookType"> <label id="radio_text">인문/사회/역사 &nbsp;</label> 
							<input type="radio" id="book-check5" value="b5" name="brBookType"> <label id="radio_text">종교/철학 &nbsp;</label> 
							<input type="radio" id="book-check6" value="b6" name="brBookType"> <label id="radio_text">자기계발 &nbsp;</label> 
						</div>
	
	                    <div id="brboard-write-bookselect">
	                        <span>책선택</span>
 							  <input type="button" value="책검색" onclick="window.open('${path}/board/br_board/bookSearch', '책검색', 'width=500, height=500')">
							  <div id="selectedBook" name="brBookTitle">책을 선택해주세요</div>
							  <input type="text" id="brIsbn" name="brIsbn"  style="display:none">
							  <input id="selectedBookThumb" name="brPresentPic" style="display:none">
	                    </div>
	                    <!-- 
	                    <div id="brboard-write-bookrate">
	                    	<span>평점</span>
		                    	<select id="example">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
						</div>
						 -->
	                </div>
	                <textarea name="brContent" id="brContent"></textarea>
	                <script>
					CKEDITOR.replace( "brContent", {//해당 이름으로 된 textarea에 에디터를 적용
						height: 1000,
						getUploadUrl: type='image',
						filebrowserUploadUrl: '<c:url value="/board/br_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
					});
					</script>
	            
	        </section>
	        <section class="brboard-write-bottom">
	            <a href="${ path }/board/br_board/brBoardMain" id="write-bottom-cancelbtn">취소</a>
				<a id="write-bottom-enrollbtn" onclick="document.getElementById('brboardwrite').submit();">등록</a>
	           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	        </section>
        </form>
    </div>    
    </div>
    <script>
	    $(function() {
	       $('#example').barrating({
	         theme: 'fontawesome-stars'
	        	 , onSelect: function(value, text, event){
	        			// 별점 클릭 후 처리는 여기서 코드
	        			// 선택한 별점 값을 value로 받음
	        		}
	       });
	    });
 	</script>
<%@ include file="../../common/footer.jsp" %>
