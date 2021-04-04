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
    <script src="../../js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
</head>
<%@ include file="../../common/header.jsp" %>
    <section>
        <!-- content top -->
        <article class="detailArea">
            <div class="sub_detailArea">
                <div class="thumbnail">
                    <div class="_d_name">
    
                    </div>
                </div>
                <!-- info : title -->
                <div class="infoArea__box">
                    <div class="infoArea">
                        <h1 id="_deadline"><span>99</span>일 남음</h1>
                        <h2 style="margin-top: 10px;">샘플상품24</h2>
                        <div class="sub_title" style="margin-top: 5px;">
                            <span>무심한 듯 세련된, 강인함과 여림, 부드러움과 무거움. 균형 잡힌 스타일의 데일리룩 아이템을 제안합니다.</span>
                        </div>
                    </div>
                    
                    <div class="box">
                        <!-- info : subtitle, schedule, price -->
                        <ul class="box_1th">
                            <p style="margin-top: 50px;">4주 읽기습관 28기 (자유도서, 고정리더)</p>
                            <p style="font-size: 30px; margin: 0;"><b>69,000원</b></p>
                        </ul>
                        <!-- -------------------------------------- -->
                        <hr>
                        <!-- info : schedule select box -->
                        <table>
                            <tr>
                                <p style="font-size: 10px;"><strong>선택*</strong></p>
                                <select name="_schedule" id="_schedule">
                                    <option value="">선택 (필수)</option>
                                    <option value="">(화) 3.13 ~ 3.28 / 4주간</option>
                                    <option value="">(수) 3.14 ~ 3.29 / 4주간</option>
                                </select>
                            </tr>
                        </table>
                        <!-- -------------------------------------- -->
                        <hr>
                        <!-- info : button -->
                        <div class="ec-base-button">
                            <div class="_d_btn_1th"> 
                                <input type="submit" value="바로구매하기">
                            </div>
                            <div class="_d_btn_2th">
                                <input type="submit" value="장바구니" id="_btn_cart">
                                <input type="submit" value="관심상품" id="_btn_likely">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>

        <!-- contents middle -->
        <article id="prdDetail" class="ec-base-tab">
            <ul class="d_menu">
                <li class="selected" style="border: 1px solid #999; z-index: 1; border-bottom: 0;"><a name="tag1" href="#tag1" style="color: #000;">상세정보</a></li>
                <li style="border-left: 0;"><a href="#tag2">참여 후기</a></li>
                <li><a href="#tag2">Q&A</a></li>
            </ul>
            <div class="cont">
                <img src="${ path }/images/detail.png" alt="">
            </div>
        </article>

        <!-- contents bottom -->
        <article id="prdReview" class="ec-base-tab">
            <ul class="d_menu">
                <li><a href="#tag1">상세정보</a></li>
                <li class="selected" style="border: 1px solid #999; z-index: 1; border-bottom: 0;"><a name="tag2" href="#tag2" style="color: #000;">참여 후기</a></li>
                <li style="border-left: 0;"><a href="#tag3">Q&A</a></li>
            </ul>
            <div class="board">
                <div class="xans-board-title">
                    <div class="title">
                        <h2>
                            <font style="color: #555555;">참여 후기</font>
                        </h2>
                    </div>
                    <p class="imgArea"></p>
                </div>
                <div class="xans-product-review">
                    <div class="typeList">
                        <table border="1">
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 150px;">
                                <col style="width: auto;">
                                <col style="width: 150px;">
                            </colgroup>
                            <tbody class="center">
                                <tr class="xans-record-">
                                    <td>1</td>
                                    <td class="thumb_photo">
                                        <img src="${ path }/images/club-test.jpg" alt="">
                                    </td>
                                    <td>
                                        <ul class="d_review_cont">
                                            <li>
                                                <a href="#">만족</a>
                                            </li>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="d_review_info">
                                            <li>
                                                <span> 대표 관리자</span>
                                                <span>2019-04-15</span>
                                                <span>hit 13</span>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr id="product-review-read">
                                    <td colspan="4">
                                        <div class="view">
                                            <div id="ec-ucc-media-box-8">
                                                <p></p>
                                                <div class="fr-view fr-view-article">
                                                    <p>받아보니 훨씬 좋네요~</p>
                                                </div>
                                                <p></p>
                                                <p>
                                                    <img src="" alt="">
                                                    <br>
                                                </p>
                                                <p class="ec-base-button">
                                                    <span class="gLeft"></span>
                                                </p>
                                            </div>
                                        </div>
                                        <ul class="boardComment">
                                            <li>
                                                <strong class="name"> 대표 관리자</strong>
                                                <span class="date">2019-04-15 16:31:55</span>
                                                <p class="comment">
                                                    <span id="comment_contents1">Thank you~~ :)</span>
                                                </p>
                                            </li>
                                        </ul>
                                        <form name="commentSecretForm_4" id="commentSecretForm_4" style="display: none;" action="">
                                            <div class="commentSecret">
                                                <p></p>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <p class="ec-base-button typeBoarder">
                    <span class="gRight">
                        <a href="#">
                            <span class="-cbtn -c-medium -c-black">
                                상품후기쓰기
                            </span>
                        </a>
                        <a href="#">
                            <span class="-cbtn -c-medium">
                                모두보기
                            </span>
                        </a>
                    </span>
                </p>
            </div>
            <div class="pageBar" style="padding: 30px 0; text-align: center; line-height: 0;">
                <a href="#" class="first">«</a>
                <a href="#" class="prev">‹</a>
                <a href="#" class="p_number">1</a>
                <a href="#" class="next">›</a>
                <a href="#" class="last">»</a>
            </div>
        </article>

        <article id="prdQnA" class="ec-base-tab grid5 ">
            <ul id="p_menu" class="p_menu">
                <li>
                    <a href="#tag1">상세정보</a>
                </li> 
                <li>
                    <a href="#tag2">참여 후기</a></li>
                <li class="selected">
                    <a name="tag3" href="#tag3" style="color: #000;">Q&A</a>
                </li>
            </ul>
            <div class="board">
                <div class="title">
                    <h2 style="font-size: 14px; font-weight: normal;">
                        <font style="color: 333333;">Q&A</font>
                    </h2>
                </div>
                <p class="imgArea"></p>
                <table class="qna_table" style="border: 1px solid #f1f1f1;">
                    <thead>
                        <tr style="height: 41px; background-color: rgb(251, 250, 250);">
                            <th scope="col" style="width: 70px;">번호</th>
                            <!-- <th scope="col">카데고리</th> -->
                            <th scope="col" style="width: 844px;">제목</th>
                            <th scope="col" style="width: 130px;">작성자</th>
                            <th scope="col" style="width: 100px;">작성일</th>
                            <th scope="col" style="width: 55px;">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="center" style="height: 45px;">
                            <td>2</td>
                            <td style="text-align: left;">상품문의 테스트</td>
                            <td>대표 관리자</td>
                            <td>2019-04-15</td>
                            <td>20</td>
                        </tr>
                    </tbody>
                </table>
                <p class="review_button">
                    <span class="gRight">
                        <a href="#">
                            <span class="-cbtn -c-medium -c-black">
                                상품후기쓰기
                            </span>
                        </a>
                        <a href="#">
                            <span class="-cbtn -c-medium">
                                모두보기
                            </span>
                        </a>
                    </span>
                </p>
            </div>
            <div class="pageBar" style="padding: 30px 0; text-align: center; line-height: 0;">
                <a href="#" class="first">«</a>
                <a href="#" class="prev">‹</a>
                <a href="#" class="p_number">1</a>
                <a href="#" class="next">›</a>
                <a href="#" class="last">»</a>
            </div>
        </article>
    </section>
<%@ include file="../../common/footer.jsp" %>