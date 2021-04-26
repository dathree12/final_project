<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../common/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardRead.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
</head>
<body>
<security:authentication property="principal" var="user" />
    <section class="propose-read-section-1th">
        <article class="propose-read-article-1th">
            <div class="board_title">
                <p class="view_title">테스트</p>
            </div>
            <div class="board_summary">
                <div class="left">
                    <div class="avatar">
                        <img alt="프로필 이미지" src="https://cdn.imweb.me/thumbnail/20161214/5850d6a2c09a8.jpg" class="avatar-image">
                    </div>
                    <div class="author">
                        <div class="write"><c:out value="${ propose.userName }"/></div>
                    </div>
                </div>
                <div class="board_txt_area" style="padding: 10px">
                	<c:out value="${ propose.proposeContent }" escapeXml="false"/>
                </div>
                <div class="comment_section">
                    <div class="comment-block">
                        <div class="btn-group-wrap">
                            <i class="far fa-heart"></i>
                            <span class="view_like_count">0</span>
                        </div>
                    </div>
                </div>
                <div class="comment_textarea">
                    <form id="commentForm" method="post" name="commentForm" class="comment_form">
                        <div class="custom-textarea">
							<p class="comment_profile" id="loginNname">${user.userNname}</p>
							<p class="comment_profile" id="loginNo" style="display: none" value="${user.userNo}"></p>
                            <textarea class="comment_body" style="border: 0px; outline: none;" name="comContent" id="comContent" rows="1" placeholder="댓글을 남겨주세요"></textarea>
                            <div class="write_button_wrap">
                                <div class="none"></div>
                                <div class="write_button">
                                    <a onclick="saveComment();" id="commentBtn" class="btn pull-right btn-success" style="color: #fff; cursor: pointer;">작성</a>
                                </div>
                            </div>
                         </div>
                         <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
                    </form>
                    <div class="list_button_wrap">
                        <div class="none"></div>
                        <div class="write_button">
                            <a onclick="history.back();" style="color: #fff;">목록</a>
                        </div>
                    </div>
                    <div class="bottom_list_wrap">
                        <ul>
					        <input id="proposeNo" name="proposeNo" style="visibility: hidden;" type="text" value="${ propose.proposeNo }">
					        <!-- 고민중 -->
                            <li class="next">
                                <span><a><i class="fas fa-chevron-down"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음글</a></span>
                                <span><a id="next_title" onclick="nextBoard();">비밀글</a></span>
                                <!--  
                                	<script type="text/javascript" src="${ path }/js/club/bcBoardRead.js"></script>
                                -->
                                <script type="text/javascript">
	                            	 // 다음글
	                                function nextBoard() {
	                                	var proposeNo = document.querySelector('#proposeNo').value;
	                                	var nextNo = 1;
	                                	
	                                	if ((proposeNo * nextNo + 1) == 1) {
	                                		alert('다음 글이 없습니다.');
	                                	} else {
	                                		location.href="bcBoardRead?proposeNo=" + (proposeNo * nextNo + 1) + "";
	                                	}
	                                }
                             	</script>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </article>
    </section>
    <script src="${ path }/js/club/bcBoardRead.js"></script>
    <script>
// 댓글 목록 보기
function commentList() {
	$.ajax({
		url:	"commentList",
		type:	"get",
		data:	{proposeNo: ${propose.proposeNo}},
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
			data:	{'proposeNo': ${ propose.proposeNo },
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