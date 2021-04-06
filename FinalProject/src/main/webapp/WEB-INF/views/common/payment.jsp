<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 결제가 필요한 곳에 아임포트의 한줄 자바스크립트 라이비러리 추가 성공하면 공통으로 쓸 head에 추가하면 좋을듯 -->
<script src="${ path }/js/jquery-3.5.1.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function() {
    	var IMP = window.IMP;
    	IMP.init('imp24145576');
    	
    	IMP.request_pay({
    		pg : 'kakaopay',
    		pay_method : 'card',
    		merchant_uid : 'merchant_' + new Date().getTime(),
    		name : '주문명:결제테스트',
    		amount : 140000,
    		buyer_email : 'iamport@siot.do',
    		buyer_name : '구매자이름',
    		buyer_tel : '010-9982-8939',
    		buyer_addr : '서울특별시 강남구 삼성동',
    		buyer_postcode : '123-456',
    		// m_redirect_url : 'http://www.naver.com'
    	}, function(rsp) {
    		if ( rsp.success ) {
    			$.ajax({
    				url: "/payments/complete",
    				type: 'POST',
    				dataType: 'json',
    				data: {
    					imp_uid : rsp.imp_uid
    				}
    			}).done(function(data) {
    				if( everythigs_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '고유ID : ' + rsp.imp_uid;
		    			msg += '상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		
		    			alert(msg);
    				} else {
                        // [3] 아직 제대로 결제가 되지 않았습니다.
                        // [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    				}	
    			});
    			// 성공시 이동할 페이지
    			location.href='${ path }/common/paySuccess?msg=' + msg;
    		} else {
    			var msg = '결제에 실패하였습니다.';
    			msg += '에러내용 : ' + rsp.error_msg;
    			// 실패시 이동할 페이지
    			location.href='${ path }/common/payFail';
	    		alert(msg);
    		}
    	});
    });
    </script>
</body>
</html>