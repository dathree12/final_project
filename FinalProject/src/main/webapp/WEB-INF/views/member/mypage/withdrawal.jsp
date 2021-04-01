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
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage_style/profile.css">
</head>
<body>
    
    <section class="profile_wrap">
        <h3 style="text-align: center;">Profile</h3>
    
        <hr>

        <div class="withdrawal">
            <form class="user_withdrawal">
                <h3>회원탈퇴</h3>
                <hr>
                <p style="color: red;">* 정말 탈퇴하시겠습니까?</p>
                <p style="margin-bottom: 70px;">비밀번호를 입력해주세요.</p>
                <label>비밀번호 : <input type="password"></label><br>
               <br><br><br>
               <button class="button" type="submit" style="background-color: black;">회원탈퇴</button>
               <button class="button" style="background-color: white; border: 1px solid darkgray; color: black;">취소</button>
            </form>
        </div>
          
    </section>
</body>
</html>