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
    <link rel="stylesheet" href="${ path }/css/board/cs_style/notiQnaDetail.css" type="text/css">
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
<body>
<%@ include file="../../common/header.jsp" %>
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
                <div class="_detail">
                    <div class="_detail_box">
                        <span><c:out value="${ qa.qaContent }"/></span>
                    </div>
                </div>
            </div>
            <div class="comment_section">
                <div class="comment-block">
                    <div class="btn-group-wrap" style="margin-top: 10px;">
                        <i class="far fa-heart"></i>
                        <span class="view_like_count">0</span>
                    </div>
                </div>
            </div>
            <div class="comment_textarea">
                <form action="${ path }/board/cs_board/qnaDetail?${_csrf.parameterName}=${_csrf.token}" method="post" id="post_form" style="max-height: 150px;">
                    <div class="custom-textarea">
                        <textarea class="comment_body" style="border: 0px; outline: none; max-height: 100px" name="comment_body" id="comment_body" rows="10" cols="80" placeholder="댓글을 남겨주세요"></textarea>
                        <div class="write_button_wrap">
                            <div class="none"></div>
                            <div class="write_button">
                                <a href="#" style="color: #fff;">작성</a>
                            </div>
                        </div>
                    </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
                </form>
                <div class="list_button_wrap" style="margin-top: 80px;">
                    <div class="none"></div>
                    <div class="write_button">
                        <a onclick="history.back();"  style="color: #fff; cursor: pointer;">목록</a>
                    </div>
                </div>
                <div class="bottom_list_wrap">
                    <ul style="padding: 0;">
                        <input id="qaNo" name="qaNo" style="visibility: hidden;" type="text" value="${ qa.qaNo }">
                        <!-- 고민중 -->
                        <li class="next" style="margin: 0;">
                            <span><a><i class="fas fa-chevron-down"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음글</a></span>
                            <span><a id="next_title" onclick="nextBoard();">비밀글</a></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</div>

