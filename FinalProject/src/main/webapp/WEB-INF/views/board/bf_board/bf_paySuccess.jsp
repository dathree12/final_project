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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_payCheck.css" type="text/css">
    <title>결제성공 페이지</title>
</head>

<body>
<%@ include file="../../common/header.jsp" %>

	<div class="fd_body">
	    <div class="fd_pay">
	        <h3>북펀딩 프로젝트 책 제목명</h3>
	        <h2>결제가 완료 되었습니다.</h2>
	
	    </div>
	    <br><br>
	    <div class="fd_pay_btn">
	        <a href="${path}/board/bf_board/bf_orderList">주문목록</a>
	        <a href="${path}/">메인페이지</a>
	    </div>
    </div>	
<%@ include file="../../common/footer.jsp" %>
