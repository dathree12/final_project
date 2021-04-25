<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    

<%@ include file="../../common/header.jsp" %>
<head>
	<meta charset="UTF-8">
    <title>제안하기 게시판 리스트</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardList.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
   	<script type="text/javascript" src="${ path }/js/club/bcBoardList.js"></script>    
    <style type="text/css">
       	/* button */
		.btn-block-right { margin-top: 20px; background-color: #747474; border: 1px solid #4f4f4f; border-width: 0px; float: right; padding: 3px; /*display: inline-block;*/ width: 60px; text-align: center; margin-right: 3px; }
		.btn-block-right a { color: white; }
	</style>
</head>
    <section class="propose-list-section-1th">
        <div class="product-menupackage">
            <div class="title" style="text-align: center;">
                <h2 style="padding-left: 80px; padding-top: 10px"><span>Q&A</span></h2>
                <div class="btn-block-right">
        			<a href="${ path }/board/cs_board/qnaBoardWrite">글쓰기</a>
	   		    </div>
            </div>
        </div>
        <article class="propose-list-section-2th">
            <div class="sub-title-1th">
                <h2>
                    <font>Q&A 작성페이지</font>
                </h2>
            </div>
            <div class="sub-title-2th">
                <h4>
                    <span>질문 받습니다 질문받아요!</span>
                </h4>
            </div>
        </article>

		<security:authorize access="isAnonymous()">
            <div style="text-align: center; margin-top: 50px">
                <h4>
                	로그인 후 이용해주세요
                </h4>
            </div>
		</security:authorize>
		<security:authorize access="hasAnyRole('ADMIN', 'USER')">
        <!-- total, list board -->
        <article class="propose-list-section-3th">
            <div class="total_count">
                <h3>total&nbsp;&nbsp;<span>${ count }</span></h3>
            </div>
            <table >
                <!-- <caption>제안하기 목록</caption> -->
                
                <thead style="border-top: 2px solid rgb(241, 241, 241); max-width: 1100px">
                    <th style="width: 70px;">번호</th>
                    <!-- <th style="display: none;">카테고리</th> -->
                    <th style="width: 700px;">제목</th>
                    <th style="width: 90px;">작성자</th>
                    <th style="width: 150px;">작성일</th>
                    <th style="width: 90px">조회수</th>
                </thead>
                <!--  
                <security:authentication property="principal" var="user"/> 
                <c:if test="${ list == null }">
	                <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
	                    <tr>
	                        <td colspan="5">비어있는 게시판입니다.</td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                </tbody>
                </c:if>
                -->
                <c:if test="${ list != null }">
	                <c:forEach var="list" items="${ list }">
		                <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
		                    <tr>
		                        <td style="width: 70px"><c:out value="${ list.qaNo }"/></td>
       			                        <input id="qaWriter" name="qaWriter" type="hidden" value="${ list.qaWriter }"></a></td>
       			                        <input id="qaNo" name="qaNo" type="hidden" value="${ list.qaNo }"></a></td>
       			                        <input type="hidden" name="_csrf" value="${_csrf.token}" name="${_csrf.parameterName}" />
		                        <td style="width: 700px; cursor: pointer;"><a href="${path}/board/cs_board/qnaDetail?qaNo=${ list.qaNo }"><span>[${ list.qaItem }] </span>&nbsp;<c:out value="${ list.qaTitle }"/></a></td>
		                        <td style="width: 90px"><c:out value="${ list.qaWriter }"/></td>
		                        <td style="width: 150px"><c:out value="${ list.qaEnrollDate }"/></td>
		                        <td style="width: 90px"><c:out value="${ list.qaViewCount }"/></td>
		                        <security:authorize access="hasRole('ADMIN')">
		                        	<td style="width: 50px; border: none"><input style="cursor: pointer; background-color: #747474; border: 1px solid #4f4f4f; width: 100%; height: 100%; border-radius: 0px; color: white;" onclick="removeList();" id="removeList" name="removeList" type="button" value="삭제"></td>
  			                        <script type="text/javascript">
										function removeList() {
											var removeList = confirm('정말 삭제하시겠습니까?');
											var qaNo = ${ list.qaNo };
											
											if(removeList == true) {
												location.replace('${path}/board/cs_board/delete?qaNo=' + qaNo + "");
											} else {
												alert('취소되었습니다.');
											}
										}
									</script>
		                        </security:authorize>
		                    </tr>
		                </tbody>
	                </c:forEach>
                </c:if>
            </table>
        </article>
        </security:authorize>
		<div class="bcboard_mid_bottom" style="/*border: 1px solid black;*/ text-align: center;">
	      	<div class="bcboard_mid_pageCount">
	            <a href="${path}/board/bc_board/bcBoardMain?page=1">&lt;&lt;</a> &nbsp; &nbsp;
	            <a href="${path}/board/bc_board/bcBoardMain?page=${pageInfo.prvePage}">&lt;</a> &nbsp; &nbsp;
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
					<c:if test="${status.current == pageInfo.currentPage}">
						<a disabled><u><b><b><c:out value="${status.current}"/></b></b></u></a> &nbsp; &nbsp;
	   				</c:if>
					<c:if test="${status.current != pageInfo.currentPage}">
						<a href="${path}/board/bc_board/bcBoardMain?page=${status.current}"><c:out value="${status.current}"/></a>
						&nbsp; &nbsp;
	   				</c:if>
				</c:forEach>            
	            <a href="${path}/board/bc_board/bcBoardMain?page=${pageInfo.nextPage}">&gt;</a> &nbsp; &nbsp;
	            <a href="${path}/board/bc_board/bcBoardMain?page=${pageInfo.maxPage}">&gt;&gt;</a>
	            <!-- 여기에 입력값있음 	-->
	        </div>
	    </div>	
    </section>
<%@ include file="../../common/footer.jsp" %>