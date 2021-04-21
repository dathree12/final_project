<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../common/header.jsp" %>
<head>
    <title>게시판 상세보기</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardDetail.css" type="text/css">
    <link rel="stylesheet" href="${ path }/bootstrap/dist/css/bootstrap.min.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <style type="text/css">
    	a {
    		color: #000;
    	}
    	
    	.-board-1th, .-board-2th {
    		margin-top: 10px; 
    	}
    </style>
</head>
    <section>
        <!-- content top -->
        <article class="detailArea" style="margin: auto;">
            <div class="sub_detailArea">
                <div class="thumbnail">
                    <div class="_d_name">
    					<img src="${ path }/upload/bc_board/${ clubBoard.bcModifyImage }">
                    </div>
                </div>
                <!-- info : title -->
                <div class="infoArea__box">
                    <div class="infoArea">
                    <c:if test="${ clubBoard.bcRemainDate >= 0 }">
                        <h1 id="_deadline"><span><c:out value="${ clubBoard.bcRemainDate }"/></span>일 남음</h1>
                    </c:if>
                    <c:if test="${ clubBoard.bcRemainDate < 0 }">
                        <h1 id="_deadline"><span><c:out value="${ -clubBoard.bcRemainDate }"/></span>일 남음</h1>
                    </c:if>
                        <h2 id="bcOriginTitle" name="bcOriginTitle" style="margin-top: 10px;"><c:out value="${ clubBoard.bcOriginTitle }"/></h2>
                    </div>
                    
                    <div class="box">
                        <!-- info : subtitle, schedule, price -->
                        <ul class="box_1th">
                            <p style="margin-top: 15px;">${ clubBoard.bcSubTitle }</p>
                            <p style="font-size: 30px; margin: 0;"><b id="bcPrice" name="bcPrice"><fmt:formatNumber value="${ clubBoard.bcPrice }" />원</b></p>
                        </ul>
                        <!-- -------------------------------------- -->
                        <hr>
                        <!-- info : schedule select box -->
                        <div class="goods_select" id="prod_options">
                            <div class="row m-margin-bottom-xxl">
                                <div class="col-xs-12 col-md-12 margin-bottom-xxxl">
                                    <div class="option_title text-12 text-bold padding-bottom-xl" 
                                        style="vertical-align: middel; display: table-cell; word-break: break-all; line-height: normal; font-size: 12px; font-weight: 600 impor !important; padding-bottom: 8px im !important;">
                                        선택
                                        <span class="option_require">*</span>
                                    </div>
                                    <div class="form-select-wrap">
                                        <a href="javascript:;" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"
                                            style="display: block; font-size: 14px; padding: 8px 24px 8px 12px; border: 1px solid #ddd; border-color: #212121; transition: none; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: left; line-height: 1.42857143;">
                                            선택 (필수)
                                        </a>
                                        <div class="dropdown-menu" 
                                            style="font-size: 14px; text-align: left; list-style: none; top: 100%; position: absolute; float: left; background-color: #fff; border: 1px solid rgba(0, 0, 0, .15); border-color: #212121; margin: 1px 1px;  box-shadow: none; border-radius: 0; border-top: 1px solid rgba(0, 0, 0, 0.003); width: 100%; padding: 0; min-width: auto; max-height: 400px; overflow-y: auto; z-index: 9999; max-width: 399px">
                                            <div class="dropdown-item" onclick="event.stopPropagation();">
                                                <a style="padding: 3px 0px; line-height: normal; display: block;" class="blocked _requireOption" onclick="selectBoxCliked();">
                                                    <span id="selectVal" class="blocked margin-bottom-1g" style="margin-bottom: 4px; display: inline-block; text-align: left;">[온라인] <c:out value="${ clubBoard.bcDetailDate }"></c:out></span>
                                                    <span class="no-margin blocked">
                                                        <strong></strong>
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="goods_payment" id="prod_selected_options">
                            <div class="_selected_require_option opt_block" id="prdOption0" style="display: none; padding: 15px; position: relative; overflow: hidden; margin-bottom: 10px; background-color: rgba(1,1,1,0.03); zoom: 1; margin-top: 15px;">
                                <div class="full-width opt_product_area" style="width: 100% !important; display: block;">
                                    <div class="area_tit holder" style="padding-right: 25px; text-align: left !important; position: relative;">
                                        <span class="body_font_color_80 resultProduct"></span>
                                        <a href="javascript:;" class="text-18 absolute absolute_right absolute_middle" onclick="SITE_SHOP_DETAIL.removeSelectedOption(0, 'prod')">
                                            <i class="btl bt-times-circle"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="opt_block total bottom">
                                <p class="no-margin text-right" style="height: 50px; text-align: right; margin: 0; display: table-row; display: flex; justify-content: space-between; vertical-align: middle; padding-top: 20px;">
                                    <span style="font-size: 15px; line-height: 1.6; letter-spacing: 0px; font-weight: normal; font-style: normal; display: table-cell; vertical-align: middle;" class="body_font_color_70 text-left">총 상품금액</span>
                                    <span style="font-size: 15px; line-height: 1.6; letter-spacing: 0px; font-weight: normal; font-style: normal; display: table-cell; vertical-align: middle;" class="total_price"><fmt:formatNumber value="${ clubBoard.bcPrice }" />원</span>
                                </p>
                            </div>
                        </div>
                        <!-- -------------------------------------- -->
                        <hr>
                        <!-- info : button -->
                        <div class="ec-base-button">
                            <div class="_d_btn_1th"> 
                                <input type="submit" value="바로구매하기" onclick="goPayment();">
                            </div>
                            <div class="_d_btn_2th">
                                <input type="submit" value="장바구니" id="_btn_cart">
                                <input type="submit" value="관심상품" id="_btn_likely">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>

        <!-- contents middle -->
        <article id="prdDetail" class="ec-base-tab">
            <ul class="d_menu">
                <li class="selected" style="border: 1px solid #999; z-index: 1; border-bottom: 0;"><a name="tag1" href="#tag1" style="color: #000;">상세정보</a></li>
                <li style="border-left: 0;"><a href="#tag2">참여 후기</a></li>
                <li><a href="#tag2">Q&A</a></li>
            </ul>
            <div class="cont">
                <c:out value="${ clubBoard.bcContent }" escapeXml="false"/>
            </div>
        </article>

        <!-- contents bottom -->
        <article id="prdReview" class="ec-base-tab">
            <ul class="d_menu">
                <li><a href="#tag1">상세정보</a></li>
                <li class="selected" style="border: 1px solid #999; z-index: 1; border-bottom: 0;"><a name="tag2" href="#tag2" style="color: #000;">참여 후기</a></li>
                <li style="border-left: 0;"><a href="#tag3">Q&A</a></li>
            </ul>
            <div class="board">
                <div class="xans-board-title">
                    <div class="title">
                        <h2>
                            <font style="color: #555555;">참여 후기</font>
                        </h2>
                    </div>
                    <p class="imgArea"></p>
                </div>
                <c:set var="exps" value="${ clubBoard.exps }"></c:set>
                <c:if test="${ exps == null }">
                	<div style="text-align: center;"><span>조회된 후기가 없습니다.</span></div>
                </c:if>
                <c:if test="${ exps != null }">
                	<c:forEach var="exps" items="${ exps }">
		                <div class="xans-product-review">
		                    <div class="typeList">
		                        <table border="1">
		                            <colgroup>
		                                <col style="width: 50px;">
		                                <col style="width: 150px;">
		                                <col style="width: auto;">
		                                <col style="width: 150px;">
		                            </colgroup>
		                            <tbody class="center dropdown" style="padding: 0;">
		                                <tr style="background: #fff; border-collapse: collapse; border-radius: 0; width: 100%; margin: 0; margin-bottom: -1px; border: 1px solid #f1f1f1;" class="xans-record-"
		                                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                    <td style="width: 50px;"><c:out value="${ exps.expNo }"/></td>
		                                    <td style="width: 150px;" class="thumb_photo">
		                                        <!-- 후기 대표이미지 -->
		                                        <img alt="이미지가 없습니다." src="${ path }/upload/exp/${ clubBoard.bcModifyImage }">
		                                    </td>
		                                    <td style="width: 848.89px;">
		                                        <ul class="d_review_cont">
		                                            <li>
		                                                <a href="#"><c:out value="${ exps.expTitle }"/></a>
		                                            </li>
		                                        </ul>
		                                    </td>
		                                    <td style="width: 150px;">
		                                        <ul class="d_review_info">
		                                            <li style="margin-top: 5px">
		                                                <span> <c:out value="${ exps.userName }"/></span>
		                                                <span> <c:out value="${ exps.expRegDate }"/></span>
		                                                <span> <c:out value="${ exps.expViewCount }"/></span>
		                                            </li>
		                                        </ul>
		                                    </td>
		                                </tr>
		                                <tr id="product-review-read" class="dropdown-menu" aria-labelledby="dLabel" style="margin: 0; width: 100%; padding: 0; border: none;">
		                                    <td colspan="4" style="width: 1280px; margin: 0">
		                                        <div class="view">
		                                            <div id="ec-ucc-media-box-8">
		                                                <p></p>
		                                                <div class="fr-view fr-view-article">
		                                                    <p><c:out value="${ exps.expContent }"/></p>
		                                                </div>
		                                                <p></p>
		                                                <p>
		                                                    <img src="" alt="">
		                                                    <br>
		                                                </p>
		                                                <p class="ec-base-button">
		                                                    <span class="gLeft"></span>
		                                                </p>
		                                            </div>
		                                        </div>
		                                        <!-- 
		                                        <ul class="boardComment">
		                                            <li>
		                                                <strong class="name"> 대표 관리자</strong>
		                                                <span class="date">2019-04-15 16:31:55</span>
		                                                <p class="comment">
		                                                    <span id="comment_contents1">Thank you~~ :)</span>
		                                                </p>
		                                            </li>
		                                        </ul>
		                                        <form name="commentSecretForm_4" id="commentSecretForm_4" style="display: none;" action="">
		                                            <div class="commentSecret">
		                                                <p></p>
		                                            </div>
		                                        </form>
		                                        -->
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
	                	</c:forEach>
                </c:if>
                <p class="ec-base-button typeBoarder">
                    <span class="gRight">
                        <a id="expWriteButton" name="expWriteButton" href="${ path }/board/bc_board/bcExpWrite">
                            <span class="-cbtn -c-medium -c-black">
                                상품후기쓰기
                            </span>
                        </a>
                        <a href="#">
                            <span class="-cbtn -c-medium">
                                모두보기
                            </span>
                        </a>
                    </span>
                </p>
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
        </article>

        <article id="prdQnA" class="ec-base-tab grid5 ">
            <ul id="p_menu" class="p_menu">
                <li>
                    <a href="#tag1">상세정보</a>
                </li> 
                <li>
                    <a href="#tag2">참여 후기</a></li>
                <li class="selected">
                    <a name="tag3" href="#tag3" style="color: #000;">Q&A</a>
                </li>
            </ul>
            <div class="board">
                <div class="title">
                    <h2 style="font-size: 14px; font-weight: normal;">
                        <font style="color: 333333;">Q&A</font>
                    </h2>
                </div>
                <p class="imgArea"></p>
                <table class="qna_table" style="border: 1px solid #f1f1f1;">
                    <thead>
                        <tr style="height: 41px; background-color: rgb(251, 250, 250);">
                            <th scope="col" style="width: 70px;">번호</th>
                            <!-- <th scope="col">카데고리</th> -->
                            <th scope="col" style="width: 844px;">제목</th>
                            <th scope="col" style="width: 130px;">작성자</th>
                            <th scope="col" style="width: 100px;">작성일</th>
                            <th scope="col" style="width: 55px;">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="center" style="height: 45px;">
                            <td>2</td>
                            <td style="text-align: left;">상품문의 테스트</td>
                            <td>대표 관리자</td>
                            <td>2019-04-15</td>
                            <td>20</td>
                        </tr>
                    </tbody>
                </table>
                <p class="review_button">
                    <span class="gRight" style="margin-top: 10px;">
                        <a href="#">
                            <span class="-cbtn -c-medium -c-black">
                                상품후기쓰기
                            </span>
                        </a>
                        <a href="#">
                            <span class="-cbtn -c-medium">
                                모두보기
                            </span>
                        </a>
                    </span>
                </p>
            </div>
            <div class="pageBar" style="padding: 30px 0; text-align: center; line-height: 0;">
                <a href="#" class="first">«</a>
                <a href="#" class="prev">‹</a>
                <a href="#" class="p_number">1</a>
                <a href="#" class="next">›</a>
                <a href="#" class="last">»</a>
            </div>
        </article>
    </section>
    <script src="${ path }/js/club/bcBoardDetail.js"></script>
    <script>
 		// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
    	$(document).ready(function() {
    	    var csrfToken = $("meta[name='csrf-token']").attr('content');
    	    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
    	    $(document).ajaxSend(function (e, xhr, options) {
    	        xhr.setRequestHeader(csrfHeader, csrfToken);
    	    });
    	    
       		// var thumbnail_img = $('#thumbnail_img');
       		var bcOriginTitle = $('#bcOriginTitle').text(); // html() 은 자식 태그까지 태그값까지 가져오는 것, text() 문자열 읽어오기, val()은 value 속성 값
       		var bcPrice = $('#bcPrice').text();
       		
       		$.ajax({
       			type: "POST",
   				url: "bcExpWrite", // 보내고 싶은 서버의 url...
       		    data : {
       		    	bcOriginTitle
       		    },
   				success: function(data, status, xhr) {
   					console.log(data);
   				},
   				error: function(xhr, status, data) {
   					console.log(e);
   				}
       		})
    	});
    </script>
    
<%@ include file="../../common/footer.jsp" %>