<!--  
	<div class="wrap">
        <section class="brboard-body">    
            <section class = "brboard-top">
                <div class = "brboard-top-title">
                    <a href="#">Q&A</a>
                </div>
                <div class = "brboard-top-button">
                    <a href="${path}/board/cs_board/qnaBoardWrite" class="write-button">글쓰기</a>
                </div>
                <hr id="line">
            </section>    
            <section class="brboard-review">
                <div class="brboard-review-header">
                    <p id="reviewheader-bookclass">공지사항</p>
                    <p id="reviewheader-reviewtitle">화이팅해봅시다(제목)</p>
                    <p id="reviewheader-reviewwriter">flash8282(작성자)</p>
                    <p id="reviewheader-reviewdate">2021.03.29(날짜)</p>
                </div>
                <hr>
                <div class="brboard-review-content">
                    <div id="articleBodyContents" class="_article_body_contents" style="-webkit-tap-highlight-color: rgba(0,0,0,0)">
                    <script type="text/javascript">
                    function _flash_removeCallback() {}
                    </script>
                        <strong class="media_end_summary">인치케이프 "긴급구조팀이 에버기븐호 일부 부양 성공"<br>선체 정상 항로로 복귀…엔진 가동 시작, 견인선 동원<br><span data-type="ore" data-lang="en">450</span>여척 대기 선박 통과 필요…운하 재개시점은 미정</strong>[이데일리 이정훈 기자] 이집트 수에즈 운하에서 좌초해 항로를 가로 막고 있던 대형 컨테이너선인 에버기븐호의 부양작업이 성공했다고 <span data-type="ore" data-lang="en">AP</span>통신이 <span data-type="ore" data-lang="en">29</span>일(현지시간) 보도했다. 이로 인해 해당 선박이 정상 항로로 돌아선 것으로 알려졌다.<br><br><table cellspacing="5" cellpadding="0" width="498" align="CENTER" bgcolor="ffffff" border="0"><tbody><tr><td style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px;" bgcolor="ffffff"><table cellspacing="5" cellpadding="0" bgcolor="ffffff" border="0"><tbody><tr><td><span class="end_photo_org"><img src="https://imgnews.pstatic.net/image/018/2021/03/29/0004887339_001_20210329141254628.jpg?type=w647" alt=""></span></td></tr></tbody></table></td></tr></tbody></table><br><br>통신에 따르면 이날 해상운송서비스업체인 인치케이프 시핑서비스시스는 회사 트위터를 통해 “이날 오전 4시<span data-type="ore" data-lang="en">30</span>분 쯤 긴급구조팀이 수에즈 운하를 가로 막고 있던 에버기븐호를 일부 부양하는데 성공했다”는 트윗을 올렸다.<br><br>이로써 수에즈 운하에서 좌초해 일주일 째 운하를 가로막고 있던 에버기븐호는 운하의 양쪽 제방과 평행하게 위치해 정상 항로로 복귀했다. 이에 긴급구조팀은 에버기븐호를 끌어내기 위해 견인선을 동원한 것으로 알려졌다. <br><br>이와 관련, 통신은 에버기븐호의 엔진도 가동을 시작해 이동을 준비하고 있다고 전했다.<br><br>다만 현 시점에서 운하 개통을 기다리며 대기하고 있던 약 <span data-type="ore" data-lang="en">450</span>척의 선박이 모두 통과할 때까지 기다려야 하는 만큼 수에즈 운하의 정확한 항행 재개 시기는 알려지지 않은 상태라고 전했다. <br><br>앞서 지난 <span data-type="ore" data-lang="en">23</span>일 파나마 선적의 컨테이너선 에버 기븐호가 수에즈 운하를 지나다 좌초되면서 운하가 마비된 바 있다. 에버기븐호는 길이가 <span data-type="ore" data-lang="en">400</span>ｍ, 폭이 <span data-type="ore" data-lang="en">59</span>ｍ인 <span data-type="ore" data-lang="en">22</span>만t급 세계 최대 규모 컨테이너선으로, 중국에서 출발해 네덜란드 로테르담으로 향하는 중이었다.<br><br>이정훈 (<span data-type="ore" data-lang="en">futures</span>@<span data-type="ore" data-lang="en">edaily.co.kr</span>)<br><br><a target="_blank" href="https://www.edaily.co.kr/newsplus">▶ #24시간 빠른 #미리보는 뉴스 #eNews+</a><br><a target="_blank" href="http://media.naver.com/channel/promotion.nhn?oid=018">▶ 네이버에서 '이데일리 뉴스'를 만나보세요</a><br><a target="_blank" href="http://snaptime.edaily.co.kr/">▶ 빡침해소, 청춘뉘우스 '스냅타임'</a><br><br><p><br>＜ⓒ종합 경제정보 미디어 이데일리 - 무단전재 &amp; 재배포 금지＞</p>
                        </div>
                </div>
                <div class="brboard-review-contentlower">
                    <span id="review-recommend-btn">
                        <a href="#" class="recommend-button"><img src="/images/heart.png" class="recoicon" id="recommend-icon1"></a>
                        <a href="#" class="recommend-button"><img src="/images/redheart.png" class="recoicon" id="recommend-icon2"></a>
                        <span id="review-recommend-btn">공감</span>
                    </span>
                    <span id="review-edit-btn">
                        <a href="#" id="edit-button">수정</a>
                        <a href="#" id="delete-button">삭제</a>
                    </span>
                </div>
                <hr>
                <div class="brboard-review-comment">
                    <article class="propose-read-article-1th">
                        <div class="board_title">
                            <p class="view_title">댓글 테스트</p>
                        </div>
                        <div class="board_summary">
                            <div class="left">
                                <div class="avatar">
                                    <img alt="프로필 이미지" src="https://cdn.imweb.me/thumbnail/20161214/5850d6a2c09a8.jpg" class="avatar-image">
                                </div>
                                <div class="author">
                                    <div class="write">김동민</div>
                                </div>
                            </div>
                            <div class="board_txt_area">
                                <p>
                                 댓글입니다~
                                </p>
                            </div>
                    <div class="comment_textarea">
                        <form action="" method="" class="comment_form">
                            <div class="custom-textarea">
                                <textarea class="comment_body" style="border: 0px; width: auto; outline: none;" name="comment_body" id="comment_body" rows="1" placeholder="댓글을 남겨주세요"></textarea>
                                <div class="write_button_wrap">
                                    <div class="none"></div>
                                    <div class="write_button">
                                        <a href="#" style="color: #fff;">작성</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>    
            </section>
            <hr>
            <section class="brboard-review-bottom">
                <article class="propose-list-section-3th">
                    <div class="reviewbot-list-head">공지사항 목록</div>
                    <table>
                        <thead style="border-top: 2px solid rgb(241, 241, 241);">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th id="blind">작성일</th>
                            <th id="blind">조회수</th>
                        </thead>
                        <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
                            <tr>
                                <td>1</td>
                                <td>
                                    <a>네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
                                </td>
                                <td>대표 관리자</td>
                                <td id="blind">2019-04-15</td>
                                <td id="blind">19</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a>네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
                                </td>
                                <td>대표 관리자</td>
                                <td id="blind">2019-04-15</td>
                                <td id="blind">19</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a>네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
                                </td>
                                <td>대표 관리자</td>
                                <td id="blind">2019-04-15</td>
                                <td id="blind">19</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a>네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
                                </td>
                                <td>대표 관리자</td>
                                <td id="blind">2019-04-15</td>
                                <td id="blind">19</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a>네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
                                </td>
                                <td>대표 관리자</td>
                                <td id="blind">2019-04-15</td>
                                <td id="blind">19</td>
                            </tr>
                        </tbody>
                    </table>
                    <section class="brboard-bot">
                        <div class="brboard-pagination">
                            <a href="#">&laquo;</a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">&raquo;</a>
                        </div>
                    </section>
                </article>
            </section>
        </section>    
    </div>
</body>

<script>
    $(document).ready(function(){
            /*웹페이지 열었을 때*/
            $("#recommend-icon1").show();
            $("#recommend-icon2").hide();
            /*img1을 클릭했을 때 img2를 보여줌*/
            $("#recommend-icon1").click(function(){
                $("#recommend-icon1").hide();
                $("#recommend-icon2").show();
            });
            /*img2를 클릭했을 때 img1을 보여줌*/
            $("#recommend-icon2").click(function(){
                $("#recommend-icon1").show();
                $("#recommend-icon2").hide();
            });
        });
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
-->
<%@ include file="../../common/footer.jsp" %>