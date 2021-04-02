<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../../views/common/header.jsp" %>
<link rel="stylesheet" href="${path}/css/member/mypage_style/profile.css">
    <section class="profile_wrap">
        <h3 style="text-align: center; margin: 50px;">Profile</h3>
    
        <div class="wrap">
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
        </div>
    </section>
<%@ include file="../../../views/common/footer.jsp" %>