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
    <title>회원가입</title>
    <link rel="stylesheet" href="${path}/css/member/enroll.css">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>   
 <section>
          <h1 id="en_top">회원 가입</h1>
      
           <hr>
               <div class="en-container">
                  <br><br>
                  <form action="${path}/member/enroll" method="POST" name="memberEnroll" >
                  <div id="en_div">     
                              <div class="div_id">
                                   <div class="en_title"><span>아이디</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                   <div class="en_text"><input class="en_table_input" id="userId" name="userId"  type="text" placeholder="(영문소문자/숫자, 5~12자)"  required></div>
                                   <div class="en_ck"><span id="idck1" style="font-size: 0.7em; color: green;" ></span><span id="idck2" style="font-size: 0.7em; color: red;" ></span> </div>
                              </div>       
                              <br>
                              <div class="div_id">
                                   <div class="en_title"><span>닉네임</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                   <div class="en_text"><input class="en_table_input" id="userNname" name="userNname"  type="text"  placeholder="(영문대소문자/한글 2~12자)"  required></div>
                                   <div class="en_ck"><span id="nameck1" style="font-size: 0.7em; color: green;" ></span><span id="nameck2" style="font-size: 0.7em; color: red;" ></span></div>
                              </div>   
                              <br>    
                              <div class="div_id">
                                   <div class="en_title"><span>비밀번호</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                   <div class="en_text"><input class="en_table_input" id="userPwd" name="userPwd"  type="password" placeholder="(영문소문자/숫자/특수문자 8~16자)" required> </div>
                                   <div class="en_ck"><span id="pwdck1" style="font-size: 0.7em; color: green;" ></span><span id="pwdck2" style="font-size: 0.7em; color: red;" ></span></div>
                              </div>   
                              <br>    
                              <div class="div_id">
                                   <div class="en_title"><span>비밀번호 확인</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                   <div class="en_text"><input class="en_table_input" id="userPwdCk"   type="password" required> </div>
                                   <div class="en_ck"><span></span></div>
                              </div>       
                       
                              <br>    
                              <div class="div_id">
                                   <div class="en_title"><span>이름</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                   <div class="en_text"><input class="en_table_input" id="name" name="name"  type="text" placeholder="(한글로 2자 이상)" required> </div>
                                   <div class="en_ck"><span id="name1" style="font-size: 0.7em; color: green;" ></span><span id="name2" style="font-size: 0.7em; color: red;" ></span></div>
                              </div>
                              <br>
                              <div class="div_id">
                                   <div class="en_title"><span>관심장르</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                   <div class="en_genre">   
                                      <label class="en_label"><input type="checkbox" name="userGenre" id="Genre0" value="소설">소설</label> &nbsp;&nbsp;
                                      <label class="en_label"><input type="checkbox" name="userGenre" id="Genre1" value="어린이/청소년">어린이 / 청소년</label>&nbsp;&nbsp;
                                      <label class="en_label"><input type="checkbox" name="userGenre" id="Genre2" value="경제/경영">경제 / 경영</label> <br><br>
                                      <label class="en_label"><input type="checkbox" name="userGenre" id="Genre3" value="인문/사회/역사">인문 / 사회 / 역사</label> &nbsp;&nbsp;
                                      <label class="en_label"><input type="checkbox" name="userGenre" id="Genre4" value="종교/역학">종교 / 역학</label> <br><br> 
                                      <label class="en_label"><input type="checkbox" name="userGenre" id="Genre5" value="자기개발">자기개발 (요리 / 뷰티 / 자격증 / 여행...)</label> &nbsp;&nbsp;
                                   </div>
                                   <div class="genre_text"><span></span></div>
                              </div>
                              <br>
                              <div class="div_id">
                                  <div class="en_title"><span>이메일</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                  <div class="en_email">
                                      <input class="en_input" id="Email1"  type="text"  placeholder="(영문대소문자/숫자 6~16자)" required> 
                                      &nbsp;&nbsp;&nbsp;
                                      <select id="Email2" class="mail_select">
                                          <option value="@naver.com">@naver.com</option>
                                          <option value="@gmail.com">@gmail.com</option>
                                          <option value="@daum.net">@daum.net</option>
                                          <option value="@daum.net">@nate.net</option>
                                          <option value="">직접 작성</option>
                                      </select>
                                  </div>
                                  <div class="mail_text"><span id="mail1" style="font-size: 0.7em; color: green;" ></span><span id="mail2" style="font-size: 0.7em; color: red;" ></span></div>
                             </div>
                             <br>    
                             <div class="div_id">
                                  <div class="en_title"><span>휴대전화</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                  <div class="phone_ck">
                                  <select id="phone1">
                                      <option value="010">010</option>
                                      <option value="011">011</option>
                                      <option value="016">016</option>
                                      <option value="019">019</option>
                                  </select> - <input  class="en_input_phone" id="phone2" maxlength="4"  type="text" required/> - <input class="en_input_phone" id="phone3" maxlength="4"  type="text" required />  </div>
                                  <div class="en_text_phone"><span id="ph1" style="font-size: 0.7em; color: green;" ></span><span id="ph2" style="font-size: 0.7em; color: red;" ></span></div>
                             </div>
                              
                             <br>    
                             <div class="div_id">
                                  <div class="en_title"><span>주소지</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                                  <div class="en_adress"><input class="en_input_ad" id="userAddress" name="userAddress"  type="text" required> </div>
                                  <div class="en_text_ad"><span></span></div>
                             </div>
                                       <input type ="hidden" name="userPhone" id="userPhone">
                                       <input type ="hidden" name="userEmail" id="userEmail">
                                       <input type ="hidden" name="userAgreement" value="Y">
                                       <input type ="hidden"  id="" >
                                       <input type ="hidden"  id="nameck">
                              
                  <br><br><br>
                  <div id="en_btn_div">
                      <button class="en_btn" id="en_btn" type="submit" value="회원가입"  >회원가입</button>
                      &nbsp;&nbsp;&nbsp;&nbsp;   
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <button class="en_btn" id="en_cancle" >취소하기</button>
                  </div>
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                     </form>
                </div>
           </section>
     
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  
  <script>
  $(document).ready(() => {
	  
	 	/*아이디 체크*/
	 	$("#userId").keyup((e) => {
	 		let id = $(e.target).val().trim();
			var idReg = /^[a-z][a-z\d]{4,11}$/g;
			
			
			if (!idReg.test($("#userId").val() )) {
				lengthCk ="영문자로 시작하여 소문자, 숫자를 포함한 5~12자로 기입해주세요.";
				$("#idck1").html(" ")
				$("#idck2").html(lengthCk)
			}else{
				$.ajax({
					type: "get",
					url: "${path}/member/idCheck",
					dataType: "json",
					data: {
						id
					},
					success: function(data) {
						console.log(data);
						
						if(data.validate !== true) {
						
							result ="사용 가능한 아이디 입니다.";
							$("#idck1").html(result)
							$("#idck2").html(" ")
						} else {
							result ="이미 사용중인 아이디 입니다.";	
							$("#idck2").html(result)
							$("#idck1").html(" ")
						}
					
					},
					error: function(e) {
						console.log(e);
					}				
				});
			}	
	 	});
	 	
	 	
	 	/*닉네임 중복*/
		$("#userNname").keyup((e) => {
			let Nname = $(e.target).val().trim();
		    var nickReg = /^[가-힣a-zA-Z]{2,11}$/;
			
		    if (!nickReg.test($("#userNname").val() )) {
		    	nickCk ="영문대소문자, 한글을 포함한 2~12글자를 입력하세요.";
				$("#nameck1").html(" ")
				$("#nameck2").html(nickCk)

			}else {
			    $.ajax({
					type: "get",
					url: "${path}/member/NnameCheck",
					dataType: "json",
					data: {
						Nname
					},
					success: function(data) {
						console.log(data);
						
						if(data.validate !== true) {
							result ="사용 가능한 닉네임 입니다.";
							$("#nameck1").html(result)
							$("#nameck2").html(" ")
						} else {
							result ="이미 사용중인 닉네임 입니다.";	
							$("#nameck2").html(result)
							$("#nameck1").html(" ")
						}
					
					},
					error: function(e) {
						console.log(e);
					}				
				});
			}
		});
	  
	  
		  /*비밀번호 체크*/
		$("#userPwdCk").blur((e) => {
			let pass1 = $("#userPwd").val();
			let pass2 = $(e.target).val();
			if(pass1.trim() != pass2.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPwd").val("");
				$(e.target).val("");
				$("#userPwd").focus();
			}
		});	
		  
		  /*비밀번호 유효성체크*/
		$("#userPwd").keyup((e) => {
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
		  
		/*이름 유효성 검사 */  
		$("#name").keyup((e) => {
			var nameReg =  /^[가-힣]{2,}$/;

			if( !nameReg.test( $("#name").val() ) ) {
				namefail ="한글로 2글자 이상 입력해주세요";
				$("#name1").html(" ")
				$("#name2").html(namefail)
				
			}else{
				nameok ="사용가능한 이름 입니다.";
				$("#name1").html(nameok)
				$("#name2").html(" ")
			}
			
		});
		  
		
		 
		 /*이메일 유효성 검사*/
		 $("#Email1").keyup((e) => {
			var emailck = /^[\w\d]{6,16}$/;
			if( emailck.test( $("#Email1").val() ) ) {
				emailok ="유요한 이메일주소입니다.";
				$("#mail1").html(emailok)
				$("#mail2").html(" ")
			}else{
				emailfail ="영문대소문자/ 숫자를 포함한 6~16자를 입력해주세요.";
				$("#mail1").html(" ")
				$("#mail2").html(emailfail)
			}
		 
		 });
		 
		  /*이메일 조합.*/
		 $("#en_btn").on("click", () => {
				var Email1 = $("#Email1").val();
			 	var Email2 = $("#Email2").val();
			 	
			  	$("#userEmail").val(Email1 + Email2);
	  
		 });
		  
		 
	  
	  /*핸드폰 번호 조합*/
		 $("#en_btn").on("click", () => {
			var phone1 = $("#phone1").val();
		    var phone2 = $("#phone2").val();
		    var phone3 = $("#phone3").val();
		    
			$("#userPhone").val(phone1 + '-' +  phone2 + '-' + phone3);
  
	  	});
	  
	  	/*핸드폰 유효성*/
		 $("#phone2").blur((e) => {
			 var phone2Reg = /^[0-9]{4}$/;
			 var phone3Reg = /^[0-9]{4}$/;

			 if (!phone2Reg.test( $("#phone2").val()) || !phone3Reg.test( $("#phone3").val())) {
				 	phonefail =  "숫자를 입력하세요.";
					$("#ph1").html(" ")
					$("#ph2").html(phonefail)
			 }else{
				 	phoneok = "사용 가능합니다.";
					$("#ph1").html(phoneok)
					$("#ph2").html(" ")
			 }
			 
		  });
	  	
		 $("#phone3").blur((e) => {
			 var phone2Reg = /^[0-9]{4}$/;
			 var phone3Reg = /^[0-9]{4}$/;

			 if (!phone2Reg.test( $("#phone2").val()) || !phone3Reg.test( $("#phone3").val())) {
				 	phonefail =  "숫자를 입력하세요.";
					$("#ph1").html(" ")
					$("#ph2").html(phonefail)
			 }else{
				 	phoneok = "사용 가능합니다.";
					$("#ph1").html(phoneok)
					$("#ph2").html(" ")
			 }
			 
		  });
		 
		 /*회원가입시 공란 체크*/
		 $("#en_btn").on("click", () => {
			 
			 	var userid =$('#userId').val();
			    if(userid == '') {   	
	
			    	 alert('아이디를 입력해주세요.');
				        return false;
			    }
			 	var usernname =$('#userNname').val();
			    if(usernname == '') {   	
	
			    	 alert('닉네임을 입력해주세요.');
				        return false;
			    }
			 	var username =$('#userName').val();
			    if(username == '') {   	
	
			    	 alert('이름을 입력해주세요.');
				        return false;
			    }

			   if ( $('#Genre0').is(":checked") == false && 
					$('#Genre1').is(":checked") == false && 
					$('#Genre2').is(":checked") == false && 
					$('#Genre3').is(":checked") == false && 
					$('#Genre4').is(":checked") == false && 
					$('#Genre5').is(":checked") == false) {
				       	
				       	alert("관심 장르를 선택해주세요");
				    	return false;
			   }
			   
			   var useremail =$('#Email1').val();
			    if(useremail == '') {   	
	
			    	 alert('이메일을 입력해주세요.');
				        return false;
			    }
			
			    var mobile2 =$('#phone2').val();
			    if(mobile2 == '') {   	
	
			    	 alert('번호를 입력해주세요.');
				        return false;
			    }
			    
			    var mobile3 = $('#phone3').val;
			    if(mobile3 == '') {   	
	
			    	 alert('번호를 입력해주세요.');
				        return false;
			    }
			    var address = $('#userAddress').val;
			    if(address == '') {   	
	
			    	 alert('주소를 입력해주세요');
				        return false;
			    }
		 });
	  
		/* 취소하기*/
		$('#en_cancle').on('click',() => {
			 if(confirm("정말로 취소하시겠습니까?")){
				 location.replace("${path}/");
			  }
		});
		  
	});
  </script>