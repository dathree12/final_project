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
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
</head>
<%@ include file="../../common/header.jsp" %>
    <section class="payment-list-section-1th">
        <div class="shop-title">
            결제하기
        </div>
        <div class="container_wrap">
            <div class="order_wrap">
                <div class="order_wrap_detail">
                    <h6>주문 상품 정보</h6>
                    <div class="row">
                        <div class="shop_item_thumb">
                            <a href="#">
                                <div class="product_img_wrap">
                                    <img src="${ path }/images/test-img.jpg" alt="주문상품 이미지">
                                </div>
                                <div class="product_info_wrap">
                                    <span class="shop_item_title">[온라인] 드로잉 클럽 풍경 편 10기  - 그림 작가와 함께 라인 드로잉</span>
                                    <div class="shop_item_opt">
                                        <p>
                                            <em style="border: 1px solid lightgrey; color: lightgrey; font-size: 9px; padding: 2px; margin-right: 2px;">필수</em>
                                            <strong style="color: #555555;">선택</strong>
                                            <span style="color: #555555;">: 4.4(일)시작- [온라인]드로잉 클럽 풍경 편 10기 - 1개</span>
                                        </p>
                                    </div>
                                    <div class="shop_item_pay">
                                        <span>59,000원</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="_form_config_wrap">
                    <div class="order_detail">
                        <h6>주문자 정보</h6>
                        <div class="_order_preview_wrap">
                            <div class="col-xs-12">
                                <div class="order-name">
                                    김동민
                                </div>
                                <div class="order-phone">
                                    01099828939
                                </div>
                                <div class="order-email">
                                    kdm8939@naver.com
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="_discount_wrap">
                    <h6>포인트</h6>
                    <div class="_point_wrap">
                        <input style="width: 60%; float: left; margin-right: 15px;" type="text" name="use_point" autocomplete="off" value="0" disabled>
                        <a href="#" style="line-height: 23px; padding: 4px 10px; background-color: #333333; border-color: rgba(0, 0, 0, 0.1); border-width: 0px; color: #ffffff;">전액 사용</a>
                    </div>
                    <a>보유 포인트 <strong>0</strong></a>
                </div>
            </div>
            <div class="item_wrap">
                <div class="_fixed_wrap">
                    <div class="_payment_info_wrap">
                        <h6>최종 결제금액</h6>
                        <div class="pay_row">
                            <div class="col_ctr">
                                <p class="text-gray" style="margin-bottom: 3px;">상품</p>
                            </div>
                            <div class="col_ctr">
                                <p class="text-right">ㅇㅇㅇㅇ상품명이빈다</p>
                            </div>
                        </div>
                        <div class="pay_row">
                            <div class="col_ctr">
                                <p class="text-gray" style="margin-bottom: 3px;">참가비</p>
                            </div>
                            <div class="col_ctr">
                                <p class="text-right">49,000원</p>
                            </div>
                        </div>
                        <div class="pay_row">
                            <div class="col_ctr">
                                <p class="text-gray">포인트</p>
                            </div>
                            <div class="col_ctr">
                                <p class="text-right">0 P</p>
                            </div>
                        </div>
                        <div class="total_pay_wrap" style="display: flex; justify-content: space-between; border-top: 1px solid rgb(229, 229, 229); ">
                            <div class="total_pay" style="display: flex; padding-top: 10px;">총 신청 금액</div>
                            <div class="total_pay_amount" style="display: flex; /*border: 1px solid black;*/ line-height: 2.5; font-weight: 900; font-size: 15px;">49,000</div>
                        </div>
                    </div>
                </div>
                <div class="_payment_type_wrap">
                    <h6>결제방법</h6>
                </div>
                <div class="_agree_wrap">
                    <input type="checkbox" name="checkbox" id="checkbox">
                    <label for="checkbox">결제 및 개인정보 제3자 제공 동의</label>
                </div>
                <div class="_btn_start_payment_wrap">
                    <a href="#" class="_btn_start_payment">결제하기</a>
                </div>
            </div>
        </div>
    </section>
<%@ include file="../../common/footer.jsp" %>