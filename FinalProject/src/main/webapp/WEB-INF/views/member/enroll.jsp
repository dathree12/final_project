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
                             <div class="id_text"><input class="en_table_input" id="userId" name="userId"  type="text" placeholder="(영문소문자/숫자, 4~10자)"  required></div>
                             <div class="id_ck"> <input type="button" id="" value="아이디 중복검사" > <span></span></div>
                        </div>       
                        <br>
                        <div class="div_id">
                             <div class="en_title"><span>닉네임</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                             <div class="id_text"><input class="en_table_input" id="userNname" name="userNname"  type="text" required></div>
                             <div class="id_ck"> <input type="button" id="" value="닉네임 중복검사" ></div>
                        </div>   
                        <br>    
                        <div class="div_id">
                             <div class="en_title"><span>비밀번호</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                             <div class="en_ck"><input class="en_input" id="userPwd" name="userPwd"  type="password" placeholder="(영문소문자/숫자, 4~10자)" required> </div>
                             <div class="en_text"><span></span></div>
                        </div>   
                        <br>    
                        <div class="div_id">
                             <div class="en_title"><span>비밀번호 확인</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                             <div class="en_ck"><input class="en_input" id="userPwdCk"   type="password" required> </div>
                             <div class="en_text"><span></span></div>
                        </div>       
                 
                        <br>    
                        <div class="div_id">
                             <div class="en_title"><span>이름</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                             <div class="en_ck"><input class="en_input" id="userName" name="userName"  type="text" required> </div>
                             <div class="en_text"><span></span></div>
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
                                <label class="en_label"><input type="checkbox" name="userGenre" id="Genre5" value="자기개발">자기개발 (요리 / 뷰티 / 자격증 / 여행...)</label> &nbsp;&nbsp;</div>
                               <div class="genre_text"><span></span></div>
                        </div>
                        <br>
                        <div class="div_id">
                            <div class="en_title"><span>이메일</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                            <div class="en_email">
                                <input class="en_input" id="Email1"  type="text" required> 
                                &nbsp;&nbsp;&nbsp;
                                <select id="Email2" class="mail_select">
                                    <option value="@naver.com">@naver.com</option>
                                    <option value="@gmail.com">@gmail.com</option>
                                    <option value="@daum.net">@daum.net</option>
                                    <option value="@daum.net">@nate.net</option>
                                    <option value="">직접 작성</option>
                                </select>
                            </div>
                            <div class="mail_text"><span></span></div>
                       </div>
                       <br>    
                       <div class="div_id">
                            <div class="en_title"><span>휴대전화</span> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="" alt="필수"/></div>
                            <div class="phone_ck">
                            <select id="phone1"  style="width: 60px; height: 31px;">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="019">019</option>
                            </select> - <input  class="en_input_phone" id="phone2" maxlength="4"  type="text" /> - <input class="en_input_phone" id="phone3" maxlength="4"  type="text" />  </div>
                            <div class="en_text_phone"><span></span></div>
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
                        
            <br><br><br>
            <div id="en_btn_div">
                <button class="en_btn" id="en_btn" type="submit" value="회원가입"  >회원가입</button>
                &nbsp;&nbsp;&nbsp;&nbsp;   
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="en_btn" id="en_cancle" >취소하기</button>
            </div>

			</form>
		</div>
     </section>
     
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  
  <script>
  $(document).ready(() => {
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
	  
	  $("#phone3").blur((e) => {
		  var phone1 = $("#phone1").val();
		  var phone2 = $("#phone2").val();
		  var phone3 = $("#phone3").val();
		  
		  $("#userPhone").val(phone1 + '-' +  phone2 + '-' + phone3);
  
	  });
	  
	  $("#Email2").blur((e) => {
		  var Email1 = $("#Email1").val();
		  var Email2 = $("#Email2").val();
	
		  $("#userEmail").val(Email1 + Email2);
  
	  });
	  
		/* 취소하기*/
		 $('#en_cancle').on('click',() => {

			  if(confirm("정말로 취소하시겠습니까?")){
					
				  location.replace("${path}/");
			  }
			 
		});
		  
  });
  </script>