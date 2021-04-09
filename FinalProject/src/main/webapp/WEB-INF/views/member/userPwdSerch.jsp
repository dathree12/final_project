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
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="${path}/css/member/userPwdSerch.css">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
</head>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>   
	    <div class="pwd_serch">
	        <form action="" method="post">
	            <fieldset class="field">
	                <legend>비밀번호 찾기</legend>
	                     <br>
	                     <div class="input_check">
	                         <div class="ck_name"><strong>이름</strong></div>
	                         <input type="text" name="" id="pwdName" class="ck_text" required>
	                    </div>
	                     <div class="input_check">
	                         <div class="ck_name"><strong>아이디</strong></div>
	                         <input type="text" name="" id="pwdId" class="ck_text" required>
	                    </div>
	                     <div class="input_check">
	                         <div class="ck_name"><strong>이메일</strong></div>
	                         <input type="text" name="" id="pwdemail" class="ck_text"required>
	                    </div>
	                     <div class="input_span">
	                        <span>안녕</span>
	                    </div>    
	            </fieldset>
	            <div class="ck_btn_div">
	                <button class="ck_btn" id="ck_btn" type="button">확인</button>
	           	</div>
	       		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">     
	        </form>
	    </div>
	</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>  


<script>
$(function() {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(csrfHeader, csrfToken);
    });
    
    $('#ck_btn').on('click',() => {
 		var name = $("#pwdName").val().trim();
 		var id = $("#pwdId").val().trim();
 		var email = $("#pwdemail").val().trim();
	
			$.ajax({
				type: "post",
				url: "${path}/member/findpw",
				dataType: "json",
				data: {
				 name,
				 id,
				 email
				},
				success: function(data) {
				 alert(data.result);
				},
				error: function(e) {
					console.log(e);
				}				
			});
    });   
}); 

</script>