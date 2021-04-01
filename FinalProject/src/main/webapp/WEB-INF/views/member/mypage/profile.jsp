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
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage_style/profile.css">
</head>
<body>
    <section class="profile_wrap">
        <h3 style="text-align: center;">Profile</h3>
    
        <hr>

        <div class="info">
            <form class="user_info">
                <table class="info_table">
                    <tr>
                        <th style="width: 30%;">이름</th>
                        <td><input type="text" readonly value="초코"></td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>닉네임 <span>*</span></th>
                        <td>
                            <input type="text" name="userName" id="userName" required>
                            <button class="button" style="background-color: black;">중복검사</button>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>관심분야 <span>*</span></th>
                        <td>
                            <label><input type="checkbox" name="hobby" value="baseball" checked>소설</label>&nbsp;
                <label><input type="checkbox" name="hobby" value="baseball" checked>어린이 / 청소년</label>&nbsp;
                <label><input type="checkbox" name="hobby" value="baseball" checked>경제 / 경영</label>&nbsp;<br>
                <label><input type="checkbox" name="hobby" value="baseball" checked>인문 / 사회 / 역사</label>&nbsp;
                <label><input type="checkbox" name="hobby" value="baseball" checked>종교 / 역학</label>&nbsp;<br>
                <label><input type="checkbox" name="hobby" value="baseball" checked>자기개발(ex 요리, 뷰티, 여행)</label>&nbsp;<br>
                        </td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>이메일 <span>*</span></th>
                        <td><input type="email" placeholder="abc@abc.com" name="email" id="email" required></td>
                    </tr>
                    <tr><td colspan=2><hr></td></tr>
                    <tr>
                        <th>전화번호 <span>*</span></th>
                        <td>
                            <select class="phone" name="phone">
                                <option value="ko">010</option>
                                <option value="ch">070</option>
                                <option value="jp">02</option>
                                <option value="en">031</option>
                                <option value="fr">050</option>
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
               <button class="button" style="background-color: white; color: black; border: 1px solid darkgray;">취소</button>
               <button class="button" id="withdrawal">회원탈퇴</button>
            </form>
        </div>
          
    </section>
</body>
</html>