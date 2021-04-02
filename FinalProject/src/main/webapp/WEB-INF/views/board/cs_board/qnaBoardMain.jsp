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
    <title>Q&A 게시판</title>
    <link rel="stylesheet" href="${ path }/css/board/cs_style/qnaBoardMain.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script 
    src="https://kit.fontawesome.com/2d323a629b.js" 
    crossorigin="anonymous"
    ></script>
    
</head>
<body>
<%@ include file="../../common/header.jsp" %>
	<div id="wrap">
		<section class="brboard-body">    
		    <section class = "brboard-top">
		        <div class = "brboard-top-title">
		            <a href="#">Q&A</a>
		        </div>
		        <div class = "brboard-top-button">
		            <a href="${path}/board/cs_board/qnaBoardWrite" class="write-button">글쓰기</a>
		            <a href="#" class="delete-button">삭제</a>
		        </div>
		        <hr id="line">
		    </section>
		    <section class="brboard-mid">
		        <section class="brboard-mid-container">
		            <article class="propose-list-section-3th">
		                <table>
		                    <thead style="border-top: 2px solid rgb(241, 241, 241);">
		                        <th>번호</th>
		                        <!-- <th style="display: none;">카테고리</th> -->
		                        <th>제목</th>
		                        <th id="blind">작성자</th>
		                        <th>작성일</th>
		                        <th id="blind">조회수</th>
		                    </thead>
		                    <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        <tr>
		                            <td>1</td>
		                            <td>
		                                <a>카카오톡등 SNS로그인 가능합니다!</a>
		                            </td>
		                            <td id="blind">대표 관리자</td>
		                            <td>2019-04-15</td>
		                            <td id="blind">19</td>
		                        </tr>
		                        
		                    </tbody>
		                </table>
		            </article>
		        </section>
		    </section>
		    <section class="brboard-bot">
		        <div class="brboard-pagination">
		            <a href="#">&laquo;</a>
		            <a href="#">1</a>
		            <a href="#">2</a>
		            <a href="#">3</a>
		            <a href="#">4</a>
		            <a href="#">5</a>
		            <a href="#">6</a>
		            <a href="#">&raquo;</a>
		        </div>
		    </section>
		 </section>
	</div>       
</body>
<%@ include file="../../common/footer.jsp" %>