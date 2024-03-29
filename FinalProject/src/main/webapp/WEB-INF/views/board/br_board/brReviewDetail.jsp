<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<security:authentication property="principal" var="user" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>북리뷰 상세보기</title>
<link rel="stylesheet"
	href="${ path }/css/board/br_style/brReviewDetail.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<script src="${ path }/js/jquery-3.5.1.js"></script>
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="wrap">
		<section class="brboard-body">
			<section class="brboard-top">
				<div class="brboard-top-title">
					<a href="${path}/board/br_board/brBoardMain">북리뷰 게시판</a>
				</div>
				<div class="brboard-top-menu">
			            <li><a href="${path}/board/br_board/brBoardMain">전체</a></li>
			            <li><a href="${path}/board/br_board/brBoardMain1">소설</a></li>
			            <li><a href="${path}/board/br_board/brBoardMain2">어린이/청소년</a></li>
			            <li><a href="${path}/board/br_board/brBoardMain3">경제/경영</a></li>
			            <li><a href="${path}/board/br_board/brBoardMain4">인문/사회/역사</a></li>
			            <li><a href="${path}/board/br_board/brBoardMain5">종교/역학</a></li>
			            <li><a href="${path}/board/br_board/brBoardMain6">자기계발</a></li>
				</div>
				<security:authorize access="hasRole('USER')">
				<div class="brboard-top-button">
					<a href="${path}/board/br_board/brBoardWrite" class="write-button">글쓰기</a>
				</div>
				</security:authorize>
				<hr id="line">
			</section>
			<section class="brboard-review">
				<div class="brboard-review-header">
					<p id="reviewheader-brNo" style="display: none">${board.brNo}</p>
					<p id="reviewheader-bookclass">${board.brBookType}</p>
					<p id="reviewheader-reviewtitle">${board.brTitle}</p>
					<p id="reviewheader-reviewwriter">${board.userNname}</p>
					<p id="reviewheader-reviewdate"><fmt:formatDate var="dateTempt" value="${board.brModifyDate}" pattern="yyyy-MM-dd HH:mm"/><c:out value="${dateTempt}" /></p>
					<p style="display: none">${board.brViewCount}</p>
				</div>
				<hr>
				<security:authorize access="hasRole('USER')">
                <div class="review-book-bookscrap">
 				    <a id="scrap_button"><img src="${ path }/images/scrap_0.png" 
						             id="btn_scrap" style="cursor:pointer; width: 20px;"></a>
                </div>
                </security:authorize>
				<div class="brboard-review-book">
					<div class="review-book-cover">
						<a href="#" name="thumbnailbox" id="thumbnailbox"></a>
					</div>
					<div class="review-book-description">
						<div class="book-description">
							<p id="review-bookisbn" style="display: none">${board.brIsbn}</p>
							<p id="book-description-booktitle">
								<a href="#"></a>
							</p>
							<p id="book-description-bookwriter"></p>
							<p id="book-description-bookpublisher"></p>
							<p id="book-description-bookpublish"></p>
							<!--  <p id="book-description-bookstarrate">${board.brRating}</p> -->
							<p id="book-description-bookcontents"></p>
							<!--    <p id="book-description-bookreviewcount"></p>-->
						</div>
					</div>
				</div>
				<hr>
				<div class="brboard-review-content" style="height:800px">
					<c:out value="${board.brContent}" escapeXml="false" />
				</div>
				<div class="brboard-review-contentlower">
					<span id="review-recommend-btn"> 
						<a onclick="reco();" class="recommend-button"><img src="${ path }/images/heart.png"
							class="recoicon" id="recommend-icon1"></a> 
						<span id="review-recommend-btn2"></span>
					</span>
					
					<span id="review-edit-btn">
						<a href="${path}/board/br_board/brBoardWrite" id="edit-button">수정</a>
						<a href="${path}/board/br_board/brBoardDelete?brNo=${board.brNo}" id="delete-button">삭제</a>
					</span>
					</form>
				</div>
				<hr>
				<div class="container">
					<form id="commentListForm" name="commentListForm" method="post">
						<div id="commentList"></div>
					</form>
				</div>
				<security:authorize access="hasRole('USER')">
				<div class="comment_textarea">
					<form id="commentForm" name="commentForm" method="post"
						class="comment_form">
						<div class="custom-textarea">
							<p class="comment_profile" id="loginNname">${user.userNname}</p>
							<p class="comment_profile" id="loginNo" style="display: none" value="${user.userNo}"></p>
							<textarea class="comment_body"
								style="border: 0px; width: 600px; outline: none;"
								name="comContent" id="comContent" rows="1"
								placeholder="댓글을 남겨주세요"></textarea>
							<div class="write_button_wrap">
								<div class="none"></div>
								<div class="write_button">
									<a onclick="saveComment()" id="commentBtn" class="btn pull-right btn-success">등록</a>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								</div>
							</div>
						</div>
					</form>
				</div>
				</security:authorize>
	</div>
	</section>
	<hr>
</body>
<script>
	 $(document).ready(function () {
             $.ajax({
                 method: "GET",
                 url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                 data: { query: ${board.brIsbn} },
                 headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
             })
                 .done(function (msg) {
                     console.log(msg.documents[0].title);
                     console.log(msg.documents[0].thumbnail);
                     console.log(msg.documents[0].datetime);
                     console.log(msg.documents[0].authors);
                     console.log(msg.documents[0].publisher);
                     console.log(msg.documents[0].contents);
                     $("#thumbnailbox").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                     $("#book-description-booktitle").append(msg.documents[0].title);
                     $("#book-description-bookwriter").append(msg.documents[0].authors);
                     $("#book-description-bookpublisher").append(msg.documents[0].publisher);
                     $("#book-description-bookpublish").append(msg.documents[0].datetime);
                     $("#book-description-bookcontents").append(msg.documents[0].contents);
                 });
             
             	commentList();	
 				recCount();
 				getscrap();
 				$("#btn_scrap").click(function(){
	 				alert("스크랩버튼")
	 				scrap();
	 				});
     });
