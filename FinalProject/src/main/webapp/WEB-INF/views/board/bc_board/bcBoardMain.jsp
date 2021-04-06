<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardMain.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="../../js/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" defer></script>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</head>
<%@ include file="../../common/header.jsp" %>
    <section class="cp_board_wrap">
        <div class="cp_board_container">
            <div class="cp_board_contents">
                <div class="product-menupackage">
                    <div class="title" style="text-align: center;">
                        <h2><span>북 클럽</span></h2>
                    </div>
                    <ul class="menuCategory" style="display: block;">
                        <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardMain" style="text-decoration: none; color: black;">전체 클럽</a></li>
                        <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardMain" style="text-decoration: none; color: black;">모집 중인 클럽</a></li>
                        <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardList" style="text-decoration: none; color: black;">클럽 제안하기</a></li>
                    </ul>
                </div>
                <!-- 
                	<c:if test="${ list == null }">
                		조회된 게시글이 없습니다.
                	</c:if>
                -->
                <div class="_catelist_best wrapper">
                    <h2><span id="deadline_club" style="position: absolute; left: 600px; top: 150px;">진행 중인 클럽</span></h2>
                    <ul class="prdList carousel owl-carousel">
                        <li class="anchorBoxId_14">
                            <div class="box">
                                <div class="thumbnail">
                                    <div class="prdImg">
                                        <div class="price_rate">7%</div>
                                        <a href="#">
                                            <img id="thumbnail-img" src="${ path }/images/club-test.jpg" alt="샘플">
                                        </a>
                                    </div>
                                </div>
                                <div class="description">
                                    <strong class="name">
                                        <a href="#">
                                            <span style="font-size: 12px; color: #555555;">샘플상품4</span>
                                        </a>
                                    </strong>
                                    <ul class="spec">
                                        <li class="_inline">
                                            <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                        </li>
                                        <li class="_inline">
                                            <strong class="title">
                                                <p class="spec_deadline">
                                                    마감되었습니다
                                                </p>
                                            </strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
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
                                    <ul class="spec">
                                        <li class="_inline">
                                            <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                        </li>
                                        <li class="_inline">
                                            <strong class="title">
                                                <p class="spec_deadline">
                                                    마감되었습니다
                                                </p>
                                            </strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
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
                                    <ul class="spec">
                                        <li class="_inline">
                                            <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                        </li>
                                        <li class="_inline">
                                            <strong class="title">
                                                <p class="spec_deadline">
                                                    마감되었습니다
                                                </p>
                                            </strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
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
                                    <ul class="spec">
                                        <li class="_inline">
                                            <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                        </li>
                                        <li class="_inline">
                                            <strong class="title">
                                                <p class="spec_deadline">
                                                    마감되었습니다
                                                </p>
                                            </strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="_c_width">
                    <div class="normalpackage">
                        <div class="normalmenu">
                            <div class="function">
                                <p class="prdCount">제품 : <strong>24</strong>개</p>
                                <h2><span id="recruiting_club">모집 중인 클럽</span></h2>
                                <div></div>
                                <!-- <ul id="type">
                                    <li>낮은가격</li>
                                    <li>높은가격</li>
                                </ul> -->
                            </div>
                        </div>
                        <div class="ec-base-product">
                            <ul class="prdList">
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li id="anchorBoxId_1" class="xans-record-">
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
                                            <ul class="spec">
                                                <li class="_inline">
                                                    <strong class="title" style="font-size: 12px; color: #000000; font-weight: bold;">28,000원</strong>
                                                </li>
                                                <li class="_inline">
                                                    <strong class="title">
                                                        <p style="font-size: 11px; color: #000;">
                                                            2021-03-08 / 11:30 AM / 매주2회
                                                        </p>
                                                        <span style="font-size: 11px; color: #999999;">
                                                            뭐야 설명 들어가는 곳인가? 락락 얄랄리얄라루
                                                        </span>
                                                    </strong>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="pageBar">
                            <a href="#" class="first">«</a>
                            <a href="#" class="prev">‹</a>
                            <a href="#" class="p_number"><span>1</span></a>
                            <a href="#" class="next">›</a>
                            <a href="#" class="last">»</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
    $(document).ready(function() {
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
    </script>
<%@ include file="../../common/footer.jsp" %>