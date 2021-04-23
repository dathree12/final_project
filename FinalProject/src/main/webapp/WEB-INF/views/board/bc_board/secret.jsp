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
    <script type="text/javascript" src="${ path }/js/club/secret.js"></script>
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
			<h2 style="color: #da6700; font-size: 22px; font-weight: 900; margin: 0; text-align: center; margin-top: 30px;">No. <c:out value="${ propose.proposeNo }"/></h2>
			<p style="margin: auo; text-align: center;">해당 게시물의 비밀번호를 입력해주세요<br> 상세페이지로 이동합니다</p>
		</div>
		<hr style="width: 80%; border: 1px dashed lightgray;">
		<form name="pass" action="${ path }/board/bc_board/secret" method="get" id="pass">
			<div style="margin: auto; text-align: center; margin-top: 30px; line-height: 1px;">
				<label style="width: 83px; vertical-align: middle; font-size: 20px; font-weight: 900;">
					비밀번호<input id="childPwd" name="childPwd" type="password">
				</label></div><br/>
				<input style="visibility: hidden;" id="parentPwd" name="parentPwd" value="${ propose.proposePwd }" type="password"/>
				<input style="visibility: hidden;" id="proposeNo" name="proposeNo" value="${ propose.proposeNo }" type="text"/>
			<div onclick="passButton();" style="text-align: center; width: 280px; height: 40px; border: 1px solid black; margin: auto; padding: 0; border: 1px solid #e1660b; background-color: #e27819; color: #fff; font-size: 14px; font-weight: 900; cursor: pointer; line-height: 40px;">확 인</div>
        </form>
    </div>
</body>
</html>