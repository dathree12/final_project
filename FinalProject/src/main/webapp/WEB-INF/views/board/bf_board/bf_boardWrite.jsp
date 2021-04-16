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
	<script src="${path}/ckeditor/ckeditor.js"></script>
	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="fdboard_write_body">
        <form class="fdboard_write_form" id="bfBoardWrite" action="${ path }/board/bf_board/bf_boardWrite?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
            <h2>책스초코 펀딩 프로젝트 신청하기</h2>
            <hr>
            <div class="fdboard_write_table">
                <table>
                    <tr>
                        <th>
                            프로젝트 제목
                        </th>
                        <td>
                            <input type="text" name="bfTitle" placeholder="제목을 입력하세요." size="50px">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            작성자
                        </th>
                        <td>
                            <input type="hidden" name="userNo" value="${ user.userNo }" size="50px" readonly>
                            <input type="text" name="userId" value="${ user.userId }" size="50px" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            시작날짜
                        </th>
                        <td>
                            <input type="date" name="bfEnrollDate">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            종료날짜
                        </th>
                        <td>
                            <input type="date" name="bfEndDate">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            가격
                        </th>
                        <td>
                            <input type="text" name="bfPrice" placeholder="숫자만 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            목표 달성 금액
                        </th>
                        <td>
                            <input type="text" name="bfTargetPrice" placeholder="숫자만 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            사진파일 올리기(대표사진)
                        </th>
                        <td>
                            <input type="file" name="upfile">
                        </td>
                    </tr>
                </table>

                <h4>프로젝트 내용을 입력해 주세요.</h4>
                <textarea name="bfContent" id="bfContent" rows="10" cols="80"></textarea>
					<script>
						CKEDITOR.replace( "bfContent", {//해당 이름으로 된 textarea에 에디터를 적용
							height: 500,
							getUploadUrl: type='image',
							filebrowserUploadUrl: '<c:url value="/board/bf_board/bf_boardWriteCK" />?${_csrf.parameterName}=${_csrf.token}'
						});
	
						CKEDITOR.editorConfig = function(config) {config.filebrowserUploadUrl = '/board/bf_board/bf_boardWriteCK';};
					</script>
					<input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
            </div>
            <div class="write_btn">
                <a class="btn" href="${ path }/board/bf_board/bf_boardList">취소</a> &nbsp
                <a class="btn" onclick="document.getElementById('bfBoardWrite').submit();">등록</a>
            </div>
        </form>
    </div>

<%@ include file="../../common/footer.jsp" %>

