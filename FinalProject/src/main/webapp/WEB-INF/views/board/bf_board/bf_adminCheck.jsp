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
	<title>책스초코 펀딩 프로젝트 신청하기</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_boardWrite.css" type="text/css"> 
	<script src="${path}/js/jquery-3.5.1.js"></script>
	<%-- <script src="${path}/ckeditor/ckeditor.js"></script> --%>
	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="fdboard_write_body">
        <form class="fdboard_write_form" id="bfAdminWrite" action="${ path }/board/bf_board/bf_adminWrite?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
        	<input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
            <h2>책스초코 펀딩 프로젝트 관리자체크 상세페이지</h2>
            <hr>
            
            <div class="write_btn">
                <a class="btn" href="${ path }/member/admin/admin_page">취소</a> &nbsp
                <a class="btn" onclick="document.getElementById('bfAdminWrite').submit();">보내기</a>
            </div> <br><br><br>
            
            <input type="hidden" name="bfNo" value="${ board.bfNo }">
            
            <div class="fdboard_write_table">
                <table>
                    <tr>
                        <th>
                            관리자 코멘트 입력
                        </th>
                        <td>
                        	<input type="radio" name="bfStatus" value="P"> 승인
                        	<input type="radio" name="bfStatus" value="D"> 반려
                        	<br>
                            <input type="text" name="bfAdminComment" placeholder="승인/거절 & 상세사유를 입력하세요." size="50px">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            프로젝트 제목
                        </th>
                        <td>
                            <c:out value="${board.bfTitle}"/>
                        </td>
                    </tr>
                    <%-- <tr>
                        <th>
                            작성자
                        </th>
                        <td>
                            <input type="hidden" name="userNo" value="${ user.userNo }" size="50px" readonly>
                            <input type="text" name="userId" value="${ user.userId }" size="50px" readonly>
                        </td>
                    </tr> --%>
                    <tr>
                        <th>
                            시작날짜
                        </th>
                        <td>
                        	<c:out value="${board.bfEnrollDate}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            종료날짜
                        </th>
                        <td>
                            <c:out value="${board.bfEndDate}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            가격
                        </th>
                        <td>
                            <c:out value="${board.bfPrice}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            목표 달성 금액
                        </th>
                        <td>
                            <c:out value="${board.bfTargetPrice}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            사진파일 올리기(대표사진)
                        </th>
                        <td>
                            <img src="${ path }/upload/bf_board/${ board.bfReImgName }" width="200px" height="300px">
                        </td>
                    </tr>
                    <tr>
                    	<th>
                            프로젝트 내용
                        </th>
                        <td>
                            <c:out value="${board.bfContent}" escapeXml="false"/>
                        </td>
                    </tr>
                </table>

                
                
            </div>
        </form>
    </div>

<%@ include file="../../common/footer.jsp" %>

