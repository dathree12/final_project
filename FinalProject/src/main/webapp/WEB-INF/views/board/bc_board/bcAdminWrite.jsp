<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   	<meta content="${ _csrf.token }" name="csrf-token"/>
    <meta content="${ _csrf.headerName }" name="csrf-headerName">
    <title>AdminWrite</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcAdminWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    <script src="${ path }/ckeditor/ckeditor.js"></script>
</head>
    <section class="propose-write-section-1th">
        <article class="propose-write-article-1th">
            <div class="write-header">
                <div class="board-name">관리자 제안서 작성</div>
                <div class="write-btn">
                    <a href="${ path }/">취소</a>
                    <a onclick="submitButton();" style="display: inline-block; zoom: 1; vertical-align: middle; border-width: 1px; border-style: solid; border-radius: 0; font-size: 11px; text-align: center; padding-left: 15px; padding-right: 15px; outline: none; cursor: pointer; box-sizing: border-box; position: relative; border: 1px solid #e7e7e7; background: #eee; transform: perspective(1px) translateZ(0); box-shadow: 0 0 1px transparent; transition-property: color; transition-duration: 0.3s; background: #162b41; border-color: #000; color: #fff; ">작성</a>
                    <script type="text/javascript">
                    	function submitButton() {
                    		document.post_form.submit();
                    	}
                    </script>
                </div>
            </div>
        </article>
    </section>
    <section class="propose-write-section-2th">
        <article class="propose-write-article-2th">
            <form action="${ path }/board/bc_board/bcAdminWrite?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" name="post_form" enctype="multipart/form-data">
                <div class="board_summary">
                    <div class="left">
                        <div class="avatar">
                            <img alt="프로필 이미지" src="https://cdn.imweb.me/thumbnail/20161214/5850d6a2c09a8.jpg" class="avatar-image">
                        </div>
                        <div class="author">
		              		<security:authentication property="principal" var="user"/> 
		                    <input style="border: none; margin-top: 10px" id="post_subject" class="post_subject" name="userName" value="${ user.name }" type="text" readonly>
		                    <input style="visibility: hidden;" type="text" name="userNo" value="${ user.userNo }" readonly>
		                    <input style="visibility: hidden;" type="text" name="userId" value="${ user.userId }" readonly>
                        </div>
                    </div>
                </div>
                <div class="table-cell">
                    <input id="post_subject" class="post_subject" name="bcOriginTitle" placeholder="제목" type="text" style="width: 50%;">
                </div>
                <div class="table-cell">
                    <input id="post_subject" class="post_subject" name="bcSubTitle" placeholder="소제목" type="text" style="width: 50%;">
                </div>
                <div class="table-cell">
                    <input id="post_subject" class="post_subject" name="bcPrice" placeholder="가격" type="number" style="width: 120px;">
                </div>
   				<table border="1" summary style="position: relative; margin: 10px 0 0; border: 1px solid #f1f1f1; border-top: 0; color: #fff; line-height: 1.8em; width: 100%; border-spacing: 0; border-collapse: collapse;">
					<tbody class=".dropdown" style="display: table-row-group; vertical-align: middle; border-color: inherit; border-color: inherit; border-top: 1px solid #f1f1f1;">
						<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
							<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">상세 일정(문자입력)</th>
							<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
								<input type="text" id="bcDetailDate" name="bcDetailDate" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
							</td>
						</tr>
						<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
							<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">진행 일정</th>
							<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
								<input type="date" id="bcStartDate" name="bcStartDate" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
							</td>
						</tr>
						<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
							<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">마감 일정</th>
							<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
								<input type="date" id="bcDeadLineDate" name="bcDeadLineDate" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
							</td>
						</tr>
						<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
							<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">대표이미지</th>
							<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
								<input type="file" id="upfile" name="upfile" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
							</td>
						</tr>
					</tbody>
				</table>
                <textarea name="bcContent" id="bcContent" rows="10" cols="80"></textarea>
                <script type="text/javascript">
                CKEDITOR.replace( "bcContent", {//해당 이름으로 된 textarea에 에디터를 적용
					height: 1000,
					getUploadUrl: type='image',
					filebrowserUploadUrl: '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
				});
				
				CKEDITOR.editorConfig = function( config ) { 
				config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
				};
                </script>
                <!--  
   	                <script src="${ path }/js/club/bcAdminWrite.js"></script>
                -->
                <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
            </form>
        </article>
    </section>
