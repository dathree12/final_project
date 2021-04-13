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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북리뷰 글쓰기</title>
    <link rel="stylesheet" href="${ path }/css/board/br_style/brBoardWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    <script src="${ path }/ckeditor/ckeditor.js"></script>

</head>
<%@ include file="../../common/header.jsp" %>
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
	                <a href="${path}/board/br_board/brBoardWrite" class="write-button">글쓰기</a>
	            </div>
	            <hr id="line">
	        </section>
	        <section class ="brboard-write-body">
	            <form action="${ path }/board/br_board/brBoardWrite${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" enctype="multipart/form-data">
	                <p>북리뷰 글쓰기</p>
	                <div class="brboard-write-option">
	                    <p>글제목</p>
	                    <div id="brboard-write-title" >
	                        <input type="text" id="title" name="brTitle" required>
	                    </div>
	                    
						<p>작성자</p>
	                    <div id="brboard-write-writer" >
	                        <input type="text" name="userNname" value="${user.name}" readonly></p>
	                        <p name="userNo" value="${user.userNo}" style="display:invisible" required>
	                    </div>
	                    
	                    <p>책장르</p>
	                    <div id="brboard-write-booktype">
							<input type="radio" id="book-check1" value="b1" name="brBookType"> <label id="radio_text">소설&nbsp;</label> 
							<input type="radio" id="book-check2" value="b2" name="brBookType"> <label id="radio_text">어린이/청소년&nbsp;</label> 
							<input type="radio" id="book-check3" value="b3" name="brBookType"> <label id="radio_text">경제/경영 &nbsp;</label> 
							<input type="radio" id="book-check4" value="b4" name="brBookType"> <label id="radio_text">인문/사회/역사 &nbsp;</label> 
							<input type="radio" id="book-check5" value="b5" name="brBookType"> <label id="radio_text">종교/철학 &nbsp;</label> 
							<input type="radio" id="book-check6" value="b6" name="brBookType"> <label id="radio_text">자기개발 &nbsp;</label> 
						</div>
	
	                    <div id="brboard-write-bookselect">
	                        <span>책선택</span>
 							  <input type="button" value="책검색" onclick="window.open('${path}/board/br_board/bookSearch', '책검색', 'width=500, height=500')">
							  <div id="selectedBook" name="brBookTitle">책을 선택해주세요</div>
							  <p id="bookIsbn" name="brIsbn" style="display:none"></p>
							  <div id="selectedBookThumb" name="brPresentPic" style="display:none"></div>
	                    </div>
	                </div>
	                <textarea name="ckeditor" id="ckeditor"></textarea>
	                <script>
					CKEDITOR.replace( "ckeditor", {//해당 이름으로 된 textarea에 에디터를 적용
						height: 1000,
						getUploadUrl: type='image',
						filebrowserUploadUrl: '<c:url value="/board/br_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
							

					});
					CKEDITOR.editorConfig = function( config ) { config.filebrowserUploadUrl = '/board/br_board/brBoardWrite'; };
					</script>
	                <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
	            </form>
	        </section>
        <section class="brboard-write-bottom">
            <a href="${ path }/board/br_board/brBoardMain" id="write-bottom-cancelbtn">취소</a>
            <input type="submit" id="write-bottom-enrollbtn" value="등록">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </section>
    </div>    
    </div>
    
  <!--  
    <script>
    $("#title").keyup((e) => {
		let Nname = $(e.target).val().trim();
	    var nickReg = /^[가-힣a-zA-Z]{2,11}$/;
		
	    if (!nickReg.test($("#title").val() )) {
	    	nickCk ="영문대소문자, 한글을 포함한 2~12글자를 입력하세요.";
			$("#nameck1").html(" ")
			$("#nameck2").html(nickCk)
		}else {
		    $.ajax({
				type: "get",
				url: "${path}/member/NnameCheck",
				dataType: "json",
				data: {
					Nname
				},
				success: function(data) {
					console.log(data);
					
					if(data.validate !== true) {
						result ="사용 가능한 닉네임 입니다.";
						$("#nameck1").html(result)
						$("#nameck2").html(" ")
					} else {
						result ="이미 사용중인 닉네임 입니다.";	
						$("#nameck2").html(result)
						$("#nameck1").html(" ")
					}
				
				},
				error: function(e) {
					console.log(e);
				}				
			});
		}
	});
    
    </script>
    -->
    

<%@ include file="../../common/footer.jsp" %>
