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
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ path }/css/board/bf_style/bf_agreement.css" type="text/css">
    
    <title>책스초코 펀딩신청 약관동의 확인</title>
</head>

<body>
<%@ include file="../../common/header.jsp" %>

    <h1 id="terms_top">책스초코 펀딩 프로젝트 이용약관</h1>

	<hr>
    <div class="terms_container">
        <h2>전체 동의 </h2>
        <p> 책스초코는 검토절차를 통해 작성한 프로젝트가 책스초코의 정책을 준수하는지 검토하고 있습니다. <br>
            아래 사항들을 확인 후 프로젝트를 올려주세요.</p>
        <br>
    
        <div id="terms_check">
            <input type="checkbox" id="checkbox">
            <label for="checkbox"><span>모두 동의합니다.</span></label>
        </div>
        <div class="terms_box">
            <h4>[필수] 약관 동의1</h4>
            <div class="terms_list"> <br>
                <p>이미 시판된 제품, 현금이나 지분등의 수익제공, 단순 기부 등의 기준에 맞지 않는 선물을 제공하지 않습니다.</p>
            </div>
                <span>동의하십니까?</span> <input id="agree_service_check0" name="agree_service_check[]" fw-filter="/1/" fw-label="이용약관 동의" fw-msg="이용약관에 동의 하세요" class="ec-base-chk" value="1" type="checkbox"><label for="agree_service_check0">동의함</label>
        </div>
        
        <div class="terms_box">
            <h4>[필수] 약관 동의2</h4>
            <div class="terms_list"> <br>
                <p>창작자의 신분증 혹은 사업자등록증, 은행 계좌, 연락 가능한 번호가 있습니다.</p>
            </div>
                <span>동의하십니까?</span> <input id="agree_service_check1" name="agree_service_check[]" fw-filter="/1/" fw-label="이용약관 동의" fw-msg="이용약관에 동의 하세요" class="ec-base-chk" value="1" type="checkbox"><label for="agree_service_check1">동의함</label>
            </div>
        
        <div id="terms_btn_div">
            <button id="terms_btn" >다음으로</button>
        </div>
    </div>

	<script>
		$('#checkbox').on('click',() => {
			
		  	if($('#checkbox').is(":checked") == false){
				$('#agree_service_check0').prop("checked", false);
			 	$('#agree_service_check1').prop("checked", false);
		  	} else {
		  		$('#agree_service_check0').prop("checked", true);
				$('#agree_service_check1').prop("checked", true);
		  	}
		});
	  
		$("#terms_btn").on("click", () => {
			if(($("input:checkbox[id=agree_service_check0]:checked").length) + ($("input:checkbox[id=agree_service_check1]:checked").length) != 2){
				alert("동의 후 버튼을 눌러주세요.~~");
				
				return false;
			} else {
				location.href=('${path}/board/bf_board/bf_boardWrite');
			}
		})
	</script>

<%@ include file="../../common/footer.jsp" %>
