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
    <meta content="${ _csrf.token }" name="csrf-token"/>
    <meta content="${ _csrf.headerName }" name="csrf-headerName">
    <title>id찾기</title>
    <link rel="stylesheet" href="${path}/css/member/userIdSerch.css">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
</head>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section>
        <div class="id_serch">
            <form action="${path}/member/userIdSerch" method="post">
                <fieldset class="field">
                    <legend>아이디 찾기</legend>
                        <div class="radio"> 
                            <span class="radio_ck"><input class="id_check" type="radio" id="email_check" name="id_check" checked><label for="email_check">이메일</label></span>
                            <span class="radio_ck"><input class="id_check" type="radio" id="phone_check" name="id_check"><label for="phone_check">핸드폰 번호</label></span>
                        </div>
                         <br>
                         <div class="input_check">
                             <div class="ck_name"><strong>이름</strong></div>
                             <input type="text" name="serchName" id="serch_name" class="ck_text" required>
                        </div>
                         <div class="input_check" id="emailSerch">
                             <div class="ck_name"><strong>이메일 찾기</strong></div>
                             <input type="text"  name="serchEmail" id="serch_email" class="ck_text"required>
                        </div>
                       
                         <div class="input_check"  id="phoneSerch" style="display: none">
                            <div class="ck_phone" ><strong>핸드폰 찾기</strong></div>
                            <div class="ck_number"> <input type="text"  id="phone1" maxlength="3" required/>-<input id="phone2"  maxlength="4"  type="text" required/>-<input id="phone3" maxlength="4" type="text" required/></div>
                        </div>
                        <br>
                        <div class="input_span">
                            <span class="idresult" id="idresult1" ></span><span class="idresult" id="idresult2" ></span>
                        </div>
                    </fieldset>
                      <br>
                    <div class="ck_btn_div"> 
                       <button class="ck_btn" id="serch_btn" type="button" >확인</button>
                 	</div>
	           		<br> 
		            <div class="ck_btn_div">
		                <button class="ck_btn"  type="button" onclick="location.href=('${path}/member/login')">로그인</button>
		           	</div> 
                
                <input type="hidden"  id="serch_phone"/>
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
		 
		 
		 $('#serch_btn').on('click',() => {
		 		var name = $("#serch_name").val().trim();
		 		var email = $("#serch_email").val().trim();
		 		var phone1 = $("#phone1").val();
			    var phone2 = $("#phone2").val();
			    var phone3 = $("#phone3").val();
				$("#serch_phone").val(phone1 + '-' +  phone2 + '-' + phone3);
		 		var phone = $("#serch_phone").val().trim();
	
		 		if ($('#email_check').is(":checked") == true) {
					$.ajax({
						type: "post",
						url: "${path}/member/serchIdEmail",
						dataType: "json",
						data: {
						 name, 
						 email
						},
						success: function(data) {
							if (data.result != null) {
								$("#idresult1").html(name + '님의 아이디는 ' + data.result +'입니다.')
								$("#idresult2").html(' ')
							}else{
								fail = '가입된 아이디가 없습니다. 다시 입력해주세요'
								$("#idresult1").html(' ')
								$("#idresult2").html(fail)								
							}	
						},
						error: function(e) {
							console.log(e);
						}				
					});
				}else if ($('#phone_check').is(":checked") == true){
					$.ajax({
						type: "post",
						url: "${path}/member/serchIdPhone",
						dataType: "json",
						data: {
						 name, 
						 phone
						},
						success: function(data) {
							if (data.result != null) {
								$("#idresult1").html(name + '님의 아이디는 ' + data.result +'입니다.')
								$("#idresult2").html(' ')
							}else{
								fail = '가입된 아이디가 없습니다. 다시 입력해주세요'
								$("#idresult1").html(' ')
								$("#idresult2").html(fail)								
							}	
						},
						error: function(e) {
							console.log(e);
						}				
					});
				}else{
					alert('이메일, 핸드폰번호 찾기 중 선택해주세요.')
				}
		
		 	});
		 	 

	});
	
</script>
		
  