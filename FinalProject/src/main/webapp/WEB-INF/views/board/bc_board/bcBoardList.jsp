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
    <style type="text/css">
       	/* button */
		.btn-block-right { margin-top: 20px; background-color: #747474; border: 1px solid #4f4f4f; border-width: 0px; float: right; padding: 3px; /*display: inline-block;*/ width: 60px; text-align: center; margin-right: 3px; }
		.btn-block-right a { color: white; }
	</style>
</head>
    <section class="propose-list-section-1th">
        <div class="product-menupackage">
            <div class="title" style="text-align: center;">
                <h2 style="padding-left: 80px; padding-top: 10px"><span>북 클럽</span></h2>
                <div class="btn-block-right">
        			<a href="${ path }/board/bc_board/bcBoardWrite">글쓰기</a>
	   		    </div>
            </div>
            <div style="text-align: center;">
	            <ul class="menuCategory" style="display: block; margin-top: 10px; margin-right: 20px">
	                <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardMain" style="text-decoration: none; color: black;" onclick="addFunc();">전체 클럽</a></li>
	                <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardMain" style="text-decoration: none; color: black;" onclick="removeFunc();">모집 중인 클럽</a></li>
	                <li class="headcategory"><a href="${ path }/board/bc_board/bcBoardList" style="text-decoration: none; color: black;">클럽 제안하기</a></li>
	            </ul>
            </div>
        </div>
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
                
                <thead style="border-top: 2px solid rgb(241, 241, 241); max-width: 1100px">
                    <th style="width: 70px;">번호</th>
                    <!-- <th style="display: none;">카테고리</th> -->
                    <th style="width: 700px;">제목</th>
                    <th style="width: 90px;">작성자</th>
                    <th style="width: 150px;">작성일</th>
                    <th style="width: 90px">조회수</th>
                </thead>
                <security:authentication property="principal" var="user"/> 
                <c:if test="${ proposeList == null }">
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
                <c:if test="${ proposeList != null }">
	                <c:forEach var="proposeList" items="${ proposeList }">
		                <tbody style="border-bottom: 1px solid rgb(241, 241, 241); border-top: 1px solid rgb(241, 241, 241);">
		                    <tr>
		                        <td style="width: 70px"><c:out value="${ proposeList.proposeNo }"></c:out></td>
	                    	    <security:authentication property="principal" var="user"/> 
	                        	<c:set var="writer" value="${ proposeList.userName }"/>
	                        	<!-- 로그인 유저가 작성자이거나 관리자면, originTitle 아니면 비밀글 표시 -->
                        		<c:choose>
                        			<c:when test="${ not((user.name eq writer) or (user.name eq '관리자')) }">
       			                        <td style="width: 700px;" onclick="insertPopup();"><img alt="" src="${ path }/images/iconfinder_lock_close.png">&nbsp;&nbsp;&nbsp;<span style="cursor: pointer;">비밀글</span></td>
                        			</c:when>
                        			<c:when test="${ (user.name eq writer) or (user.name eq '관리자') }">
				                        <td style="width: 700px;" onclick="detail();"><c:out value="${ proposeList.proposeTitle }"/><c:out value="${ proposeList.proposePwd }"/></td>
                        			</c:when>
                        		</c:choose>
		                        <td style="width: 90px"><c:out value="${ proposeList.userName }"></c:out></td>
		                        <td style="width: 150px"><c:out value="${ proposeList.proposeRegDate }"></c:out></td>
		                        <td style="width: 90px"><c:out value="${ proposeList.proposeViewCount }"></c:out></td>
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
	            <!-- 여기에 입력값있음 -->
	        </div>
	    </div>	
    </section>
	<script type="text/javascript">
		function detail() {
			location.href="${ path }/board/bc_board/bcBoardRead?proposeNo=${ list.proposeNo }";
		}
		
		      function insertPopup() {
		      	
		          window.name = "bcBoardList";
		          var _width = '464px';
		          var _height = '280px';
		
		          // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		          var _left = Math.ceil(( window.screen.width - _width )/2);
		          var _top = Math.ceil(( window.screen.height - _height )/2); 
		
		          // (open할 window, "자식창 이름", "OPTION"), 부모창 : 자식창을 띄워준다.
		          var childWin = window.open('secret', 'secret', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top + ", resizable = no, scrollbars = no, status = no");
		}
     </script>    

<%@ include file="../../common/footer.jsp" %>