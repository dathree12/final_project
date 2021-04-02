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
 <link rel="stylesheet" href="${path}/css/common/agreement/userGuide.css" type="text/css">
 <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
 <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="../header.jsp" %>

         <h1 class="terms_agree">이용 안내</h1>
	    <hr>
        <div class="agree_div">
        <h3>회원가입 안내</h3>
        [회원가입] 메뉴를 통해 이용약관, 개인정보보호정책 동의 및 일정 양식의 가입항목을 기입함으로써 회원에
        가입되며, 가입 즉시 서비스를 무료로 이용하실 수 있습니다.<br>
        <h3>결제안내</h3>
                고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
              정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
              <br>
              무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
              주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
              않은 주문은 자동취소 됩니다. <br>
     
        <h3>배송안내</h3>
                    <ul>
        <li>배송 방법 : 택배</li>
                        <li>배송 지역 : 전국지역</li>
                        <li>배송 비용 : 무료 : 주문 금액에 상관없이 배송비는 무료입니다.</li>
                        <li>배송 기간 : 3일 ~ 7일</li>
                    </ul>
       - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
            고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>

        <h3>교환/반품안내</h3>
        <b>교환 및 반품이 가능한 경우</b><br>
        - 상품을 공급 받으신 날로부터 7일이내 
        
        <b>교환 및 반품이 불가능한 경우</b><br>
        - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
        &nbsp;&nbsp;포장 등을 훼손한 경우는 제외<br>
        - 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>

        - 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 <br>
        - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
        - 복제가 가능한 상품등의 포장을 훼손한 경우<br>
        &nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 상담을 이용해 주시기 바랍니다.)<br>
        <br>
        ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
   
      
        <h3>환불안내</h3>
                     환불시 반품 확인여부를 확인한 후 3영업일 이내에 결제 금액을 환불해 드립니다. <br>
                    신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.<br>
                    (단, 신용카드 결제일자에 맞추어 대금이 청구 될수 있으면 이경우 익월 신용카드 대금청구시 카드사에서 환급처리됩니다.)
    </div>
        <div class="agree_btn_div">
            <button class="agree_btn" onclick="location.href='${path}/'">메인화면 가기</button>
        </div>
		 <br>

<%@ include file="../footer.jsp" %>