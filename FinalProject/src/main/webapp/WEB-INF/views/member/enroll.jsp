<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>     
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
	<script src="${path}/js/member/enroll.js"></script>
    <link rel="stylesheet" href="${path}/css/member/enroll.css">
</head>
 
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
	                                          <option value="@nate.com">@nate.com</option>
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
