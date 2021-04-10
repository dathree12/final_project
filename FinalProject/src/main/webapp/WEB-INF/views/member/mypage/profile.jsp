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
    
		<div class="wrap">
        <hr>
        <div class="info">
            <form class="user_info" id="memberFrm" action="${path}/member/update" method="post">
			<security:authentication property="principal" var="user"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input type="hidden" name="userNo" value="${user.userNo}">
            <input type="hidden" id="userId" name="userId" value="${user.userId}">
            <input type="hidden" id="userPwd" name="userPwd" value="${user.userPwd}">
                <table class="info_table">
                    <tr>
                        <th style="width: 30%;">이름</th>
                        <td><input type="text" name="name" readonly value="${user.name }"></td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>닉네임 <span>*</span></th>
                        <td>
                            <input type="text" name="userNname" id="userNname" required value="${user.userNname }">
                            <button class="button" id="checkDuplicate" type="button" style="background-color: black;">중복검사</button>
                            <div class="en_ck"><span id="nameck1" style="font-size: 0.7em; color: green;" ></span><span id="nameck2" style="font-size: 0.7em; color: red;" ></span></div>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>관심분야 <span>*</span></th>
                        <td>
			                <!-- 
			                <c:set var="genrelist" value="소설, 어린이/청소년, 경제/경영, 인문/사회/역사" />
			                <c:forEach var="genrelist" items="${genrelist}">
			                <label><input type="checkbox" name="userGenre" id="Genre0" 
			                <c:forEach var="genre" items="${genre }">
	                            	${genre eq genrelist ? 'checked':''}
	                        </c:forEach>
	                        >${genrelist}</label>&nbsp;
	                        </c:forEach>
			                 -->
			                <c:set var="genre" value="${fn:split(user.userGenre, ',')}" />
                            <label><input type="checkbox" name="userGenre" id="Genre0" 
	                            <c:forEach var="checkGenre" items="${genre }">
	                            	${checkGenre eq '소설' ? 'checked':''}
	                        	</c:forEach>
	                        value="소설">소설</label>&nbsp;
			                <label><input type="checkbox" name="userGenre" id="Genre1"
			                	<c:forEach var="checkGenre" items="${genre }">
                            		${checkGenre eq '어린이/청소년' ? 'checked':''}
                        		</c:forEach>
			                value="어린이/청소년">어린이 / 청소년</label>&nbsp;
			                <label><input type="checkbox" name="userGenre" id="Genre2"
			                	<c:forEach var="checkGenre" items="${genre }">
	                            	${checkGenre eq '경제/경영' ? 'checked':''}
	                        	</c:forEach>
			                value="경제/경영">경제 / 경영</label>&nbsp;<br>
			                <label><input type="checkbox" name="userGenre" id="Genre3"
				                <c:forEach var="checkGenre" items="${genre }">
	                            	${checkGenre eq '인문/사회/역사' ? 'checked':''}
                        		</c:forEach>
			                value="인문/사회/역사">인문 / 사회 / 역사</label>&nbsp;
			                <label><input type="checkbox" name="userGenre" id="Genre4"
			                	<c:forEach var="checkGenre" items="${genre }">
	                            	${checkGenre eq '종교/역학' ? 'checked':''}
                        		</c:forEach>
			                value="종교/역학">종교 / 역학</label>&nbsp;<br>
			                <label><input type="checkbox" name="userGenre" id="Genre5"
			                	<c:forEach var="checkGenre" items="${genre }">
	                            	${checkGenre eq '자기개발' ? 'checked':''}
                        		</c:forEach>
			                value="자기개발">자기개발(ex 요리, 뷰티, 여행)</label>&nbsp;<br>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>이메일 <span>*</span></th>
                        <td><input type="email" placeholder="abc@abc.com" name="userEmail" id="email" required
                        	value="${ user.userEmail }"></td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>전화번호 <span>*</span></th>
                        <td>
                        	<c:set var="phone" value="${user.userPhone }"/>
                            <select class="phone" id="phone1" name="phone">
                                <option value="010" ${fn:substring(phone,0,3) eq '010' ? 'selected':''}>010</option>
                                <option value="011" ${fn:substring(phone,0,3) eq '011' ? 'selected':''}>011</option>
                                <option value="016" ${fn:substring(phone,0,3) eq '016' ? 'selected':''}>016</option>
                                <option value="019" ${fn:substring(phone,0,3) eq '019' ? 'selected':''}>019</option>
                            </select> - 
                            <input class="phone" id="phone2" maxlength="4"  type="text" required value="${fn:substring(phone,4,8) }"> - <input class="phone" id="phone3" maxlength="4"  type="text" value="${fn:substring(phone,9,13) }" required></label>
                            <div class="en_text_phone"><span id="ph1" style="font-size: 0.7em; color: green;" ></span><span id="ph2" style="font-size: 0.7em; color: red;" ></span></div>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>주소 <span>*</span></th>
                        <td><input type="text" name="userAddress" id="address" required value="${user.userAddress}"></td>
                    </tr>
                </table>
                <input type ="hidden" name="userPhone" id="userPhone">
                <br><br><br>
               <button class="button" id="pwd" type="button" onclick="updatePwd();" style="background-color: rgb(141, 133, 133);">비밀번호변경</button>
               <button class="button" id="userinfo" type="submit" style="background-color: black;">정보수정</button>
               <button class="button" type="button" onclick="backto_mypage();" style="background-color: white; color: black; border: 1px solid darkgray;">취소</button>
               <button class="button" type="button" onclick="deleteMember();" id="withdrawal">회원탈퇴</button>
            </form>
        </div>
        </div>
    </section>
    <script type="text/javascript">
            	function backto_mypage() {
            		location.href = "${path}/member/mypage/mypage";
				}
            	function deleteMember() {
            		location.href = "${path}/member/withdrawal";
				}
            	$(function() {
                    var csrfToken = $("meta[name='csrf-token']").attr('content');
                    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
                    $(document).ajaxSend(function (e, xhr, options) {
                        xhr.setRequestHeader(csrfHeader, csrfToken);
                    });
            	// 닉네임 중복 확인
    			$("#checkDuplicate").on("click", () => {
    				
                        
    				let userNname = $("#userNname").val().trim();
    				
    				$.ajax({
    					type: "get",
    					url: "${path}/member/mypage/NnameCheck",
    					dataType: "json",
    					data: {
    						// id(파라미터 키값):id
    						userNname // 파라미터의 키값과 변수명이 동일할 경우
    					},
    					success: function(data) {
    						console.log(data);
    						
    						if(data.validate != true) {
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
    			});
    			});
            /*핸드폰 번호 조합*/
       		$("#userinfo").on("click", () => {
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
    		 
    		 // 비밀번호 변경
    		function updatePwd(){
 			//1 비밀번호 변경창을 열고
 			//2. 비밀번호수정하기
 			
 			const url="${path}/member/newPwd";
 			const st="left=500px,top=200px,width=400px,height=210px";
 			
 			open(url, "_blank", st);
 			}
	</script>
<%@ include file="../../../views/common/footer.jsp" %>