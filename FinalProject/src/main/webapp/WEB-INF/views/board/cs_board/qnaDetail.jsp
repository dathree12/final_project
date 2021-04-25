<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QnA 상세보기</title>
    <link rel="stylesheet" href="${ path }/css/board/cs_style/qnaDetail.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <style type="text/css">
        * {
            -webkit-font-smoothing: antialiased;
            box-sizing: border-box
        }
        div {
            display: block;
        }
        .-board-free-view {
            border-bottom: 1px solid #f1f1f1;
        }
        .-board-free-view h3 {
            font-size: 20px;
            line-height: 2em;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #f1f1f1;
        }
        ._info {
            /* border: 1px solid black; */
            display: flex;
            justify-content: space-between;
        }
        .etcArea {
            margin-right: 20px;
        }

        ._info {
            margin-left: 20px;
        }

        .etcArea li {
            float: left;
            list-style: none;
        }

        .-board-free-view ._detail {
            line-height: 2em;
            padding: 20px 20px 50px;
        }
        .-board-free-view ._detail ._detail_box {
            margin: 10px 0 0;
        }
        
        li { cursor: pointer; }
        
        .bottom_list_wrap li {
        	display: flex;
        	margin: 0;
        	overflow: hidden;
        	border-top: 1px solid #e7e7e7;
        	border-bottom: 1px solid #e7e7e7;
        	line-height: 140%;
        	list-style: none;
        }
        .bottom_list_wrap #next_title {
        	width: 100%;
        	text-align: left;
        }
        .bottom_list_wrap a {
        	float: left;
        	padding: 10px;
        	color: #353535;
        	text-decoration: none;
        }
        
        a {
        	font-size: 10px;
        	font-weight: normal;
        }
    </style>
</head>
</style>
<body>
<%@ include file="../../common/header.jsp" %>
<security:authentication property="principal" var="user" />
<div class="wrap" style="width: 1280px; margin: auto;">
        <!-- input type:hidden 으로 정보 가져오기 -->
        <div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
            <div class="-board-free-view">
                <!-- item으로 북 클럽, 펀딩, 리뷰 간편하게 select box로 만들기 또는 부트스트랩으로 간단하게 구현 -->
                <h3>${ qa.qaItem } 문의</h3>
                <div class="_info">
                    <p><strong>작성자&nbsp;&nbsp;</strong><span style="font-size: 14px;"><c:out value="${ qa.qaWriter }"/></span></p>
                    <ul class="etcArea">
                        <li>
                            <strong>작성일</strong>
                            <span class="txtNum"><c:out value="${ qa.qaEnrollDate }"/></span>
                        </li>
                        <li>
                            <span style="padding: 0 7px; font-size: 11px; line-height: 1.8em; color: #999;">|</span>
                            <strong>조회수</strong>
                            <span class="txtNum"><c:out value="${ qa.qaViewCount }"/></span>
                        </li>
                    </ul>
                </div>
            </div>
  				<hr>
				<div class="brboard-review-content">
					<c:out value="${ qa.qaContent }" escapeXml="false" />
				</div>
				<div class="brboard-review-contentlower">
					<span id="review-recommend-btn"> 
					<!--  
						<a onclick="reco();" class="recommend-button"><img src="${ path }/images/heart.png"	class="recoicon" id="recommend-icon1"></a> 
						<span id="review-recommend-btn2"></span>
					-->
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
				<div class="comment_textarea">
					<form id="commentForm" name="commentForm" method="post"
						class="comment_form">
						<input type="hidden" value="${ qa.qaWriter }">
						<div class="custom-textarea">
							<p class="comment_profile" id="loginNname">${user.userNname}</p>
							<p class="comment_profile" id="loginNo" style="display: none" value="${user.userNo}"></p>
							<textarea class="comment_body"
								style="border: 0px; width:600px; outline: none;"
								name="comContent" id="comContent" rows="1"
								placeholder="댓글을 남겨주세요"></textarea>
							<div class="write_button_wrap">
								<div class="none"></div>
								<div class="write_button">
									<a onclick="saveComment();" id="commentBtn" class="btn pull-right btn-success" style="cursor: pointer;">등록</a>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								</div>
							</div>
						</div>
					</form>
				</div>
            </div>
        </div>
</div>
<script>
// 댓글 목록 보기
function commentList() {
	var qaNo = document.getElementById("reviewheader-qaNo").innerHTML;
	$.ajax({
		url:	"commentList",
		type:	"get",
		data:	{qaNo: ${qa.qaNo}},
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
function saveComment() {
	var csrfToken = $("meta[name='csrf-token']").attr('content');
    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(csrfHeader, csrfToken);
    });
	var comContent = document.getElementById("comContent").value;//댓글 내용 저장
	var comWriter = document.getElementById("loginNname").innerHTML;//댓글 작성자 저장
	
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
			data:	{'qaNo': ${ qa.qaNo },
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
<%@ include file="../../common/footer.jsp" %>