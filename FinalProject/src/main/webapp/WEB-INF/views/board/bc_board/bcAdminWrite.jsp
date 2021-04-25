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
                <textarea name="bcContent" id="bcContent" rows="10" cols="80">
                <pre>
<p>클럽 소개</p>

<p>매일 글쓰기 2주 프로젝트!</p>

<p>그 영화 보고 무슨 생각 했더라? 우리 처음 만났을 때 어떤 느낌이 들었더라? <br/>이 책 처음 읽고 나서 내 감정이 어땠지? 우리는 2주간의 짧은 글쓰기에 도전합니다. <br/>이를 통해 일상에서 놓치는 감정들을 잡아 두고, 생각을 어떻게 글로 표현할지 함께 고민해요. 매일 글을 쓰고 다듬어 보는 과정을 통해, 일상 속에서 조금씩 성장해 가는 나의 모습을 확인 할 수 있어요. 또, 다른 멤버들의 글을 보며 같은 토픽으로 달리 뻗어 가는 생각을 느끼고 이해하게 됩니다. 똑같이 느껴지는 일상에서 다름과 가치를 발견하는 기쁨을 얻어가는 시간이지요.</p>

<p>토픽을 따라 '다섯 문장'에서 '한 편' 쓰기</p>

<p>일상적이면서도 재기 넘치는 토픽이 매일 제공되며, 처음에는 다섯 문장, 그 후에는 한 문단에서 한 편을 완성해나갑니다. 블로그 글, SNS 글, 메모지의 손글씨… 어떤 형태도 좋습니다. 자유롭게 쓰며 웨이트 트레이닝하듯이 글쓰기 근력이 키워봐요. 아침 운동처럼, 모닝 커피처럼 글쓰기 습관을 지키고 서로 응원해나가는 거죠. 그렇게 2주 후가 지나면 한뼘 자란 나의 글과 만날 수 있을 거예요.</p>

<p>매일매일 글 쓰는 1일 1글 클럽에서는!</p>

<p>일상 속 재기 넘치는 글쓰기 토픽을 제공합니다.<br/>
(ex. 나의 부캐, 바꾸고 싶은 습관, <br/>
비밀번호를 잃어버렸을 때, 나의 유튜브 알고리즘 등)<br/>
다섯 문장에서 시작해 한 문단으로, 한 편으로<br/>
　조금씩 부담 없는 글쓰기를 합니다.
</p>

<p>2주간 매일 글을 씁니다.<br/> 
게시판에 14번 모두 인증 시, <br/>
　 3000 포인트를 환급받습니다.<br/>
</p>

<p>모임에 참여하면 이렇게 변화합니다.</p>

<p>글쓰기 루틴을 가지게 됩니다.<br/>
매일의 기록이 남습니다.<br/>
필력을 기를 수 있습니다.<br/>
똑같은 줄 알았던 일상을 새롭게 바라봅니다.<br/>
같은 토픽으로 쓴 다양한 글을 보며<br/>
타인을 더 잘 이해하게 됩니다.</p>

<p>참여 안내<br/>
<br/>
<p>일시 : 5.2.일-5.16.일 / 2주간</p><br/> 
<p>인원 : 15명</p><br/>
<p>모임비 : 39,000원</p><br/>
<br/>    
<p>Leader's Comment</p><br/>
<br/>
<p>형근 리더가 매일 글쓰는 이유는요?</p><br/>
<br/>
<p>매일 쓰면 일상을 더 소중하게 여기게 된다고 생각해요. </p><br/>
<p>잘 알고 있는 것이어도, 막상 글로 정리하려면 막막해 집니다. </p><br/>
<p>글로 써 보면 막연함은 줄이고, 생각을 다듬을 수 있게 되죠.</p><br/> 
<p>일상에서 눈여겨 보지 않던 것에 대해서 쓰려면, 글을 쓰기 위해서라도 한 번 더 돌이켜 보게 되더라고요.</p><br/>
<p>막연하게 반복된다고 여기던 일상에서 새로움을 찾고, 의미를 부여할 수 있는 것은 매일 글쓰기 덕분이라고 생각해요.</p><br/>
<br/>
<p>이런 분께 추천드려요</p>
<br/>
<p>막연히 글은 쓰고 싶은데 시작이 어려운 분</p> 
<p>일상적인 주제로 글을 써보는 습관을 들이고 싶은 분</p>
<p>꾸준한 글쓰기 습관을 만들고 싶은 분</p> 
<p>조금씩 써나가며 성장하고 싶으신 분</p>
<br/>
<p>이런 분과는 맞지 않아요</p>
<br/>
<p>부정적인 분, 비난하는 분</p>
<p>내가 쓴 글을 다른 분들과</p>
<p>함께 읽고 이야기 하는 것이 불편하신 분</p>
                </pre>
                </textarea>
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
