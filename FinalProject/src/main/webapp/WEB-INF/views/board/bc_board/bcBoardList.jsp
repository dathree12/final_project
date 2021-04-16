<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../common/header.jsp" %>
<head>
    <title>제안하기 게시판 리스트</title>
    <link rel="stylesheet" href="${ path }/css/board/bc_style/bcBoardList.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <style type="text/css">
       	/* button */
		.btn-block-right { margin-top: 20px; background-color: #747474; border: 1px solid #4f4f4f; border-width: 0px; float: right; padding: 3px; /*display: inline-block;*/ width: 60px; text-align: center; margin-right: 3px; }
		.btn-block-right a { color: white; }
	</style>
</head>
    <section class="propose-list-section-1th">
        <!-- 제목(1), 카테고리(3) -->
        <article class="headcategory">
            <div class="title">
                <h2 style="margin-left: 100px;">
                    <span>북 클럽</span>
                    <div class="btn-block-right">
			    		<a href="${ path }/board/bc_board/bcBoardWrite">글쓰기</a>
		      		</div>	
                </h2>
            </div>
            <ul class="menuCategory">
                <li><a href="${ path }/board/bc_board/bcBoardMain">전체 클럽</a></li>
                <li><a href="${ path }/board/bc_board/bcBoardMain">모집 중인 클럽</a></li>
                <li><a href="${ path }/board/bc_board/bcBoardList">클럽 제안하기</a></li>
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
                <h3>total&nbsp;&nbsp;<span>${ boardCount }</span></h3>
            </div>
            <table >
                <!-- <caption>제안하기 목록</caption> -->
                
                <thead style="border-top: 2px solid rgb(241, 241, 241);">
                    <th>번호</th>
                    <!-- <th style="display: none;">카테고리</th> -->
                    <th style="width: 50%;">제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </thead>
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
                <c:if test="${ list != null }">
	                <c:forEach var="propose" items="${ list }">
		                <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
		                    <tr>
		                        <td><c:out value="${ propose.proposeNo }"></c:out></td>
		                        <!-- 관리자 or 작성자가 아니면 비밀글, 맞으면 originTitle -->
		                        <!--  
		                        <td>
		                            <a href="#">네이버/페이스북/카카오톡등 SNS로그인 가능합니다!</a>
		                        </td>
		                        -->
		                        <td style="text-align: left;">
		                        	<img alt="" src="${ path }/images/iconfinder_lock_close.png">&nbsp;&nbsp;&nbsp;<span style="cursor: pointer;" onclick="detail();">비밀글</span>
		                        </td>
		                        <!-- 스크립트 -->
		                        <script type="text/javascript">
									function detail() {
										location.href="${ path }/board/bc_board/bcBoardRead?proposeNo=${ list.proposeNo }";
									}
								</script>
								<security:authentication property="principal" var="user"/> 
		                        <td><c:out value="${ user.name }"></c:out></td>
		                        <td><c:out value="${ propose.proposeRegDate }"></c:out></td>
		                        <td><c:out value="${ propose.proposeViewCount }"></c:out></td>
		                    </tr>
		                </tbody>
	                </c:forEach>
                </c:if>
            </table>
        </article>
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
	        </div>
	    </div>	
    </section>
<%@ include file="../../common/footer.jsp" %>