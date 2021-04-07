<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>       
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>id찾기</title>
    <link rel="stylesheet" href="${path}/css/member/userIdSerch.css">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
</head>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
<section>
    <div class="id_serch">
        <form action="${path}/member/userIdSerch" method="POST">
            <fieldset class="field">
                <legend>아이디 찾기</legend>
                    <div class="radio"> 
                        <span class="radio_ck"><input class="id_check" type="radio" id="email_check" name="id_check" checked><label for="email_check">이메일</label></span>
                        <span class="radio_ck"><input class="id_check" type="radio" id="phone_check" name="id_check"><label for="phone_check">핸드폰 번호</label></span>
                    </div>
                     <br>
                     <div class="input_check">
                         <div class="ck_name"><strong>이름</strong></div>
                         <input type="text" name="" id="" class="ck_text" required>
                    </div>
                     <div class="input_check" id="emailSerch">
                         <div class="ck_name"><strong>이메일 찾기</strong></div>
                         <input type="text" name="" id="" class="ck_text"required>
                    </div>
                   
                     <div class="input_check"  id="phoneSerch" style="display: none">
                        <div class="ck_phone" ><strong>핸드폰 찾기</strong></div>
                        <div class="ck_number"> <input type="text" name="" id="" maxlength="4" >-<input id="" name="" maxlength="4"  type="text" />-<input id="" name="" maxlength="4" type="text" /></div>
                    </div>
            </fieldset>
              <div class="ck_btn_div">
                <button class="ck_btn">확인</button>
            </div> 
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">     
        </form>
    </div>
</section>
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>   
  
<script>
	$(document).ready(() => {
		
		/*이메일 핸드폰 박스 선택*/
		 $('#phone_check').on('click',() => {
			 
			 if ($('#phone_check').is(":checked") == true) {
				 	$('#phoneSerch').css('display','');
					$('#emailSerch').css('display','none');
			}
		});
		 $('#email_check').on('click',() => {
			 
			 if ($('#email_check').is(":checked") == true) {
				 	$('#emailSerch').css('display','');
					$('#phoneSerch').css('display','none');
			}
		});

	});
	
</script>
		
  