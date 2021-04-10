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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path}/css/common/footer.css">
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
     <script src="${path}/js/jquery-3.5.1.js"></script>
    <footer>
        <div id="footer_div"> 
            <div class="f_body">
                <div class="inner_f_company">
                    <h3 >책스초코</h3>
                    <ul>
                        <li>
                            <span>
                                상호 :
                                <strong>책스초코</strong> 
                            </span>
                            <span>
                                대표 :
                                <strong>김동민</strong> 
                            </span>
                        </li>
                        <li>
                            <span>
                                전화 :
                                <strong>02-777-7777</strong> 
                            </span>
                        </li>
                        <li>
                            <span>
                                사업자등록번호 :
                                <strong>111-77-77777</strong> 
                             </span>
                        </li>
                        <li>
                            <span>
                                주소 :
                                <strong>경기도 하남시 포웰시티</strong> 
                            </span>
                        </li>
                        <li>
                            <span>
                                개인정보관리책임자 :
                                <strong>김동민(bookschoko@gmail.com)</strong> 
                            </span>
                        </li>
                        <li>
                            <span>
                                Copyright 2021.
                                <strong>책스초코</strong>
                                . All rights reserved.
                            </span>
                        </li>
                    </ul>
                </div>
                   
                   
                <div class="inner_f_help">
                    <h3>고객센터</h3>
                    <h4>전화: 02-777-7777</h4>

                    <span>
                        <strong>상담</strong>
                        오전 10 ~ 오후5시 (점심시간 오후 12시 ~ 1시)
                    </span>
                    <br>
                    <span>
                        <strong>휴일</strong>
                        weekend / holiday
                    </span>
                    <br>
                    <span>
                        <strong>카카오톡</strong>
                        <strong id="kakao">bookschoco</strong>
                    </span>  
                </div>

                <div class="inner_f_bank">
                    <h3>무통장 입금 계좌 안내</h3>
                    <span>
                        신한 110 - 000 - 000000
                    </span>
                    <br>
                    <span>
                        국민 00 - 000 - 000000
                    </span>
                    <br>
                    <span>
                        예금주 : 김동민
                    </span>  
                </div>   
            </div>
            <div class="f_footer_menu">  
                    <ul>
                        <li><a class="f_a" href="#">회사소개 |</a></li>
                        <li><a class="f_a" href="${path}/common/agreement/termsGuide">이용약관 |</a></li>
                        <li><a class="f_a" href="${path}/common/agreement/personalGuide">개인정보취급방침 |</a></li>
                        <li><a class="f_a"href="${path}/common/agreement/userGuide">이용안내</a></li>
                    </ul>
            </div>
        </div>

	</footer>
    
</body>
</html>