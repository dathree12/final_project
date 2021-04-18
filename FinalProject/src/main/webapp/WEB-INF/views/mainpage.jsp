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
    <title>메인페이지</title>
     <link rel="stylesheet" href="${path}/css/common/mainpage.css">
</head>


<%@ include file="../views/common/header.jsp" %>
    <section id="main_container">
    
        <div id="high_div">

            <div id="inner_img_div">
			
            </div>
            <security:authorize access="isAnonymous()">
            <div id="inner_reco_div">
                <span id="inner_reco_div_span">추천 도서</span>
            <c:if test="${list != null}">
            	<c:forEach var="board" items="${list}">
		                <a href=""> 
		                   <div class="reco_div">
		                    <div class="reco_img_div">
		                   		   <a href="#" class="imgsize" id="reviewthumbnail_${board.brIsbn}" ></a>
		                  		   <p id="review-bookisbn_${board.brIsbn}" style="display:none"><c:out value="${board.brIsbn}"/></p>
		                    </div>
		                    <div class="reco_content">
		                       <div class="reco_content_title">
		                           <strong style="font-size: 0.8em;" id="review-booktitle_${board.brIsbn}"></strong>
		                       </div>  
		                       <div class="reco_content_ctt">
		                           <p class="reco_content_p" id="bookContents_${board.brIsbn}"> </p>
		                       </div> 
		                       <div class="reco_content_t">
		                           <p class="reco_content_p" id="bookauthors_${board.brIsbn}">저자 : </p>
		                           <p class="reco_content_p" id="bookpublisher_${board.brIsbn}">출판사 : </p>
		                           <p class="reco_content_p" id="bookSale_${board.brIsbn}">가격 : </p>
		                       </div> 
		                    </div>
		                   </div>
		                </a>
                	</c:forEach>
                </c:if>
            </div>
			</security:authorize>
			<security:authorize access="hasRole('USER')">
			<security:authentication property="principal" var="user"/>
            <div id="inner_reco_div">
                <span id="inner_reco_div_span">${user.name}님 추천 도서</span>
              <c:if test="${list != null}">
            	<c:forEach var="board" items="${list}">
		                <a href=""> 
		                   <div class="reco_div">
		                    <div class="reco_img_div">
		                   		   <a href="#" class="imgsize" id="reviewthumbnail_${board.brIsbn}" ></a>
		                  		   <p id="review-bookisbn_${board.brIsbn}" style="display:none"><c:out value="${board.brIsbn}"/></p>
		                    </div>
		                    <div class="reco_content">
		                       <div class="reco_content_title">
		                           <strong style="font-size: 0.8em;" id="review-booktitle_${board.brIsbn}"></strong>
		                       </div>  
		                       <div class="reco_content_ctt">
		                           <p class="reco_content_p" id="bookContents_${board.brIsbn}"> </p>
		                       </div> 
		                       <div class="reco_content_t">
		                           <p class="reco_content_p" id="bookauthors_${board.brIsbn}">저자 : </p>
		                           <p class="reco_content_p" id="bookpublisher_${board.brIsbn}">출판사 : </p>
		                           <p class="reco_content_p" id="bookSale_${board.brIsbn}">가격 : </p>
		                       </div> 
		                    </div>
		                   </div>
		                </a>
                	</c:forEach>
                </c:if>
            </div>
			</security:authorize>
			<security:authorize access="hasRole('ADMIN')">
			<security:authentication property="principal" var="user"/>
            <div id="inner_reco_div">
                <span id="inner_reco_div_span">${user.name}님 페이지 입니다.</span>
           
		                   
		                      
		                       
            </div>
			</security:authorize>
        </div>
        <br>
        <div id="middle_div_text"> 
            <span id="month_span">${month+""}</span><span> 월의 베스트 추천 도서</span>
        </div>
        <div id="middle_div">
            <div id="innner_container">
             <c:if test="${mBest != null}">
             <c:forEach var="best" items="${mBest}" varStatus="ct">
       			<p id="review-bestisbn_${best.brIsbn}" style="display:none"><c:out value="${best.brIsbn}"/></p>
                     <c:if test="${ct.count == 1}">
                    <div id="l_inner_cont">
                        <a href="">   
                            <div id="l_inner_cont_div">
                            		 <p class="best_p">${ct.count}st. </p>
                                	 <a href="#" id="mBestImage_${best.brIsbn}" ></a>
                                     <div class="l_text_tw"> <p class="l_text_title" id="mBestTitle_${best.brIsbn}"> </p></div>
                                     <div class="l_text_tw"> <p class="l_text_writer" id="mBestAuthors_${best.brIsbn}"> 저자 :   </p></div>   
                                     <p class="l_text_con" id="mBestContents_${best.brIsbn}"></p>
                            </div>
                        </a>
                    </div> 
                    </c:if> 
              	   <c:if test="${ct.count == 2}">
                       <div id="l_inner_cont">
	                        <a href="">   
	                            <div id="l_inner_cont_div">
	                            		 <p class="best_p">${ct.count}nd. </p>
	                                	 <a href="#" id="mBestImage_${best.brIsbn}" ></a>
	                                     <div class="l_text_tw"> <p class="l_text_title" id="mBestTitle_${best.brIsbn}"> </p></div>
	                                     <div class="l_text_tw"> <p class="l_text_writer" id="mBestAuthors_${best.brIsbn}"> 저자 :   </p></div>   
	                                     <p class="l_text_con" id="mBestContents_${best.brIsbn}"></p>
	                            </div>
	                        </a>
                    	</div>
                    </c:if>
                      <c:if test="${ct.count == 3}">
                       <div id="l_inner_cont">
	                        <a href="">   
	                            <div id="l_inner_cont_div">
	                            		 <p class="best_p">${ct.count}rd. </p>
	                                	 <a href="#" id="mBestImage_${best.brIsbn}" ></a>
	                                     <div class="l_text_tw"> <p class="l_text_title" id="mBestTitle_${best.brIsbn}"> </p></div>
	                                     <div class="l_text_tw"> <p class="l_text_writer" id="mBestAuthors_${best.brIsbn}"> 저자 :   </p></div>   
	                                     <p class="l_text_con" id="mBestContents_${best.brIsbn}"></p>
	                            </div>
	                        </a>
                    	</div>
                    </c:if>

                </c:forEach>
                </c:if>
             </div>
        </div>
        <br>
        <div id="row_div_text"> 
            <span> 장르별 추천 도서</span>
        </div>
        <nav class="mnav"> 
            <div id="me_menu">
            <ul class="nav_menu">
                <li><a href="">소설</a></li>
                <li><a href="">어린이/청소년</a></li>
                <li><a href="">경제/경영</a></li>
                <li><a href="">인문/사회/역사</a></li>
                <li><a href="">종교/역학</a></li>
                <li><a href="">자기개발</a></li>
            </ul>
        </div> 
        </nav>
        
        <div id="row_div">
            <div id="row_genre">
                <div class="me_genre_div">
                    <div class="genre">
                        <a href="">
                            <img src="${path}/images/바다.jpg"alt="" class="genre_img">
                            <div class="genre_title"><span>바다 도시의 아이들</span></div>
                            <div class="genre_content"><span>청소년 판타지 소설을 잘 읽는 편이 아닌데 왠지 모르게 끌렸다. 분량이 좀 되는 책인데 청소년 판타지라 그런지 가독성이 상당히 좋다. 어떻게 보면 전형적인 청소년 판타지의 설정을 따라가는데 세계관이 흥미롭다. 가파른 산 위에 세워진 도시, 바다 위에 우뚝 솟은 산이다. 뭐지? 하고 읽다보면 이 세계가 대홍수 이후 생존한 사람들이 높은 산 위 도시에 살고 있음을 알 수 있다. 그</span></div>
                        </a>
                    </div>
                    <div class="genre">
                        <a href="">
                            <img src="${path}/images/바다.jpg" alt="" class="genre_img">
                            <div class="genre_title"><span>바다 도시의 아이들</span></div>
                            <div class="genre_content"><span>청소년 판타지 소설을 잘 읽는 편이 아닌데 왠지 모르게 끌렸다. 분량이 좀 되는 책인데 청소년 판타지라 그런지 가독성이 상당히 좋다. 어떻게 보면 전형적인 청소년 판타지의 설정을 따라가는데 세계관이 흥미롭다. 가파른 산 위에 세워진 도시, 바다 위에 우뚝 솟은 산이다. 뭐지? 하고 읽다보면 이 세계가 대홍수 이후 생존한 사람들이 높은 산 위 도시에 살고 있음을 알 수 있다. 그</span></div>
                        </a>
                    </div>
                </div>
                <div class="me_genre_div">
                    <div class="genre">
                        <a href="">
                            <img src="${path}/images/바다.jpg" alt="" class="genre_img">
                            <div class="genre_title"><span>바다 도시의 아이들</span></div>
                            <div class="genre_content"><span>청소년 판타지 소설을 잘 읽는 편이 아닌데 왠지 모르게 끌렸다. 분량이 좀 되는 책인데 청소년 판타지라 그런지 가독성이 상당히 좋다. 어떻게 보면 전형적인 청소년 판타지의 설정을 따라가는데 세계관이 흥미롭다. 가파른 산 위에 세워진 도시, 바다 위에 우뚝 솟은 산이다. 뭐지? 하고 읽다보면 이 세계가 대홍수 이후 생존한 사람들이 높은 산 위 도시에 살고 있음을 알 수 있다. 그</span></div>
                        </a>
                    </div>
                    <div class="genre">
                        <a href="">
                            <img src="${path}/images/바다.jpg" alt="" class="genre_img">
                            <div class="genre_title"><span>바다 도시의 아이들</span></div>
                            <div class="genre_content"><span>청소년 판타지 소설을 잘 읽는 편이 아닌데 왠지 모르게 끌렸다. 분량이 좀 되는 책인데 청소년 판타지라 그런지 가독성이 상당히 좋다. 어떻게 보면 전형적인 청소년 판타지의 설정을 따라가는데 세계관이 흥미롭다. 가파른 산 위에 세워진 도시, 바다 위에 우뚝 솟은 산이다. 뭐지? 하고 읽다보면 이 세계가 대홍수 이후 생존한 사람들이 높은 산 위 도시에 살고 있음을 알 수 있다. 그</span></div>
                        </a>
                    </div>
                </div>
            </div> 
            <div id="genre_btn">
                <a href="" id="genre_btn_a">
                    <span>인문 / 사회 / 역사 게시판 가기</span>
                </a>  
            </div>    
        </div>
         <br>
    </section>
    
