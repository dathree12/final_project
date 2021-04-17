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
    <meta content="${ _csrf.token }" name="csrf-token"/>
    <meta content="${ _csrf.headerName }" name="csrf-headerName">
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    <title>Document</title>
    <style>
        .secret-form {
			margin: auto;
			height: 100%;
			width: 100%;
        }
    </style>
</head>
<body>
    <div class="secret-form">
		<div>
			<h2 style="color: #da6700; font-size: 22px; font-weight: 900; margin: 0; text-align: center; margin-top: 30px;">No. 32</h2>
			<p style="margin: auo; text-align: center;">해당 게시물의 비밀번호를 입력해주세요<br> 상세페이지로 이동합니다</p>
		</div>
		<hr style="width: 80%; border: 1px dashed lightgray;">
		<form name="frm" action="${ path }/board/bc_board/bcBoardList" method="get" id="post_form">
			<div style="margin: auto; text-align: center; margin-top: 30px; line-height: 1px;"><label style="width: 83px; vertical-align: middle; font-size: 20px; font-weight: 900;">비밀번호<input id="secretPwd" name="secretPwd" type="password" style="height: 30px; margin-left: 30px; border: 1px solid #d4d6d6;"></label></div>
			<br/>
			<div style="text-align: center;"><input name="pass" type="button" style="border: 1px solid #e1660b; background-color: #e27819; width: 280px; height: 40px; color: #fff; font-size: 14px; font-weight: 900; margin: auto; margin-left: 10px;" value="확 인" onclick="setChildText();"></div>
        </form>
    </div>
    
    <script>
    	function setChildText() {
        	// 자식창 : 부모창에 값을 넘긴다.
        	var a = document.querySelector('input[name="secretPwd"]').value;
        	opener.document.getElementById("secretPwd").value = a;
        };
    </script>
</body>
</html>