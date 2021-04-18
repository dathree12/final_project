<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<!DOCTYPE html>
<<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    
</head>
<body>
	<div class="container">
					<form id="commentListForm" name="commentListForm" method="post">
						<div id="commentList"></div>
					</form>
				</div>
				<div class="comment_textarea">
                        <form id="commentForm" name="commentForm" method="post" class="comment_form">
                            <div class="custom-textarea">
                                <textarea class="comment_body" style="border: 0px; width: auto; outline: none;" name="comContent" id="comContent" rows="1" placeholder="댓글을 남겨주세요"></textarea>
                                <div class="write_button_wrap">
                                    <div class="none"></div>
                                    <div class="write_button">
                                        <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" id="b_code" name="b_code" value="${result.code }" /> 
                        </form>
                    </div>
</body>

</html>