<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>       
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>id찾기</title>
    <link rel="stylesheet" href="${path}/css/member/userIdSearch.css">
	<script src="${path}/js/member/search.js"></script>
</head>
    <section>
        <div class="id_search">
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
                             <input type="text" name="searchName" id="search_name" class="ck_text" required>
                        </div>
                         <div class="input_check" id="emailSearch">
                             <div class="ck_name"><strong>이메일 찾기</strong></div>
                             <input type="text"  name="searchEmail" id="search_email" class="ck_text"required>
                        </div>
                       
                         <div class="input_check"  id="phoneSearch" style="display: none">
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
                       <button class="ck_btn" id="search_btn" type="button" >확인</button>
                 	</div>
	           		<br> 
		            <div class="ck_btn_div">
		                <button class="ck_btn"  type="button" onclick="location.href=('${path}/member/login')">로그인</button>
		           	</div> 
                
                <input type="hidden"  id="search_phone"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">     
            </form>
        </div>
    </section>
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>   
  
  