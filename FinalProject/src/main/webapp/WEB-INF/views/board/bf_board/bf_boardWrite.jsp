<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_boardWrite.css" type="text/css">
	<script src="${path}/js/jquery-3.5.1.js"></script>
	<title>책스초코 펀딩 프로젝트 신청하기</title>
</head>

<body>
    <div class="fdboard_write_body">
        <form class="fdboard_write_form" action="test" method="POST">
            <h2>책스초코 펀딩 프로젝트 신청하기</h2>
            <hr>
            <div class="fdboard_write_table">
                <table>
                    <tr>
                        <th>
                            프로젝트 제목
                        </th>
                        <td>
                            <input type="text" placeholder="제목을 입력하세요." size="50px">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            작성자(업체명)
                        </th>
                        <td>
                            <input type="text" placeholder="작성자(업체명)을 입력하세요." size="50px">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            시작날짜
                        </th>
                        <td>
                            <input type="date">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            종료날짜
                        </th>
                        <td>
                            <input type="date">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            가격
                        </th>
                        <td>
                            <input type="text" placeholder="숫자만 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            목표 달성 금액
                        </th>
                        <td>
                            <input type="text" placeholder="숫자만 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            사진파일 올리기(대표사진)
                        </th>
                        <td>
                            <input type="file">
                        </td>
                    </tr>
                </table>

                <h4>프로젝트 내용을 입력해 주세요.</h4>
                <textarea name="fdboard_content" id="ckeditor"></textarea>
            </div>
            <div class="write_btn">
                <a class="btn" href="#">취소</a> &nbsp
                <a class="btn" href="#">등록</a>
            </div>
        </form>
    </div>

    <script>
        // 3. CKEditor5를 생성할 textarea 지정
        ClassicEditor
            .create( document.querySelector( '#ckeditor' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
    
<%@ include file="../../common/footer.jsp" %>