<%@ include file="../views/common/footer.jsp" %>

	<script>
	 $(document).ready(function () {
		 	<c:forEach var="board" items="${list}">
		 	 var isbn = document.getElementById("review-bookisbn_${board.brIsbn}").innerText
		 	 
             $.ajax({
                 method: "GET",
                 url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                 data: { query: isbn },
                 headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
             })
                 .done(function (msg) {
                     $("#reviewthumbnail_${board.brIsbn}").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                     $("#review-booktitle_${board.brIsbn}").append(msg.documents[0].title)
                     $("#bookContents_${board.brIsbn}").append(msg.documents[0].contents)
                     $("#bookSale_${board.brIsbn}").append(msg.documents[0].sale_price)
                     $("#bookpublisher_${board.brIsbn}").append(msg.documents[0].publisher)
                     $("#bookauthors_${board.brIsbn}").append(msg.documents[0].authors)
                 });
             </c:forEach> 
		 	<c:forEach var="best" items="${mBest}">
		 	 var isbn = document.getElementById("review-bestisbn_${best.brIsbn}").innerText
		 	 
             $.ajax({
                 method: "GET",
                 url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                 data: { query: isbn },
                 headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
             })
                 .done(function (msg) {
                     $("#mBestImage_${best.brIsbn}").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                     $("#mBestTitle_${best.brIsbn}").append(msg.documents[0].title)
                     $("#mBestContents_${best.brIsbn}").append(msg.documents[0].contents)
                     $("#mBestSale_${best.brIsbn}").append(msg.documents[0].sale_price)
                     $("#mBestPublisher_${best.brIsbn}").append(msg.documents[0].publisher)
                     $("#mBestAuthors_${best.brIsbn}").append(msg.documents[0].authors)
                 });
             </c:forEach> 

     });
	</script>
