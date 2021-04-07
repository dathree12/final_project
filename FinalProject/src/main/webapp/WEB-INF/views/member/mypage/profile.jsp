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
            <form class="user_info"  id="memberFrm" action="${path}/update" method="post">
			<security:authentication property="principal" var="user"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <table class="info_table">
                    <tr>
                        <th style="width: 30%;">이름 ${ user.userEmail }</th>
                        <td><input type="text" name="name" readonly value="${user.name }"></td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>닉네임 <span>*</span></th>
                        <td>
                            <input type="text" name="userNname" id="userNname" required value="${user.userNname }">
                            <button class="button" id="checkDuplicate" style="background-color: black;">중복검사</button>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>관심분야 <span>*</span></th>
                        <td>
                            <label><input type="checkbox" name="userGenre" value="baseball">소설</label>&nbsp;
                <label><input type="checkbox" name="userGenre" value="baseball">어린이 / 청소년</label>&nbsp;
                <label><input type="checkbox" name="userGenre" value="baseball">경제 / 경영</label>&nbsp;<br>
                <label><input type="checkbox" name="userGenre" value="baseball">인문 / 사회 / 역사</label>&nbsp;
                <label><input type="checkbox" name="userGenre" value="baseball">종교 / 역학</label>&nbsp;<br>
                <label><input type="checkbox" name="userGenre" value="baseball">자기개발(ex 요리, 뷰티, 여행)</label>&nbsp;<br>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>이메일 <span>*</span></th>
                        <td><input type="email" placeholder="abc@abc.com" name="email" id="email" required
                        	value="${userEmail }"></td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>전화번호 <span>*</span></th>
                        <td>
                            <select class="phone" name="phone">
                                <option value="ko">010</option>
                                <option value="ch">011</option>
                                <option value="jp">016</option>
                                <option value="en">019</option>
                            </select> - 
                            <input class="phone" type="tel" required> - <input class="phone" type="tel" required></label>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>주소 <span>*</span></th>
                        <td><input type="text" name="address" id="address" required></td>
                    </tr>
                </table>
                <br><br><br>
               <button class="button" id="pwd" style="background-color: rgb(141, 133, 133);">비밀번호변경</button>
               <button class="button" type="submit" style="background-color: black;">정보수정</button>
               <button class="button" onclick="backto_mypage();" style="background-color: white; color: black; border: 1px solid darkgray;">취소</button>
               <button class="button" onclick="deleteMember();" id="withdrawal">회원탈퇴</button>
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
            	// 아이디 중복 확인
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
    							alert("사용 가능한 닉네임 입니다.");
    						} else {
    							alert("이미 사용중인 닉네임 입니다.");							
    						}
    					},
    					error: function(e) {
    						console.log(e);
    					}
    				});
    			});
    			});
	</script>
<%@ include file="../../../views/common/footer.jsp" %>