</script>
<script>

			// 댓글 목록 보기
			function commentList() {
				var brNo = document.getElementById("reviewheader-brNo").innerHTML;
				$.ajax({
					url:	"commentList",
					type:	"get",
					data:	{brNo: brNo},
					success: function(data) {
						var str = '';
						
						$.each(data, function(key, value){ 
							if (key == 0) {
								str += '<div class="col-sm-12" style="padding-top: 5px; font-size: 11px;">';
							} else {
								str += '<div class="col-sm-12" style="border-top: 1px solid #dddddd; margin-top: 15px; padding-top: 15px; font-size: 11px;">';
							}
							str += '<div class="col-sm-2">' + value.comWriter + '</div>';
							str += '<div class="col-sm-7 commentContent' + value.comNo + '" align="left"><p>' + value.comContent +'</div>';				
							str += '<div class="col-sm-3">';
							str += '</div></div>';
						});
						$("#commentList").html(str);
						
					}
					});
			}
			

		function reco(){
			var csrfToken = $("meta[name='csrf-token']").attr('content');
		    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
			    $(document).ajaxSend(function (e, xhr, options) {
			        xhr.setRequestHeader(csrfHeader, csrfToken);
			    });
			var brNo = document.getElementById("reviewheader-brNo").innerHTML;
			$.ajax({
				url:	"reco",
				type:	"POST",
				dataType: "json",
				data:	{'brNo' : brNo},
				error: function() {
					alert("좋아요 실패")
				},
				success: function() {
					alert("좋아요 성공")
					$("#recommend-icon1").attr("src","${ path }/images/redheart.png");
					recCount();
		}
			})
		}
		
		function recCount() {
			var csrfToken = $("meta[name='csrf-token']").attr('content');
		    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
		    $(document).ajaxSend(function (e, xhr, options) {
		        xhr.setRequestHeader(csrfHeader, csrfToken);
		    });
			var brNo = document.getElementById("reviewheader-brNo").innerHTML;
			$.ajax({
				url: "RecCount",
                type: "POST",
                data: {
                    'brNo': brNo
                },
                success: function (count) {
                	$("#review-recommend-btn2").html("좋아요 "+count.reco);
                },
			})
		};
		
		//스크랩하기
		function scrap() {
			var csrfToken = $("meta[name='csrf-token']").attr('content');
		    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
		    $(document).ajaxSend(function (e, xhr, options) {
		        xhr.setRequestHeader(csrfHeader, csrfToken);
		    });
			$.ajax({
				url:	"scrap",
				type:	"POST",
				data:	{'bsIsbn' : ${board.brIsbn}},
				error: function() {
					alert("스크랩 error")
				},
				success: function(data) {
	                if(data.resultCode == -1){
	                    alert("스크랩 실패하였습니다.","error","확인",function(){});
	                }
	                else{
	                    if(data.likecheck == 1){
	                        $("#btn_scrap").attr("src","${ path }/images/scrap_1.png");
	                    }
	                    else if (data.likecheck == 0){
	                        $("#btn_scrap").attr("src","${ path }/images/scrap_0.png");
	                    }
	                }
	            }
	        });
	}
		function getscrap(){
			$.ajax({
				url:	"getscrap",
				type:	"get",
				data:	{'bsIsbn' : ${board.brIsbn}},
				success: function(data) {
	                    if(data.resultcode == 1){
	                        $("#btn_scrap").attr("src","${ path }/images/scrap_1.png");
	                    }
	                    else if (data.resultcode == 0){
	                        $("#btn_scrap").attr("src","${ path }/images/scrap_0.png");
	                    }
					}
	        	});
		}
		
		function saveComment() {
			var csrfToken = $("meta[name='csrf-token']").attr('content');
		    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
		    $(document).ajaxSend(function (e, xhr, options) {
		        xhr.setRequestHeader(csrfHeader, csrfToken);
		    });
			var comContent = document.getElementById("comContent").value;//댓글 내용 저장
			var comWriter = document.getElementById("loginNname").innerHTML;//댓글 작성자 저장
			var brNo = document.getElementById("reviewheader-brNo").innerHTML;//댓글 작성한 북리뷰글 번호 저장
			
			if(comContent.trim().length < 5) {
				alert("댓글 내용을 5자 이상 입력해주세요")
			}
			else if(comContent.trim().length > 1000) {
				alert("현재 타이핑수: " + comContent.trim().length + " 최대 타이핑 수는 1000입니다.");
				return;
			}
			else {
				$.ajax({
					url:	"saveComment",
					type:	"post",
					data:	{'brNo': brNo,
							 'comWriter': comWriter,
							 'comContent': comContent},
					success: function(data) {
						alert("댓글 등록 성공");
								commentList();
											},
					error: function(data) {
						alert("댓글 등록 실패")
					}
				});
			}
			
		}; 
</script>

	<script>
	    $(document).ready(function() {
	        $('.comment_body').on('keyup', function(e) {
	            $(this).css('height', 'auto');
	            $(this).height(this.scrollHeight);
	        });
	        $('.comment_body').keyup();
	    })
	</script>

<%@ include file="../../common/footer.jsp"%>