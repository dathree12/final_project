<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <script src="js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_payment.css">
    <title>책스초코 북펀딩 결제페이지</title>
</head>

<body>
    <div class="fd_payment_body">
        <section class="payment-list-section-1th">
            <div class="shop-title">
                책스초코 북펀딩 결제하기
            </div>
            <div class="container_wrap">
                <div class="order_wrap">
                    <div class="order_wrap_detail">
                        <h6>주문 상품 정보</h6>
                        <div class="row">
                            <div class="shop_item_thumb">
                                <a href="#">
                                    <div class="product_img_wrap">
                                        <img src="./image/book.jpg" alt="주문상품 이미지" width="100px" height="150px">
                                    </div>
                                    <div class="product_info_wrap">
                                        <br>
                                        <br>
                                        <span class="shop_item_title">책이름이 들어가는 곳입니다. 책책책</span>
                                        <div class="shop_item_opt">
                                            <p>
                                                <!-- <em>필수</em> -->
                                                <strong>수량</strong>
                                                : 책이름이 들어가는 곳입니다. 책책책 - #개
                                            </p>
                                        </div>
                                        <div class="shop_item_pay">
                                            <span>100,000원</span>
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
                                        북펀딩
                                    </div>
                                    <div class="order-phone">
                                        01011111111
                                    </div>
                                    <div class="order-email">
                                        bookschoco@asdf.asdf
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
                                    <p class="text-gray">상품</p>
                                </div>
                                <div class="col_ctr">
                                    <p class="text-right">책이름</p>
                                </div>
                            </div>
                            <div class="pay_row">
                                <div class="col_ctr">
                                    <p class="text-gray">가격</p>
                                </div>
                                <div class="col_ctr">
                                    <p class="text-right">100,000원</p>
                                </div>
                            </div>
                            <div class="pay_row">
                                <div class="col_ctr">
                                    <p class="text-gray">포인트</p>
                                </div>
                                <div class="col_ctr">
                                    <p class="text-right">10,000P</p>
                                </div>
                            </div>
                            <div class="total_pay_wrap">
                                <div class="col_ctr">
                                    <p class="total_pay">결제금액</p>
                                </div>
                                <div class="total_pay_amount">
                                    <p class="text-right">90,000원</p>
                                </div>
                            </div>                        
                            <div class="">
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
                        <a href="#" class="_btn_start_payment" style="color: white;">결제하기</a>
                    </div>
                </div>
            </div>
        </section>
    </div>

<%@ include file="../../common/footer.jsp" %>