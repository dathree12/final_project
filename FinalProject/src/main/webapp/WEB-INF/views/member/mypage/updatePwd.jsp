<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../../views/common/header.jsp" %>
<link rel="stylesheet" href="${path}/css/member/mypage_style/profile.css">
    <section class="profile_wrap">
	<h3 style="text-align: center; margin: 50px;">Profile</h3>
	<hr>
	<div id="pwd_wrap">
	<div id="updatePassword-container">
		<form target="_self" id="updatePwd" action="${path}/member/updatePwd" name="update" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<br>
			<h3>비밀번호 변경</h3>
            <hr> 
	        <div id="pwd_div" class="div_id">
	             <div class="en_title"><span>비밀번호</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
	             <div class="en_text"><input class="en_table_input" id="userPwd" name="userPwd"  type="password" placeholder="(영문소문자/숫자/특수문자 8~16자)" required"> </div>
	             <div class="en_ck"><span id="pwdck1" style="font-size: 0.7em; color: green;" ></span><span id="pwdck2" style="font-size: 0.7em; color: red;" ></span></div>
	        </div>   
	        <br>    
	        <div class="div_id">
	             <div class="en_title"><span>비밀번호 확인</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
	             <div class="en_text"><input class="en_table_input" id="userPwdCk"   type="password" required> </div>
	             <div class="en_ck"><span></span></div>
	        </div>
	        <br>
	        <br>
			<input class="button" type="submit" id="update" style="background-color: black;" value="변경">
			&nbsp;
			<input class="button" type="button" style="background-color: white; border: 1px solid darkgray; color: black;" value="취소" onclick="location.href='${path}/member/mypage/profile'">
		</form>
	</div>
	</div>
    </section>
<script>
$(function() {
		 
		  /*비밀번호 유효성체크*/
		$("#userPwd").keyup(function() {
			let pwd = $("#userPwd").val();
			var pwdReg = /^[\w\d!@#$%^&*]{8,16}$/;

		    if (!pwdReg.test($("#userPwd").val() )) {
		    	pwdCk ="영문대소문자, 특수문자, 숫자를 포함한 8~16자를 입력하세요.";
				$("#pwdck1").html(" ")
				$("#pwdck2").html(pwdCk)
			}else if(pwd === $("#userId").val()){
				idfail ="아이디를 포함된 비밀번호는 사용하실 수 없습니다.";
				$("#pwdck1").html(" ")
				$("#pwdck2").html(idfail)
			}else{
				pwdOk ="사용가능한 비밀번호 입니다.";
				$("#pwdck1").html(pwdOk)
				$("#pwdck2").html(" ")
				
			}
		});
		  
		$("#update").click(function() {
            $(location).attr('href',"${path}/member/updatePwd");
        });
		
	});
</script>
<%@ include file="../../../views/common/footer.jsp" %>