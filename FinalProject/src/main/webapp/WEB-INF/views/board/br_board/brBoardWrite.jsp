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
    <title>북리뷰 글쓰기</title>
    <link rel="stylesheet" href="${ path }/css/board/br_style/brBoardWrite.css" type="text/css">
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
	                <a href="#" class="write-button">글쓰기</a>
	            </div>
	            <hr id="line">
	        </section>
	        <section class ="brboard-write-body">
	            <form action="test" method="GET">
	                <p>북리뷰 글쓰기</p>
	                <div class="brboard-write-option">
	                    <p>글제목</p>
	                    <div id="brboard-write-title">
	                        <input type="text" id="title" name="title" required>
	                    </div>
	
	                    <p>책장르</p>
	                    <div id="brboard-write-booktype">
							<input type="radio" id="book-check" value="b1" name="booktype"> <label id="radio_text">소설&nbsp;</label> 
							<input type="radio" id="book-check" value="b2" name="booktype"> <label id="radio_text">어린이/청소년&nbsp;</label> 
							<input type="radio" id="book-check" value="b3" name="booktype"> <label id="radio_text">경제/경영 &nbsp;</label> 
							<input type="radio" id="book-check" value="b4" name="booktype"> <label id="radio_text">인문/사회/역사 &nbsp;</label> 
							<input type="radio" id="book-check" value="b5" name="booktype"> <label id="radio_text">종교/철학 &nbsp;</label> 
							<input type="radio" id="book-check" value="b6" name="booktype"> <label id="radio_text">자기개발 &nbsp;</label> 
						</div>
	
	                    <div id="brboard-write-bookselect">
	                        <span>책선택</span>
	                        <span id="bookfindbtn"><a href="#"/>책찾기</span>
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
