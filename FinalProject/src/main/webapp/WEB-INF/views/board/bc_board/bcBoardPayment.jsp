<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../common/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardPayment.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
</head>
    <section class="payment-list-section-1th payment-wrap">
        <div class="shop-title">
            결제하기
        </div>
        <div class="container_wrap">
            <div class="order_wrap">
                <div class="order_wrap_detail">
                    <h6>주문 상품 정보</h6>
                    
  			       	<input type="hidden" name="userNo" value="${ user.userNo }" size="50px" readonly>
	                <input type="hidden" name="userId" value="${ user.userId }" size="50px" readonly>
	                <input type="hidden" name="userPhone" value="${ user.userPhone }" size="50px" readonly>                        
	                <input type="hidden" name="name" value="${ user.name }" size="50px" readonly>                        
	                <input type="hidden" name="userEmail" value="${ user.userEmail }" size="50px" readonly>                        
	                <input type="hidden" name="userAddress" value="${ user.userAddress }" size="50px" readonly>                        
	                <input type="hidden" name="bcNo" value="${ clubBoard.bcNo }" size="50px" readonly>                      
	                <input type="hidden" name="bcPrice" value="${ clubBoard.bcPrice }" size="50px" readonly>           
                    
                    <div class="row">
                        <div class="shop_item_thumb">
                            <a href="#">
                                <div class="product_img_wrap">
                                    <img src="${ path }/images/test-img.jpg" alt="주문상품 이미지">
                                </div>
                                <div class="product_info_wrap">
                                    <span class="shop_item_title">[온라인] <c:out value="${clubBoard.bcTitle}"/></span>
                                    <div class="shop_item_opt">
                                        <p>
                                            <em style="border: 1px solid lightgrey; color: lightgrey; font-size: 9px; padding: 2px; margin-right: 2px;">필수</em>
                                            <strong style="color: #555555;">선택</strong>
                                            <span style="color: #555555;">: <c:out value="${clubBoard.bcTitle}"/></span>
                                        </p>
                                    </div>
                                    <div class="shop_item_pay">
                                        <span><b><fmt:formatNumber value="${clubBoard.bcPrice}" />원</b></span>
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
                                    <c:out value="${ user.name }"></c:out>
                                </div>
                                <div class="order-phone">
                                    <c:out value="${ user.userPhone }"></c:out>
                                </div>
                                <div class="order-email">
                                    <c:out value="${ user.userAddress }"></c:out>
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
                                <p class="text-right"><c:out value="${clubBoard.bcTitle}"/></p>
                            </div>
                        </div>
                        <div class="pay_row">
                            <div class="col_ctr">
                                <p class="text-gray" style="margin-bottom: 3px;">참가비</p>
                            </div>
                            <div class="col_ctr">
                                <p class="text-right"><b><fmt:formatNumber value="${clubBoard.bfPrice}" />원</b></p>
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
                            <div class="total_pay_amount" style="display: flex; /*border: 1px solid black;*/ line-height: 2.5; font-weight: 900; font-size: 15px;"><b><fmt:formatNumber value="${board.bfPrice}" />원</b></div>
                        </div>
                    </div>
                </div>
                <div class="_payment_type_wrap">
                    <h6>결제방법</h6>
                    <a href="${ path }/common/payment"><img src="${ path }/images/payment_icon_yellow_small.png" alt="임시버튼"></img></a>
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
            <script>
    	$("._btn_start_payment").on('click', function iamport(){
    		if(($("input:checkbox[id=checkbox]:checked").length) != 1){
				alert("동의 후 결제버튼을 눌러주세요.");
				
				return false;
			} else {
				//가맹점 식별코드
	    		IMP.init('');
	    		IMP.request_pay({
	    		    pg : 'kakao',
	    		    pay_method : 'card',
	    		    merchant_uid : 'merchant_' + new Date().getTime(),
	    		    name : '${board.bfTitle}' , //결제창에서 보여질 이름
	    		    amount : ${board.bfPrice}, //실제 결제되는 가격
	    		    buyer_email : '${user.userEmail}',
	    		    buyer_name : '${user.name}',
	    		    buyer_tel : '${user.userPhone}',
	    		    buyer_addr : '${user.userAddress}'
	    		    /* buyer_postcode : '123-456' */
	    		}, function(rsp) {
	    			console.log(rsp);
	    		    if ( rsp.success ) {
	    		    	var msg = '결제가 완료되었습니다.';
	    		        /* msg += '고유ID : ' + rsp.imp_uid;
	    		        msg += '상점 거래ID : ' + rsp.merchant_uid;
	    		        msg += '결제 금액 : ' + rsp.paid_amount;
	    		        msg += '카드 승인번호 : ' + rsp.apply_num; */
	    		        
	    		        document.getElementById('paymentSave').submit();
	    		    } else {
	    		    	var msg = '결제에 실패하였습니다.';
	    		        /* msg += '에러내용 : ' + rsp.error_msg; */
	    		        
	    		    	location.href=('${path}/board/bc_board/bcBoardDetail?bcNo=${board.bcNo}');
	    		    }
	    		    alert(msg);
	    		});
			}
    	});	
  	</script>
    </section>
<%@ include file="../../common/footer.jsp" %>