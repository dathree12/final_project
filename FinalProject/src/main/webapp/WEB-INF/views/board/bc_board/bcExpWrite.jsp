<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ include file="../../common/header.jsp"%>
<head>
	<meta charset="UTF-8">
	<title>리뷰작성페이지</title>
	<link rel="stylesheet" 	href="${ path }/css/board/bc_style/bcExpWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
	<script src="${ path }/ckeditor/ckeditor.js"></script>
</head>
<section id="wrap">
	<div id="container">
		<div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 _board_wrap">
			<div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4">
				<div class="title">
					<h2>
						<font style="color: rgb(85, 85, 85);">사용후기</font>
					</h2>
					<p>상품 사용후기입니다.</p>
				</div>
			</div>
			<form action="${ path }/board/bc_board/bcExpWrite?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" enctype="multipart/form-data">
				<div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
                        <div class="author" style="visibility: hidden;">
		              		<security:authentication property="principal" var="user"/> 
		                    <input id="post_subject" class="post_subject" name="userName" value="${ user.name }" type="text" readonly>
		                    <input type="hidden" name="userNo" value="${ user.userNo }" readonly>
		                    <input type="hidden" name="userId" value="${ user.userId }" readonly>
                       </div>
					<div class="ec-base-table typeWrite">
						<table border="1" summary style="position: relative; margin: 10px 0 0; border: 1px solid #f1f1f1; border-top: 0; color: #fff; line-height: 1.8em; width: 100%; border-spacing: 0; border-collapse: collapse;">
							<tbody class=".dropdown" style="display: table-row-group; vertical-align: middle; border-color: inherit; border-color: inherit; border-top: 1px solid #f1f1f1;">
								<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
									<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">제목</th>
									<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
										<!-- 후기 제목 -->
										<input type="text" id="expTitle" name="expTitle" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
									</td>
								</tr>
								<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
									<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">대표이미지</th>
									<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
										<!-- 후기 이미지 -->
										<input type="file" id="upfile" name="upfile" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
									</td>
								</tr>
							</tbody>
						</table>
						<textarea name="expContent" id="expContent" rows="10" cols="80"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace( "expContent", {//해당 이름으로 된 textarea에 에디터를 적용
								height: 200,
								getUploadUrl: type='image',
								filebrowserUploadUrl: '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
							});
	
							CKEDITOR.editorConfig = function( config ) { 
								config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
							};
						</script>
						<!--  
							<script src="${ path }/js/club/bcExpWrite.js"></script>
						-->
					</div>
				</div>
				<span class="gRight" style="float: right; text-align: right; margin-top: 10px;">
					<a id="exp_btn"><input type="submit" class="-cbtn -c-medium -c-black" value="등록"></a>
					<a onclick="history.back();"><span class="-cbtn -c-medium"> 취소 </span></a>
				</span>
				<input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
			</form>
			<div class="ec-base-button">
				<span class="gLeft" style="float: left; text-align: left;"> 
					<span class="displaynone" style="display: none;"><a href="#none"><!-- 관리자답변보기, 시간부족하면 생략 --></a></span> 
					<!-- history.back(); 뒤로가기 -->
					<a onclick="history.back();"><span class="-cbtn -c-medium" style="cursor: pointer; height: 32px; line-height: 32px;"> 목록 </span></a>
				</span> 
			</div>
		</div>
	</div>
</section>
<%@ include file="../../common/footer.jsp"%>
