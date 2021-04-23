<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../../views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage_style/adminpage.css">
    <section class="mypage">
        <h3 style="text-align: center; margin: 50px;">My page</h3>
    
        <div class="menu">
            <span><a href="#bookclub">북클럽</a></span>
            <span><a href="#bookfunding">북펀딩</a></span>
            <span><a href="#user">회원관리</a></span>
        </div>
        <hr>

        <!-- 북클럽 -->
        <div class="bookclub">
            <p class="title" id="bookclub">북클럽</p>
            <div class="club">
                <div class="list">
                    <div class="content">
                        <!-- 제안된 클럽 -->
                        <select class="usertype" name="bcStatus">
                            <option id="bcStatus" value="ALL">전체클럽목록</option>
                            <option id="bcStatus" value="P">운영중인클럽</option>
                            <option id="bcStatus" value="Q">마감된클럽</option>
                        </select>
                        <button type="button" class="p_btn" style="float: right; background-color: black; color: white; margin: 25px" onclick="location.href='${path}/board/bc_board/bcBoardList'">제안현황&gt;</button>
                        <table class="list_table">
                            <tr>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tbody id="clubTbody">
								<c:if test="${bcList == null}">
									<tr>
										<td colspan="3">
											조회된 클럽이 없습니다.
										</td>
									</tr>	
								</c:if>
								<c:if test="${bcList != null}">
									<c:forEach var="bookclub" items="${bcList}">
										<tr>
											<td><c:out value="${bookclub.bcNo}"/></td>
											<td><a href="${path}/board/bc_board/bcBoardDetail?bcNo=${bookclub.bcNo}"><c:out value="${bookclub.bcOriginTitle}"/></a></td>
											<td><c:out value="${bookclub.bcStatus}"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
                        </table>
                    </div>
                    <div class="pageBar">
                        <div id="pageBarAndBtn" class="cPageBar">
                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/admin/admin_page?cPage=${clubPageInfo.prvePage}&cListLimit=${clubPageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${clubPageInfo.startPage}" end="${clubPageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == clubPageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != clubPageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/admin/admin_page?cPage=${status.current}&cListLimit=${clubPageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/admin/admin_page?cPage=${clubPageInfo.nextPage}&cListLimit=${clubPageInfo.listLimit}'">&gt;</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 북펀딩 -->
		<div class="bookfunding">
            <p class="title" id="bookfunding">북펀딩</p>
            <div class="funding">
                <div class="list">
	                <form action="${path}/member/admin/bookfunding" method="get">
	                    <div class="content">
	                        <select class="usertype" name="bfStatus">
	                            <option id="bfStatus" value="ALL">전체펀딩목록</option>
	                            <option id="bfStatus" value="N">펀딩신청현황</option>
	                            <option id="bfStatus" value="P">모집중인펀딩</option>
	                            <option id="bfStatus" value="D">취소된펀딩</option>
	                            <option id="bfStatus" value="Q">마감된펀딩</option>
	                        </select>
	                        <table class="list_table">
	                            <tr>
	                                <th></th>
	                                <th class="th">No</th>
	                                <th class="th">Title</th>
	                                <th class="th">Status</th>
	                            </tr>
	                            <tbody id="fundTbody">
									<c:if test="${bfList == null}">
										<tr>
											<td colspan="6">
												조회된 펀딩이 없습니다.
											</td>
										</tr>	
									</c:if>
									<c:if test="${bfList != null}">
										<c:forEach var="bookfunding" items="${bfList}">
											<tr>
												<td><input name="upfst" type="checkbox" value="${bookfunding.bfNo}"></td>
												<td><c:out value="${bookfunding.bfNo}"/></td>
												<td><a href="${path}/board/bf_board/bf_adminCheck?bfNo=${bookfunding.bfNo}"><c:out value="${bookfunding.bfTitle}"/></a></td>
												<td><c:out value="${bookfunding.bfStatus}"/></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
	                        </table>
	                    </div>
	                    <div class="pageBar">
	                        <div class="bnt">
		                        <button type="button" id="fpbtn"value="P">수락</button>
		                        <button type="button" id="fdbtn"value="D">거절</button>
	                        </div>
	                        <div id="pageBarAndBtn" class="fPageBar">
	                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/admin/admin_page?fPage=${fundPageInfo.prvePage}&fListLimit=${fundPageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${fundPageInfo.startPage}" end="${fundPageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == fundPageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != fundPageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/admin/admin_page?fPage=${status.current}&fListLimit=${fundPageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/admin/admin_page?fPage=${fundPageInfo.nextPage}&fListLimit=${fundPageInfo.listLimit}'">&gt;</button>
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
		</div>

	        <!-- 회원관리 -->
		<div class="user">
	            <p class="title" id="user">회원관리</p>
	            <div class="user_list">
	                <div class="list">
	                <form action="${path}/member/admin" method="get">
	                    <div class="content">
	                        <select class="usertype" name="mStatus">
	                            <option id="mStatus" value="ALL">전체회원</option>
	                            <option id="mStatus" value="Y">활동회원</option>
	                            <option id="mStatus" value="N">정지회원</option>
	                        </select>
	                        <div>
		                        <table class="list_table">
		                            <tr>
		                                <th></th>
		                                <th class="th">ID</th>
		                                <th class="th">이름</th>
		                                <th class="th">닉네임</th>
		                                <th class="th">Status</th>
		                            </tr>
						            <tbody id="dynamicTbody">
										<c:if test="${list == null}">
										<tr>
											<td colspan="6">
												조회된 회원이 없습니다.
											</td>
										</tr>	
									</c:if>
									<c:if test="${list != null}">
										<c:forEach var="member" items="${list}">
											<tr>
												<td><input name="upmst" type="checkbox" value="${member.userId}"></td>
												<td><c:out value="${member.userId}"/></td>
												<td><c:out value="${member.name}"/></td>
												<td><c:out value="${member.userNname}"/></td>
												<td><c:out value="${member.status}"/></td>
											</tr>
										</c:forEach>
									</c:if>
									</tbody>
		                        </table>
	                        </div>
	                    </div>
	                    <div class="pageBar">
	                        <div class="bnt">
		                        <button type="button" id="mbtn"value="N">정지</button>
		                        <button type="button" id="membtn"value="Y">복구</button>
	                        </div>
	                        <div id="pageBarAndBtn" class="mPageBar">
	                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/admin/admin_page?uPage=${pageInfo.prvePage}&uListLimit=${pageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == pageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != pageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/admin/admin_page?uPage=${status.current}&uListLimit=${pageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/admin/admin_page?uPage=${pageInfo.nextPage}&uListLimit=${pageInfo.listLimit}'">&gt;</button>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</section>
   
<script type="text/javascript">
$(function() {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(csrfHeader, csrfToken);
    });
    
    // 클럽 목록 조회
	$("select[name=bcStatus]").change(function(){
		var bcStatus = $(this).val();
		var clist = {};
		$("#clubTbody").empty();
		$(".cPageBar").empty();
	  
	  	$.ajax({
			type: "get",
			url: "${path}/member/admin/club",
			dataType: "json",
			data: {
				bcStatus
			},
			success: function(result) {
				clist = result.bcList;
				var pageInfo = result.pageInfo;
				var tc = new Array();
				var html = '';
				var cHtml = '';
				
				$.each(clist, function( index, value ) {
					tc.push({no : value.bcNo ,title : value.bcOriginTitle, status : value.bcStatus}); 
                 });
				
				for(key in tc){
				html += '<tr>';
				html += '<td>'+tc[key].no+'</td>';
				html += '<td><a href="${path}/board/bf_board/bf_adminCheck?bfNo='+tc[key].no+'">'+tc[key].title+'</a></td>';
				html += '<td>'+tc[key].status+'</td>';
				html += '</tr>';
				}
						
				cHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?cPage=' + pageInfo.prvePage + '&cListLimit=' + pageInfo.listLimit + '\'">&lt;</button>'
				for (var p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
					if (p == pageInfo.current) {
						cHtml += '<button type="button" disabled>'+ p + '</button>'
					} else {
						cHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?cPage=' + p + '&cListLimit=' + pageInfo.listLimit + '\'">' + p + '</button>'
					}
				}
				cHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?cPage=' + pageInfo.nextPage + '&cListLimit=' + pageInfo.listLimit + '\'">&gt;</button>';
				
				$("#clubTbody").empty();
				$("#clubTbody").append(html);
				
				$(".cPageBar").empty();
				$(".cPageBar").append(cHtml);
			},
			error: function(e) {
				console.log(e);
			}
		});
	});
    // 펀드 목록 조회
	$("select[name=bfStatus]").change(function(){
		var bfStatus = $(this).val();
		var flist = {};
		$("#fundTbody").empty();
		$(".fPageBar").empty();
		
	  	$.ajax({
			type: "get",
			url: "${path}/member/admin/funding",
			dataType: "json",
			data: {
				// id(파라미터 키값):id
				bfStatus // 파라미터의 키값과 변수명이 동일할 경우
			},
			success: function(result) {
				flist = result.flist;
				var pageInfo = result.pageInfo;
				var tc = new Array();
				var html = '';
				var fHtml = '';
				
				$.each(flist, function( index, value ) {
					tc.push({no : value.bfNo ,title : value.bfTitle, status : value.bfStatus}); 
                 });
				
				for(key in tc){
				html += '<tr>';
				html += '<td><input name="upfst" id="fcb" type="checkbox" value="'+tc[key].no+'"></td>';
				html += '<td>'+tc[key].no+'</td>';
				html += '<td><a href="${path}/board/bf_board/bf_adminCheck?bfNo='+tc[key].no+'">'+tc[key].title+'</a></td>';
				html += '<td>'+tc[key].status+'</td>';
				html += '</tr>';
				}
				
				fHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?fPage=' + pageInfo.prvePage + '&fListLimit=' + pageInfo.listLimit + '\'">&lt;</button>'
				for (var p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
					if (p == pageInfo.current) {
						fHtml += '<button type="button" disabled>'+ p + '</button>'
					} else {
						fHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?fPage=' + p + '&fListLimit=' + pageInfo.listLimit + '\'">' + p + '</button>'
					}
				}
				fHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?fPage=' + pageInfo.nextPage + '&fListLimit=' + pageInfo.listLimit + '\'">&gt;</button>';
					
				$("#fundTbody").empty();
				$("#fundTbody").append(html);
				
				$(".fPageBar").empty();
				$(".fPageBar").append(fHtml);
				
			},
			error: function(e) {
				console.log(e);
			}
		});
	});
    
	// 펀드 상태 변경
	$("#fpbtn, #fdbtn").on('click', function (){
		
		var newstatus =  "";
		var bfNolist = new Array();
		
		$.each($('input[name=upfst]:checked'), function() {
			bfNolist.push($(this).val());
         });
		
		if($(event.target).attr('id')=='fpbtn'){
			newstatus = "P";
		} else {
		    newstatus = "D";
		}
		console.log(newstatus);
		$.ajax({
			type: "post",
			url: "${path}/member/admin/updateFundlist",
			dataType: "json",
			data: {
				newstatus,
				bfNolist
			},
			success: function(data) {
				alert("변경성공");
				$("select[name=bfStatus]").val('ALL').change();
			},
			error: function(e) {
				console.log(e);
			}
		});
	});
	
    // 회원 목록 조회
	$("select[name=mStatus]").change(function(){
		var mStatus = $(this).val();
		var mlist = {};
		
		$("#dynamicTbody").empty();
		$(".mPageBar").empty();
	  
	  	$.ajax({
			type: "get",
			url: "${path}/member/admin",
			dataType: "json",
			data: {
				// id(파라미터 키값):id
				mStatus // 파라미터의 키값과 변수명이 동일할 경우
			},
			success: function(result) {
				mlist = result.list;
				var pageInfo = result.pageInfo;
				var tc = new Array();
				var html = '';
				var mHtml = '';
				$.each(mlist, function( index, value ) {
					tc.push({id : value.userId ,name : value.name, nname : value.userNname, status : value.status}); 
                 });
				
				for(key in tc){
				html += '<tr>';
				html += '<td><input name="upmst" id="mcb" type="checkbox" value="'+tc[key].id+'"></td>';
				html += '<td>'+tc[key].id+'</td>';
				html += '<td>'+tc[key].name+'</td>';
				html += '<td>'+tc[key].nname+'</td>';
				html += '<td>'+tc[key].status+'</td>';
				html += '</tr>';
				}
                
				mHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?uPage=' + pageInfo.prvePage + '&uListLimit=' + pageInfo.listLimit + '\'">&lt;</button>'
				for (var p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
					if (p == pageInfo.current) {
						mHtml += '<button type="button" disabled>'+ p + '</button>'
					} else {
						mHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?uPage=' + p + '&uListLimit=' + pageInfo.listLimit + '\'">' + p + '</button>'
					}
				}
				mHtml += '<button type="button" onclick="location.href=\'${path}/member/admin/admin_page?uPage=' + pageInfo.nextPage + '&uListLimit=' + pageInfo.listLimit + '\'">&gt;</button>';
                
				$("#dynamicTbody").empty();
				$("#dynamicTbody").append(html);
				
				$(".mPageBar").empty();
				$(".mPageBar").append(mHtml);
				
				
			},
			error: function(e) {
				console.log(e);
			}
		});
	});
	
    // 회원 상태 변경
	$("#mbtn, #membtn").on('click', function (){
		
		var newstatus =  "";
		var idlist = new Array();
		
		$.each($('input[name=upmst]:checked'), function() {
			idlist.push($(this).val());
         });
		
		if($(event.target).attr('id')=='mbtn'){
			newstatus = "N";
		} else {
		    newstatus = "Y";
		}
		
		$.ajax({
			type: "post",
			url: "${path}/member/admin/updatemst",
			dataType: "json",
			data: {
				newstatus,
				idlist
			},
			success: function(data) {
				alert("변경성공");
				$("select[name=mStatus]").val('ALL').change();
			},
			error: function(e) {
				console.log(e);
			}
		});
	});
});
</script>
<%@ include file="../../../views/common/footer.jsp" %>