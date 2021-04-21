<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="../../common/header.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>디테일 뷰</title>
    <link rel="stylesheet" href="${ path }/css/board/main_style/mainBoardDetail.css">
</head>

    <section>
            <div class="dt_container">
                <div>
                    <div class="dt_info">
                        <div class="dt_img">
	                         <p id="bookimage"> </p> 
	                         <p id="detailisbn" style="display:none"><c:out value="${list}"/></p>
                        </div>
                        <div class="dt_title" >
                            <p id="bookTitle" ></p>
                            <p id="bookauthors">저자 : </p>
                            <p id="bookpublisher">출판사 : </p>
                            <p id="bookSale">가격 : </p>
                         	<span>판매가 : <span id="booksale_price" style="color: red"></span></span>  
                            <p id="bookstatus">판매상태 : </p> 
                    		<input type="hidden" id="bookurl">
                        </div>
                    </div>

                    <div class="dt_content">
                       <p id="bookContent"> </p>
                    </div>
                    
                    <br> <br>
                    <div class="de_btn_div"> 
                       <button class="de_btn" id="search_bt" type="button" >책 보러가기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		               <button class="de_btn"  type="button" onclick="location.href=('${ path }/')">뒤로가기</button>
                 	</div>
                </div>
            </div>
    </section>
 <%@ include file="../../common/footer.jsp" %>  
 
 <script>
 $(document).ready(function () {
	 
	 	 var isbn = document.getElementById("detailisbn").innerText
	 	 
      $.ajax({
          method: "GET",
          url: "https://dapi.kakao.com/v3/search/book?target=isbn",
          data: { query: isbn },
          headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
      })
          .done(function (msg) {
              $("#bookimage").append("<img src='" + msg.documents[0].thumbnail + "'/>");
              $("#bookTitle").append(msg.documents[0].title)
              $("#bookContent").append(msg.documents[0].contents)
              $("#bookSale").append(msg.documents[0].price)
              $("#bookpublisher").append(msg.documents[0].publisher)
              $("#bookurl").append(msg.documents[0].url)
              $("#bookauthors").append(msg.documents[0].authors)
              $("#bookstatus").append(msg.documents[0].status)
              $("#booksale_price").append(msg.documents[0].sale_price)
          });
	 	 
	  $("#search_bt").on('click', () => { 
		let url = $("#bookurl").text();	
		
		window.open(url);
	
	 	  });
 });
 
 </script>