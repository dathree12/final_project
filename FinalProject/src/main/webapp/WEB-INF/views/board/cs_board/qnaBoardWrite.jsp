<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<%@ include file="../../common/header.jsp" %>
<head>
	<meta charset="UTF-8">
    <title>제안하기 게시판 리스트</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardList.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
   	<script type="text/javascript" src="${ path }/js/club/bcBoardList.js"></script>    
	<script src="${ path }/ckeditor/ckeditor.js"></script>
    <style type="text/css">
       	/* button */
		.btn-block-right { margin-top: 20px; background-color: #747474; border: 1px solid #4f4f4f; border-width: 0px; float: right; padding: 3px; /*display: inline-block;*/ width: 60px; text-align: center; margin-right: 3px; }
		.btn-block-right a { color: white; }
		.-c-medium {
			height: 32px;
			line-height: 32px;
		}
		
		.-cbtn {
			display: inline-block;
			zoom: 1;
			vertical-align: middle;
			border-width: 1px;
			border-style: solid;
			border-radius: 0;
			font-size: 11px;
			text-align: center;
			padding-left: 15px;
			padding-right: 15px;
			outline: none;
			cursor: pointer;
			box-sizing: border-box;
			position: relative;
			border: 1px solid #e7e7e7;
			background: #eee;
			transform: perspective(1px) translateZ(0);
			box-shadow: 0 0 1px transparent;
			transition-property: color;
			transition-duration: 0.3s;
		}
		
		.-c-black {
			background: #162b41;
			border-color: #000;
			color: #fff;
		}
	</style>
</head>
    <section class="propose-list-section-1th">
        <article class="propose-list-section-2th">
            <div class="sub-title-1th">
                <h2>
                    <font>Q&A 작성페이지</font>
                </h2>
            </div>
            <div class="sub-title-2th">
                <h4>
                    <span>뭐든지 물어보세유</span>
                </h4>
            </div>
        </article>
        <article class="propose-list-section-2th">
			<form action="${ path }/board/cs_board/qnaBoardWrite?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" name="post_form">
				<div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
					<div class="ec-base-box typeProduct">
                        <div class="author" style="visibility: hidden;">
		              		<security:authentication property="principal" var="user"/> 
		                    <input id="post_subject" class="post_subject" name="userName" value="${ user.name }" type="text" readonly>
		                    <input type="text" name="userNo" value="${ user.userNo }" readonly>
		                    <input type="text" name="qaWriter" value="${ qa.qaWriter }" readonly>
                       </div>
						<div class="information">
							<h3>
								<a href id="aPrdNameLink">
									<span id="sPrdName"></span>
								</a>
							</h3>
						</div>
					</div>
					<div class="ec-base-table typeWrite">
						<table border="1" summary style="position: relative; margin: 10px 0 0; border: 1px solid #f1f1f1; border-top: 0; color: #fff; line-height: 1.8em; width: 100%; border-spacing: 0; border-collapse: collapse;">
							<tbody class=".dropdown" style="display: table-row-group; vertical-align: middle; border-color: inherit; border-color: inherit; border-top: 1px solid #f1f1f1;">
								<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
									<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">제목</th>
									<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
										<div style="text-align: left;">
											<input type="text" id="qaTitle" name="qaTitle" style="width: 390px; height: 32px; line-height: 32px; padding: 2px 4px; border: 1px solid #f1f1f1; color: #353535; font-size: 12px;">
										</div>
									</td>
								</tr>
								<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
									<th scope="row" style="border-left: 0; padding: 11px 0 10px 18px; border: 1px solid #f1f1f1; color: #353535; text-align: left; font-weight: normal; background-color: #f7f7f7; word-break: break-all; word-wrap: break-word; vertical-align: top; display: table-cell; font-size: 11px;">게시판</th>
									<td style="padding: 8px 10px 7px; border-top: 1px solid #f1f1f1; color: #353535; vertical-align: middle; word-break: break-all; word-wrap: break-word; border: 0;">
										<div style="text-align: left; width: 300px; height: 32px">
											<div style="text-align: left;">
												<select name="qaItem" style="width: 100%; height: 32px; border-radius: 0; border: 1px solid #f1f1f1;">
												 	<option value="">-</option>
													<option value="기타">기타</option>
												 	<optgroup label="게시판">
														<option value="북 리뷰">북 리뷰</option>
														<option value="북 펀딩">북 펀딩</option>
														<option value="북 클럽">북 클럽</option>
												 	</optgroup>
												</select>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<textarea name="qaContent" id="qaContent" rows="10" cols="80"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace( "qaContent", {//해당 이름으로 된 textarea에 에디터를 적용
								height: 200,
								getUploadUrl: type='image',
								filebrowserUploadUrl: '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
							});
	
							CKEDITOR.editorConfig = function( config ) { 
								config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
							};
						</script>
					</div>
				</div>
				<span class="gRight" style="float: right; text-align: right; margin-top: 10px;">
					<a id="qa_btn"><input type="submit" class="-cbtn -c-medium -c-black" value="등록"></a>
					<a href="${ path }/board/cs_board/qnaBoardMain"><span class="-cbtn -c-medium"> 취소 </span></a>
				</span>
				<input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
				<div class="ec-base-button">
				<span class="gLeft" style="float: left; text-align: left; margin-top: 10px;"> 
					<span class="displaynone" style="display: none;"><a href="#none"><!-- 관리자답변보기, 시간부족하면 생략 --></a></span> 
					<!-- history.back(); 뒤로가기 -->
					<a onclick="history.back();"><span class="-cbtn -c-medium" style="cursor: pointer; height: 32px; line-height: 32px;"> 목록 </span></a>
				</span> 
			</div>
			<input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
			</form>
        </article>
		<security:authorize access="isAnonymous()">
            <div style="text-align: center; margin-top: 50px">
                <h4>
                	로그인 후 이용해주세요
                </h4>
            </div>
		</security:authorize>
    </section>
<%@ include file="../../common/footer.jsp" %>