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
    <title>로그인</title>
    <link rel="stylesheet" href="${path}/css/member/login.css">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="${path}/js/jquery-3.5.1.js"></script>
</head>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>   
 <section>
    <div class="login">
        <form method="POST" action="${path}/login">
            <div class="logo_div">
                <img src="${path}/images/head-logo.png" alt="" class="login_logo">
            </div>
                <h3>회원로그인</h3>
            <div class="input_div">
                <div class="input_text">
                    <input type="text" id="userId" name="userId" placeholder="아이디">
                    <br>
                    <input type="password" id="userPwd" name="userPwd"  placeholder="비빌번호">
                </div>
                <div class="input_btn">
                    <button type="submit">로그인</button>
                </div>
            </div>
    	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>   
            <br>
            <div class="check_div">
                <input type="checkbox"> <span>아이디 저장</span>
            </div>
            
       
            <div class="btn_div">
                <button type="button" onclick="location.href=('${path}/member/enrollTerms')">회원가입</button>
                <button>아이디 찾기</button>
                <button>비밀번호 찾기</button>
            </div>
    </div>
  </section> 
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>   