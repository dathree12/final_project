<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  

<c:set var="path" value="${pageContext.request.contextPath }"/>

<%@ include file="../../common/header.jsp" %>
<head>
    <%-- <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> --%>
	<title>주문조회</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_orderList.css" type="text/css"> 
	<script src="${path}/js/jquery-3.5.1.js"></script>
	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="fdboard_write_body">
        <form class="fdboard_write_form" id="bfcartList" action="${ path }/board/bf_board/bf_cartList?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
            <h2>북펀딩 장바구니</h2>
            <hr>
            <div>
            	<input type="hidden" value="${user.userNo}">
            	
                <table>
                    <tr>
                        <th>
                            북펀딩 장바구니 목록
                        </th>
                        <td>
                            가격
                        </td>
                        <td>
                        	수량
                        </td>
                        <td>
                        	선택
                        </td>
                        <td>
                        	삭제하기
                        </td>
                    </tr>
                    
                <c:if test="${list1 == null}">
                     <tr>
                        <th>
                            장바구니에 상품이 없습니다.
                        </th>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </c:if> 
                                   
                <c:if test="${list1 != null}">
        		<c:forEach var="bf_cart" items="${list1}">
        			<c:if test="${bf_cart.userNo == user.userNo}">
                     <tr>
                        <th>
                            <c:out value="${bf_cart.cartTitle}"></c:out>
                        </th>
                        <td>
                            <c:out value="${bf_cart.cartPrice}"></c:out>
                        </td>
                        <td>
                        	<c:out value="${bf_cart.cartAmount}"></c:out>
                        </td>
                        <td>
                        	<input type="checkbox">
                        </td>
                        <td>
                        	<input type="button" value="삭제">
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>    
                </c:if>                       
                </table>
                
            </div>
            <div class="write_btn">
                <a class="btn" href="${ path }/">뒤로가기</a> &nbsp
                <a class="btn" href="${ path }/">구매하기</a>
            </div>
        </form>
        
        
        <br><br><br><br><br><br><br><br><br><br>
        
        <form class="fdboard_write_form" id="bforderList" action="${ path }/board/bf_board/bf_orderList?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
            <h2>북클럽 장바구니</h2>
            <hr>
            <div>
                <table>
                    <tr>
                        <th>
                            북클럽 신청목록
                        </th>
                        <td>
                            가격
                        </td>
                        <td>
                        	기간
                        </td>
                        <td>
                        	선택
                        </td>
                        <td>
                        	삭제하기
                        </td>
                    </tr>
                    
                <c:if test="${list2 == null}">
                     <tr>
                        <th>
                            신청한 클럽이 없습니다.
                        </th>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </c:if> 
                                   
                <c:if test="${list2 != null}">
        		<c:forEach var="bc_payment" items="${list2}">
        			<c:if test="${bc_payment.userNo == user.userNo}">
                     <tr>
                        <th>
                            <c:out value="${bf_cart.cartTitle}"></c:out>
                        </th>
                        <td>
                            <c:out value="${bf_cart.cartPrice}"></c:out>
                        </td>
                        <td>
                        	기간
                        </td>
                        <td>
                        	<input type="checkbox">
                        </td>
                        <td>
                        	<input type="button" value="삭제">
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>    
                </c:if>                       
                </table>

            </div>
            <div class="write_btn">
                <a class="btn" href="${ path }/">뒤로가기</a> &nbsp
                <a class="btn" href="${ path }/">북클럽 신청하기</a>
            </div>
        </form>
    </div>

<%@ include file="../../common/footer.jsp" %>

