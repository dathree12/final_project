<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>클럽 메인페이지</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardMain.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <style type="text/css">
    	/* button */
		.btn-block-right { margin-top: 20px; background-color: #747474; border: 1px solid #4f4f4f; border-width: 0px; float: right; padding: 3px; /*display: inline-block;*/ width: 60px; text-align: center; margin-right: 3px; }
		.btn-block-right a { color: white; }
		
        .d_none {
            display: none;
        }
    </style>
</head>
<%@ include file="../../common/header.jsp" %>
    <section class="cp_board_wrap">
        <div class="cp_board_container">
            <div class="cp_board_contents">
                <div class="product-menupackage">
                    <div class="title" style="text-align: center;">
                        <h2 style="margin-left: 100px;"><span>북 클럽</span></h2>
                        <div class="btn-block-right">
				             <a href="${ path }/board/bc_board/bcAdminWrite">글쓰기</a>
				        </div>
                    </div>
                    <ul class="menuCategory" style="display: block;">
                        <li class="headcategory"><a href="#" style="text-decoration: none; color: black;" onclick="addFunc();">전체 클럽</a></li>
                        <li class="headcategory"><a href="#" style="text-decoration: none; color: black;" onclick="removeFunc();">모집 중인 클럽</a></li>
                        <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardList" style="text-decoration: none; color: black;">클럽 제안하기</a></li>
                    </ul>
                </div>
                <!-- noneRemainList -->
                <c:if test="${ dlList == null }">
             	   <p style="width: 100%; margin: 100px 100px 100px 43%">조회된 게시글이 없습니다.</p>
                </c:if>
		                <div class="_catelist_best wrapper">
		                    <h2><span id="deadline_club" style="position: absolute; left: 600px; top: 150px;">진행 중인 클럽</span></h2>
		                    <ul class="prdList carousel owl-carousel" style="max-height: ">
			                <c:if test="${ dlList != null }">
			                	<c:forEach var="clubBoard" items="${ dlList }">
		                        <li class="anchorBoxId_14">
		                            <div class="box">
		                                <div class="thumbnail">
		                                    <div class="prdImg">
		                                        <div class="price_rate">7%</div>
		                                        <a href="#">
		                                            <img src="${ path }/images/club-test.jpg" alt="샘플">
		                                        </a>
		                                    </div>
		                                </div>
		                                <div class="description">
		                                    <strong class="name">
		                                        <a href="#">
		                                            <span style="font-size: 12px; color: #555555;">샘플상품4</span>
		                                        </a>
		                                    </strong>
	                                            <ul class="spec" style="height: 100%; padding: 0">
	                                                <li class="_inline" style="display: block; width: 100%; margin: 0">
	                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold; text-align: left;">
	                                                    <span style="font-size: 10px; background: #000; color: #fff; padding: 0px 1px;">가격</span>&nbsp;<fmt:formatNumber value="${ clubBoard.bcPrice }" />원
	                                                    </strong>
	                                                </li>
	                                                <li class="_inline" style="display: block; width: 100%; text-align: left; margin: 0">
	                                                    <strong class="title">
	                                                        <p style="font-size: 11px; color: #000;">
	                                                        	<p style="background: #000; color: #fff; display: table;">마감되었습니다.</p>
	                                                            <!--  
	                                                            2021-03-08 / 11:30 AM / 매주2회
	                                                            -->
	                                                        </p>
	                                                        <span style="font-size: 11px; color: #999999; float: left; margin: 0">
	                                                            <c:out value="${ clubBoard.bcSubTitle }"></c:out> 
	                                                        </span>
	                                                    </strong>
	                                                </li>
	                                            </ul>
		                                </div>
		                            </div>
		                        </li>
		                	</c:forEach>
		                    </ul>
		                </div>
                </c:if>
                <div class="_c_width">
                    <div class="normalpackage">
                        <div class="normalmenu">
                            <div class="function">
                                <p class="prdCount">총 클럽 : <strong>${ clubBoard.boardCount }</strong>개</p>
                                <h2><span id="recruiting_club">모집 중인 클럽</span></h2>
                                <div></div>
                                <!-- <ul id="type">
                                    <li>낮은가격</li>
                                    <li>높은가격</li>
                                </ul> -->
                            </div>
                        </div>
                        <div class="ec-base-product">
                            <ul class="prdList" style="height: 100%">
                            	<c:if test="${ list == null }">
                            		<p style="width: 100%; margin: 100px 100px 100px 43%">조회된 게시글이 없습니다.</p>
                            	</c:if>
                            	<c:if test="${ list != null }">
                            		<c:forEach var="clubBoard" items="${ list }">
		                                <li id="anchorBoxId_1" class="xans-record-">
		                                    <div class="box">
		                                        <div class="thumbnail">
		                                            <div class="prdImg">
		                                                <div class="price_rate">7%</div>
		                                                <a href="${ path }/board/bc_board/bcBoardDetail?bcNo=${ clubBoard.bcNo }">
		                                                    <img src="${ path }/images/club-test.jpg" alt="샘플">
		                                                </a>
		                                            </div>
		                                        </div>
		                                        <div class="description">
		                                            <strong class="name">
		                                                <a href="#">
		                                                    <span style="font-size: 12px; color: #555555;"><c:out value="${ clubBoard.bcOriginTitle }"></c:out></span>
		                                                </a>
		                                            </strong>
		                                            <ul class="spec" style="height: 100%; padding: 0">
		                                                <li class="_inline" style="display: block; width: 100%; margin: 0">
		                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold; text-align: left;">
		                                                    <span style="font-size: 10px; background: #000; color: #fff; margin: 0; padding: 0px 1px">가격</span>&nbsp;<fmt:formatNumber value="${ clubBoard.bcPrice }" />원
		                                                    </strong>
		                                                </li>
		                                                <li class="_inline" style="display: block; width: 100%; text-align: left; margin: 0">
		                                                    <strong class="title">
		                                                        <p style="font-size: 11px; color: #000;">
		                                                        	<span style="font-size: 10px; background: #000; color: #fff; margin: 0; padding: 0px 1px">등록</span>&nbsp;<c:out value="${ clubBoard.bcRegDate }"></c:out>
		                                                        	<c:out value="${ clubBoard.bcRemainDate }"></c:out>
		                                                            <!--  
		                                                            2021-03-08 / 11:30 AM / 매주2회
		                                                            -->
		                                                        </p>
		                                                        <span style="font-size: 11px; color: #999999; float: left; margin: 0">
		                                                            <c:out value="${ clubBoard.bcSubTitle }"></c:out>
		                                                        </span>
		                                                    </strong>
		                                                </li>
		                                            </ul>
		                                        </div>
		                                    </div>
		                                </li>
                            		</c:forEach>
                            	</c:if>
                            </ul>
                        </div>
                        <div class="pageBar">
                            <a href="${ path }/board/bcBoardMain/list?page=1&listLimit=${ pageInfo.listLimit }" class="first">«</a>
                            <a href="${ path }/board/bcBoardMain/list?page=${ pageInfo.prvePage }&listLimit=${ pageInfo.listLimit }" class="prev">‹</a>
                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
                            	<c:if test="${ status.current == pageInfo.currentPage }">
                            		<a class="p_number" href="${ status.current }">1</a>
                            		<a class="p_number" href="${ status.current }">2</a>
                            		<a class="p_number" href="${ status.current }">3</a>
                            		<a class="p_number" href="${ status.current }">4</a>
                            		<a class="p_number" href="${ status.current }">5</a>
                            	</c:if>
                            	<c:if test="${ status.current != pageInfo.currentPage }">
		                            <a href="${ path }/board/bcBoardMain/list?page=${ status.current}&listLimit=${ pageInfo.listLimit } " class="p_number"><span>1</span></a>
                            	</c:if>
                            </c:forEach>
                            <a href="${ path }/board/bcBoardMain/list?page=${ pageInfo.nextPage }&listLimit=${ pageInfo.listLimit }" class="next">›</a>
                            <a href="${ path }/board/bcBoardMain/list?page=${ pageInfo.maxPage }&listLimit=${ pageInfo.listLimit }" class="last">»</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
    // jQuery.Deferred exception
    //  -> 콜백함수를 사용하여 비동기를 처리할경우, 여러 개의 콜백함수가 nesting되어 복잡도가 높아질 수 있습니다.
    //  -> 스크립트 순서도 중요!
    $(function() {
		$(".carousel").owlCarousel({
			margin: -10,
			loop: true,
			autoplay: true,
			autoplayTimeout:2000,
			autoplayHoverpause: true,
			responsive: {
			    0:{
			        items: 1,
			        nav: false
			    },
			    600:{
			        items: 2,
			        nav: false
			    },
			    1000:{
			        items: 3,
			        nav: false
			    },
			    1280:{
			        items: 4,
			        nav: false
			    }
			}
		});
    });
    
    var val = document.querySelector('._catelist_best');
    var d_none = "d_none";

    function removeFunc() {
        val.classList.add(d_none);
    };
    
    function addFunc() {
    	val.classList.remove(d_none);
    };
    
    </script>
<%@ include file="../../common/footer.jsp" %>