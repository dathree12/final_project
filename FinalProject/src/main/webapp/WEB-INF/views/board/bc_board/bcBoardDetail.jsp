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
    <link rel="stylesheet" href="${ path }/css/board/bc_board/bcBoardDetail.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
</head>
    <section class="propose-list-section-1th">
        <!-- 제목(1), 카테고리(3) -->
        <article class="headcategory">
            <div class="title">
                <h2>
                    <span>BOOK CLUB</span>
                </h2>
            </div>
            <ul class="menuCategory">
                <li><a href="#">전체 클럽</a></li>
                <li><a href="#">모집 중인 클럽</a></li>
                <li><a href="#">클럽 제안하기</a></li>
            </ul>
        </article>

        <!-- 소제목(1), 소제목 cont(1) -->
        <article class="propose-list-section-2th">
            <div class="sub-title-1th">
                <h2>
                    <font>제안서 신청</font>
                </h2>
            </div>
            <div class="sub-title-2th">
                <h4>
                    <span>제안서를 작성해주시면 운영진이 확인 후 피드백 드립니다</span>
                </h4>
            </div>
        </article>

        <!-- total, list board -->
        <article class="propose-list-section-3th">
            <div class="total_count">
                <h3>total&nbsp;&nbsp;<span>0</span></h3>
            </div>
            <table >
                <!-- <caption>제안하기 목록</caption> -->
                
                <thead style="border-top: 2px solid rgb(241, 241, 241);">
                    <th>번호</th>
                    <!-- <th style="display: none;">카테고리</th> -->
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </thead>
                <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
                    <tr>
                        <td>1</td>
                        <td>
                            <a>네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
                        </td>
                        <td>대표 관리자</td>
                        <td>2019-04-15</td>
                        <td>19</td>
                    </tr>
                </tbody>
            </table>

        </article>
        <article>
            <div class="btn-block-right">
                <a href="#">글쓰기</a>
            </div>
            <div class="pageBar">
                <a href="#" class="first">«</a>
                <a href="#" class="prev">‹</a>
                <a href="#" class="p_number"><span>1</span></a>
                <a href="#" class="next">›</a>
                <a href="#" class="last">»</a>
            </div>
        </article>
    </section>
    
<%@ include file="../../common/footer.jsp" %>
