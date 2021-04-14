<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="${ path }/css/board/bc_style/bcReviewWrite.css" type="text/css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
	<script src="${ path }/ckeditor/ckeditor.js"></script>
	<script src="https://kit.fontawesome.com/2d323a629b.js"
		crossorigin="anonymous"></script>
</head>
<%@ include file="../../common/header.jsp"%>
<section id="wrap">
	<div id="container">
		<div
			class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 _board_wrap">
			<div
				class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4">
				<div class="title">
					<h2>
						<font style="color: rgb(85, 85, 85);">사용후기</font>
					</h2>
					<p>상품 사용후기입니다.</p>
				</div>
			</div>
			<form action="${ path }/board/bc_board/bcAdminWrite?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" enctype="multipart/form-data">
				<div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
					<div class="ec-base-box typeProduct">
						<p class="thumbnail">
							<a href="#"> <img style="max-width: 90px;"
								src="${ path }/images/club-test.jpg" alt="썸네일 이미지" id="iPrdImg">
								<!-- 구매한 상품 이미지 -->
							</a>
						</p>
						<div class="information">
							<h3>
								<a href id="aPrdNameLink"> <span id="sPrdName">샘플상품1</span>
								</a>
							</h3>
							<p class="price">
								<span id="sPrdPrice">24,000원</span>
							</p>
						</div>
					</div>
					<div class="ec-base-table typeWrite">
						<table border="1" summary style="position: relative; margin: 10px 0 0; border: 1px solid #f1f1f1; border-top: 0; color: #fff; line-height: 1.8em; width: 100%; border-spacing: 0; border-collapse: collapse;">
							<tbody class=".dropdown" style="display: table-row-group; vertical-align: middle; border-color: inherit; border-color: inherit; border-top: 1px solid #f1f1f1;">
								<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
									<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">제목</th>
									<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
									<input type="text" id="subject" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;"></td>
								</tr>
							</tbody>
						</table>
					<textarea name="bcContent" id="bcContent" rows="10" cols="80"></textarea>
					<script>
						CKEDITOR.replace(
							"bcContent",
							{//해당 이름으로 된 textarea에 에디터를 적용
								height : 1000,
								getUploadUrl : type = 'image',
								filebrowserUploadUrl : '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
							});

						CKEDITOR.editorConfig = function(config) {
							config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
						}
					</script>
					<input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
				</div>
			</form>
		</div>
		<div class="ec-base-button">
			<span class="gLeft" style="float: left; text-align: left;"> <span
				class="displaynone" style="display: none;"> <a href="#none">
						<!-- 관리자답변보기 -->
				</a>
			</span> <a href="#"> <span class="-cbtn -c-medium"
					style="height: 32px; line-height: 32px;"> 목록 </span>
			</a>
			</span> <span class="gRight" style="float: right; text-align: right;">
				<a href="#"> <span class="-cbtn -c-medium -c-black"> 등록 </span>
			</a> <a href="#"> <span class="-cbtn -c-medium"> 취소 </span>
			</a>
			</span>
		</div>
	</div>
	</form>
	</div>
	</div>
</section>
<%@ include file="../../common/footer.jsp"%>