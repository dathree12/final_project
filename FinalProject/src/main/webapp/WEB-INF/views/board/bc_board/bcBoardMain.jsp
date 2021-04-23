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
        
        .owl-stage-outer, .owl-stage {
        	max-height: 580px;
        }
    </style>
</head>
<%@ include file="../../common/header.jsp" %>
    <section class="cp_board_wrap">
        <div class="cp_board_container">
            <div class="cp_board_contents">
                <div class="product-menupackage">
                    <div class="title" style="text-align: center;">
                        <h2 style="margin-left: 100px;"><span style="margin-right: 50px;">북 클럽</span></h2>
                        <!-- 관리자만 글쓰기 가능하게 -->
                        <security:authorize access="hasRole('ADMIN')">
	                        <div class="btn-block-right">
					             <a href="${ path }/board/bc_board/bcAdminWrite">글쓰기</a>
					        </div>
				        </security:authorize>
                    </div>
                    <ul class="menuCategory" style="display: block;">
                        <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardMain" style="text-decoration: none; color: black;" onclick="addFunc();">전체 클럽</a></li>
                        <li class="headcategory"><a style="cursor: pointer; text-decoration: none; color: black;" onclick="removeFunc();">모집 중인 클럽</a></li>
      	                <li class="headcategory"><a onclick="userCheck();" href="${ path }/board/bc_board/bcBoardList" style="text-decoration: none; color: black;">클럽 제안하기</a></li>
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
		                        <li class="anchorBoxId_14" onclick="alert('기간 만료된 클럽입니다.');">
		                            <div class="box">
		                                <div class="thumbnail">
		                                    <div class="prdImg">
		                                        <div class="price_rate">7%</div>
		                                        <a href="#">
		                                            <img src="${ path }/upload/bc_board/${ clubBoard.bcModifyImage }">
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
	                                                            <c:out value="${ clubBoard.bcSubTitle }"/> 
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
                            	<!-- 카운트 어떻게 처리하지 -->
                                <p class="prdCount">총 클럽 게시물 : <strong><c:out value="${ boardCount }"/></strong>개</p>
                                <h2 style="margin-right: 40px;"><span id="recruiting_club" style="">모집 중인 클럽</span></h2>
                                <div></div>
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
		                                                    <img src="${ path }/upload/bc_board/${ clubBoard.bcModifyImage }">
		                                                </a>
		                                            </div>
		                                        </div>
		                                        <div class="description">
		                                            <strong class="name">
		                                                <a href="#">
		                                                    <span style="font-size: 12px; color: #555555;"><c:out value="${ clubBoard.bcOriginTitle }"/></span>
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
		                                                        	<span style="font-size: 10px; background: #000; color: #fff; margin: 0; padding: 0px 1px">등록</span>&nbsp;<c:out value="${ clubBoard.bcRegDate }"/>
		                                                        	<br/><span style="font-size: 10px; background: #000; color: #fff; margin: 0; padding: 0px 1px">세부일정</span>&nbsp;<c:out value="${ clubBoard.bcDetailDate }"/>
		                                                            <!--  
		                                                            2021-03-08 / 11:30 AM / 매주2회
		                                                            -->
		                                                        </p>
		                                                        <span style="font-size: 11px; color: #999999; float: left; margin: 0">
		                                                            <c:out value="${ clubBoard.bcSubTitle }"/>
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
                        <!--
	                        currentPage 현재 페이지
	                        pageLimit 한 페이지에 보여질 페이지의 수
	                        listCOunt 전체 리스트 수
	                        listLimit 한 페이지에 표시될 페이지 수 
                        -->
                        <div class="bcboard_mid_bottom" style="/*border: 1px solid black;*/ text-align: center;">
					      	<div class="bcboard_mid_pageCount">
					            <a href="${path}/board/bc_board/bcBoardMain?page=1">&lt;&lt;</a> &nbsp; &nbsp;
					            <a href="${path}/board/bc_board/bcBoardMain?page=${pageInfo.prvePage}">&lt;</a> &nbsp; &nbsp;
								<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == pageInfo.currentPage}">
										<a disabled><u><b><b><c:out value="${status.current}"/></b></b></u></a> &nbsp; &nbsp;
					   				</c:if>
									<c:if test="${status.current != pageInfo.currentPage}">
										<a href="${path}/board/bc_board/bcBoardMain?page=${status.current}"><c:out value="${status.current}"/></a>
										&nbsp; &nbsp;
					   				</c:if>
								</c:forEach>            
					            
					            <a href="${path}/board/bc_board/bcBoardMain?page=${pageInfo.nextPage}">&gt;</a> &nbsp; &nbsp;
					            <a href="${path}/board/bc_board/bcBoardMain?page=${pageInfo.maxPage}">&gt;&gt;</a>
					        </div>
					    </div>	
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="${ path }/js/club/bcBoardMain.js"></script>
<%@ include file="../../common/footer.jsp" %>