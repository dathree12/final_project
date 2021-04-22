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
    <title>제안서작성</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardWrite.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    <script src="${ path }/ckeditor/ckeditor.js"></script>
</head>
<body style="height: auto;">
    <section class="propose-write-section-1th">
        <article class="propose-write-article-1th">
            <div class="write-header">
                <div class="board-name">북 클럽 제안서 작성</div>
                <div class="write-btn">
	                	<input type="submit">
	                    <a href="${ path }/board/bc_board/bcBoardList">취소</a>
	                    <a href="#">작성</a>
	                </form>
                </div>
            </div>
        </article>
    </section>
    <section class="propose-write-section-2th">
        <article class="propose-write-article-2th" style="min-height: 600px;">
            <form action="${ path }/board/bc_board/bcBoardWrite?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" enctype="multipart/form-data">
            	<input type="submit">
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
                <div class="editor_box">
                    <span>
                        <input id="proposePwd" name="proposePwd" class="basic_input" type="text" placeholder="비밀번호">
                    </span>
                </div>
                <div class="table-cell">
                    <input id="post_subject" class="post_subject" name="proposeTitle" placeholder="제목" type="text">
                </div>
                <textarea name="proposeContent" id="proposeContent" rows="10" cols="80">
                <!-- 시간날때 글씨 스타일 적용하기 -->
                <pre>
<작성팁>

- 아래 항목은 필수 항목이니 전부 기재해주세요.

- 1차 제안서이니 핵심 사항 위주로 써주세요. 유려한 문장보다 구체적인 정보를 부탁드립니다.



리더명 :
리더 연락처 (신규 리더/변경시) :
기존 모임 참가 횟수 : 
없음(신청 불가) / 1회 / 2-10회 / 11-20회 / 20회 이상

리더 소개/약력 :
모임명(가제) :
모임 형식   :  
지정도서 (같은 책 집에서 읽고와서 감상평 나누기) / 슬로리딩 모임 (현장에서 책 같이 읽고 감상평 나누기) / 강연 / 액티비티 / 워크샵형 모임 (글쓰기, 낭독 등)

도서명 or 컨텐츠   :
도서/컨텐츠 관련 소개 / 작가소개 / 유튜브 URL    :


모임 횟수 (1~8회) :
가능 요일/시작시간/소요시간 :
모집 인원 :
회당 참가비:
회차별 토픽:    


*각 항목별로 필수적인 내용을 작성해주세요. 2-3줄 정도로 짧게 작성해주셔도 됩니다. 어려운 질문은 공란으로 두셔도 됩니다.

*해당 질문을 바탕으로 스텝이 모임 인트로와 모임 소개를 작성합니다. 흥미 유발이나 미사여구는 최대한 제외하고 모임의 핵심적인 성격과 내용을 써주세요.



-이 모임을 기획한 이유는 무엇인가요?



-이 모임에 참여한 사람들은 어떤 것을 얻어 갈 수 있나요? 

(리더님이 생각할 때 얻어 갈 수 있는 모든 점을 써주세요. 가시적인 것이 아니라도 좋습니다.)

 ex)  책을 읽고 디테일한 나눔, 사려깊은 나눔, 더 깊은 감상, 지금 우리 주변 사람들에 대한 이해 / 나에 대한 이해, 그것을 통해 성장하기 /투자 기초 지식과 기업을 분석할 수 있는 시각(기초)



-모임에서는 어떤 활동을 하나요?

ex) 자유 대화 / 발제, 토픽이 있는 감상 나눔 / 액티비티(활동 종류 기재) / 루틴 인증(인증 종류 기재)



-이 모임의 핵심 키워드/핵심 활동/핵심 방향/핵심 매력을 다섯가지 항목으로 말해주세요.

(모임에서 다루는 구체적인 것들을 직관적으로 써주세요. 추상적인 내용은 최대한 배제해주시면 좋아요.)

ex)





(선택) 사용하시는 SNS가 있다면 알려주세요. (브런치, 페이스북, 인스타그램, 블로그 어떤 것이라도 좋습니다)
(선택) 추가적으로 보낼 이미지가 있을시 첨부해주세요
                </pre>
                </textarea>
                <!--  
                <script src="${ path }/js/club/bcBoardWrite.js"></script>
                -->
                <script type="text/javascript">
	         	    // ckeditor 적용
	                CKEDITOR.replace( "proposeContent", {//해당 이름으로 된 textarea에 에디터를 적용
	                	height: 1000,
	                	getUploadUrl: type='image',
	                	filebrowserUploadUrl: '<c:url value="/board/bc_board/imageUpload" />?${_csrf.parameterName}=${_csrf.token}' //여기 경로로 파일을 전달하여 업로드 시킨다.
	                });
	
	                CKEDITOR.editorConfig = function( config ) { 
	                	config.filebrowserUploadUrl = '/board/bc_board/imageUpload';
	                };
                </script>
                <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
            </form>
        </article>
    </section>
    <script type="text/javascript">
    
    var password = document.querySelector('#proposePwd').value;
    
	$(function() {
		$.ajax({
            type: "get",
            url: "${ path }/board/bc_board/bcBoardList",
            dataType: "json",
            data: {
                pass: proposePwd
            },
            success: function(data) {
                console.log(data);
            },
            error : function(e) {
            	console.log(e);
            }
        })
	});
	</script>
<%@ include file="../../common/footer.jsp" %>