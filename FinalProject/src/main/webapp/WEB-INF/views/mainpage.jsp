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
     <link rel="stylesheet" href="${path}/css/common/mainpage.css" type="text/css">
     <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
     <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
</head>


<%@ include file="../views/common/header.jsp" %>
    <section id="main_container">
    
        <div id="high_div">

            <div id="inner_img_div">
			
            </div>
            <div id="inner_reco_div">
                <span id="inner_reco_div_span">111 님 추천 도서</span>
                <a href=""> 
                   <div class="reco_div">
                    <div class="reco_img_div">mfjflTjqjfla
                        <img src="${path}/images/바다.jpg" alt="" class="img_size">
                    </div>
                    <div class="reco_content">
                       <div class="reco_content_title">
                           <strong style="font-size: 16px;">쉑쉑버거</strong>
                       </div>  
                       <div class="reco_content_ctt">
                            <span>쉑쉑버거는 맛이 너무 좋습니다 무조건 먹게되면 쉑쉑버거는 맛이 너무 좋습니다</span>
                       </div> 
                    </div>
                   </div>
                </a>
                <a href=""> 
                    <div class="reco_div">
                     <div class="reco_img_div">
                         <img src="${path}/images/바다.jpg" alt="" class="img_size">
                     </div>
                     <div class="reco_content">
                        <div class="reco_content_title">
                            <strong style="font-size: 16px;">쉑쉑버거</strong>
                        </div>  
                        <div class="reco_content_ctt">
                             <span>쉑쉑버거는 맛이 너무 좋습니다 쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다쉑쉑버거는 맛이 너무 좋습니다</span>
                        </div> 
                     </div>
                    </div>
                 </a>
                 <a href=""> 
                    <div class="reco_div">
                     <div class="reco_img_div">
                         <img src="${path}/images/바다.jpg" alt="" class="img_size">
                     </div>
                     <div class="reco_content">
                        <div class="reco_content_title">
                            <strong style="font-size: 16px;">쉑쉑버거</strong>
                        </div>  
                        <div class="reco_content_ctt">
                             <span>쉑쉑버거는 맛이 너무 좋습니다 무조건 먹게되면  of  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo </span>
                        </div> 
                     </div>
                    </div>
                 </a>


            </div>

        </div>
        <br>
        <div id="middle_div_text"> 
            <span> 4월의 베스트 추천 도서</span>
        </div>
        <div id="middle_div">
            <div id="innner_container">
                    <div id="l_inner_cont">
                        <a href="">   
                            <div id="l_inner_cont_div">
                                <div id="l_inner_cont_count">1st.</div>
                                <img src="${path}/images/바다.jpg" alt="" id="l_cont_img">
                                        <div class="l_text_tw"> <span id="l_text_title"> 바다 도시의 아이들  </span></div>
                                        <div class="l_text_tw"> <span id="l_text_writer"> 저자 : 아무개  </span></div>   
                                         <p id="l_text_con">가벼운 마음으로 읽으려고 선택한 책이다. 청소년 판타지 소설을 잘 읽는 편이 아닌데 왠지 모르게 끌렸다. 분량이 좀 되는 책인데 청소년 판타지라 그런지 가독성이 상당히 좋다. 어떻게 보면 전형적인 청소년 판타지의 설정을 따라가는데 세계관이 흥미롭다. 가파른 산 위에 세워진 도시, 바다 위에 우뚝 솟은 산이다. 뭐지? 하고 읽다보면 이 세계가 대홍수 이후 생존한 사람들이 높은 산 위 도시에 살고 있음을 알 수 있다. 그...</p>
                            </div>
                        </a>
                         
                    </div>   
                <div id="r_inner_cont_se">
                    <a href=""> 
                        <div class="r_inner_cont">
                            <div class="r_inner_img">
                                <div class="r_inner_cont_count">2nd.</div>
                                <img src="${path}/images/바다.jpg" alt="" >
                            </div>
                            <div class="r_inner_con">
                                <div class="r_text_tw"><span class="r_text_title">코스모스</span></div>
                                <div class="r_text_tw"><span  class="r_text_writer">저자 : 아무개 </span> </div>
                                <div class="r_text_text">
                                    <span>칼 세이건(Carl Sagan, 1934~1996)이라고 하면 대부분 <코스모스(Cosmos)>(1980)라는 이름의 책이나 다큐멘터리를 떠올린다.의 저자인 앤 드루얀(Ann Druyan, 1949~ )은 바로 그 칼 세이건의 아내이자 천문학자인 스티븐 소터(Steven Soter, 1943~ )와 함께 <코스모스>의 원고를 함께 작성한 사람이다.

                                    그래서일까? 1996년 칼 세이건이 사망한 후에도 그녀는 그의 유지를 이어받아 스티븐 소터와 함께 2014년 <코스모스>(1980)의 업데이트 버전이라고 할 수 있는 에 대한 시나리오를 작성했을 뿐 아니라 제작 및 감독에 참여했다.
                                    
                                    그렇기에 40년의 시간이 흐른 2020년에 앤 드루얀이 칼 세이건의 <코스모스>와 같은 방식으로을 출간하고 동명의 다큐멘터리를 제작한 것은 어쩌면 당연한 결과일지도 모른다.</span>
                                </div>
                            </div>
                        </div> 
                    </a>
                    <br>
                    <a href=""> 
                        <div class="r_inner_cont">
                            <div class="r_inner_img">
                                <div class="r_inner_cont_count">3rd.</div>
                                <img src="${path}/images/바다.jpg" alt="" >
                            </div>
                            <div class="r_inner_con">
                                <div class="r_text_tw"><span class="r_text_title">코스모스</span></div>
                                <div class="r_text_tw"><span  class="r_text_writer">저자 : 아무개 </span> </div>
                                <div class="r_text_text">
                                    <span>칼 세이건(Carl Sagan, 1934~1996)이라고 하면 대부분 <코스모스(Cosmos)>(1980)라는 이름의 책이나 다큐멘터리를 떠올린다. 의 저자인 앤 드루얀(Ann Druyan, 1949~ )은 바로 그 칼 세이건의 아내이자 천문학자인 스티븐 소터(Steven Soter, 1943~ )와 함께 <코스모스>의 원고를 함께 작성한 사람이다.

                                    그래서일까? 1996년 칼 세이건이 사망한 후에도 그녀는 그의 유지를 이어받아 스티븐 소터와 함께 2014년 <코스모스>(1980)의 업데이트 버전이라고 할 수 있는 에 대한 시나리오를 작성했을 뿐 아니라 제작 및 감독에 참여했다.
                                    
                                    그렇기에 40년의 시간이 흐른 2020년에 앤 드루얀이 칼 세이건의 <코스모스>와 같은 방식으로을 출간하고 동명의 다큐멘터리를 제작한 것은 어쩌면 당연한 결과일지도 모른다.</span>
                                </div>
                            </div>
                        </div> 
                    </a>
                </div>
             </div>
        </div>
        <br>
        <div id="row_div_text"> 
            <span> 장르별 추천 도서</span>
        </div>
        <nav class="nav"> 
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
