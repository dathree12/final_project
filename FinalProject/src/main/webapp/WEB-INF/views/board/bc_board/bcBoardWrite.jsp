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
    <title>제안서작성</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    <script src="${ path }/ckeditor/ckeditor.js"></script>
</head>
<body style="height: auto;">
    <section class="propose-write-section-1th">
        <article class="propose-write-article-1th">
            <div class="write-header">
                <div class="board-name">북 클럽 제안서 작성</div>
                <div class="write-btn">
	                	<input type="submit">
	                    <a href="${ path }/board/bc_board/bcBoardList">취소</a>
	                    <a href="#">작성</a>
	                </form>
                </div>
            </div>
        </article>
    </section>
    <section class="propose-write-section-2th">
        <article class="propose-write-article-2th" style="min-height: 600px;">
            <form action="${ path }/board/bc_board/bcBoardWrite?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" enctype="multipart/form-data">
            	<input type="submit">
                <div class="board_summary">
                    <div class="left">
                        <div class="avatar">
                            <img alt="프로필 이미지" src="https://cdn.imweb.me/thumbnail/20161214/5850d6a2c09a8.jpg" class="avatar-image">
                        </div>
                        <div class="author">
		              		<security:authentication property="principal" var="user"/> 
		                    <input style="border: none; margin-top: 10px" id="post_subject" class="post_subject" name="userName" value="${ user.name }" type="text" readonly>
		                    <input style="visibility: hidden;" type="text" name="userNo" value="${ user.userNo }" readonly>
		                    <input style="visibility: hidden;" type="text" name="userId" value="${ user.userId }" readonly>
                        </div>
                    </div>
                </div>
                <div class="editor_box">
                    <span>
                        <input name="proposePwd" class="basic_input" type="password" value="${ list.proposePwd }" placeholder="비밀번호">
                    </span>
                </div>
                <div class="table-cell">
                    <input id="post_subject" class="post_subject" name="proposeTitle" value="${ list.proposeTitle }" placeholder="제목" type="text">
                </div>
                <textarea name="bcContent" id="bcContent" rows="10" cols="80"></textarea>
   	                <script src="${ path }/js/club/bcBoardWrite.js"></script>
	                <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
            </form>
        </article>
    </section>
<%@ include file="../../common/footer.jsp" %>