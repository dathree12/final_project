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
                            <option id="bcStatus" value="N">클럽제안현황</option>
                            <option id="bcStatus" value="P">운영중인클럽</option>
                            <option id="bcStatus" value="D">취소된클럽</option>
                            <option id="bcStatus" value="Q">마감된클럽</option>
                        </select>
                        <table class="list_table">
                            <tr>
                                <th></th>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tbody id="clubTbody">
								<c:if test="${bcList == null}">
									<tr>
										<td colspan="6">
											조회된 펀딩이 없습니다.
										</td>
									</tr>	
								</c:if>
								<c:if test="${bcList != null}">
									<c:forEach var="bookclub" items="${bcList}">
										<tr>
											<td><input name="upcst" type="checkbox" value="${bookclub.bcNo}"></td>
											<td><c:out value="${bookclub.bcNo}"/></td>
											<td><c:out value="${bookclub.bcTitle}"/></td>
											<td><c:out value="${bookclub.bcStatus}"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
                        </table>
                    </div>
                    <div class="pageBar">
                        <div id="pageBarAndBtn">
                            <!-- 이전 페이지로 -->
                            <button>&lt;</button>
                            <!--  10개 페이지 목록(비트윈으로 조회) -->
                            <button disabled>1</button>
                            <button>2</button>
                            <button>3</button>
                            <!-- 다음 페이지로 -->
                            <button >&gt;</button>
                        </div>
                        <div class="bnt">
	                        <button>수락</button>
	                        <button>거절</button>
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
	                <form action="${path}/member/admin/bookfunding" method="post">
	                	<security:authentication property="principal" var="user"/>
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
												<td><c:out value="${bookfunding.bfTitle}"/></td>
												<td><c:out value="${bookfunding.bfStatus}"/></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
	                        </table>
	                    </div>
	                    <div class="pageBar">
	                        <div id="pageBarAndBtn">
	                            <!-- 이전 페이지로 -->
	                            <button onclick="location.href='${path}/member/admin/admin_page?page=${fundPageInfo.prvePage}&listLimit=${fundPageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${fundPageInfo.startPage}" end="${fundPageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == fundPageInfo.currentPage}">
										<button disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != fundPageInfo.currentPage}">
										<button onclick="location.href='${path}/member/admin/admin_page?page=${status.current}&listLimit=${fundPageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button onclick="location.href='${path}/member/admin/admin_page?page=${fundPageInfo.nextPage}&listLimit=${fundPageInfo.listLimit}'">&gt;</button>
	                        </div>
	                        <div class="bnt">
		                        <button type="button" id="fpbtn"value="P">수락</button>
		                        <button type="button" id="fdbtn"value="D">거절</button>
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
	                <form action="${path}/member/admin" method="post">
	                	<security:authentication property="principal" var="user"/>
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
	                        <div id="pageBarAndBtn">
	                            <!-- 이전 페이지로 -->
	                            <button onclick="location.href='${path}/member/admin/admin_page?page=${pageInfo.prvePage}&listLimit=${pageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == pageInfo.currentPage}">
										<button disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != pageInfo.currentPage}">
										<button onclick="location.href='${path}/member/admin/admin_page?page=${status.current}&listLimit=${pageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button onclick="location.href='${path}/member/admin/admin_page?page=${pageInfo.nextPage}&listLimit=${pageInfo.listLimit}'">&gt;</button>
	                        </div>
	                        <div class="bnt">
	                        <button type="button" id="mbtn"value="N">정지</button>
	                        <button type="button" id="membtn"value="Y">복구</button>
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
    
    // 펀드 목록 조회
	$("select[name=bfStatus]").change(function(){
		var bfStatus = $(this).val();
		var flist = {};
		$("#fundTbody").empty();
	  
	  	$.ajax({
			type: "get",
			url: "${path}/member/admin/funding",
			dataType: "json",
			async: false,
			data: {
				// id(파라미터 키값):id
				bfStatus // 파라미터의 키값과 변수명이 동일할 경우
			},
			success: function(result) {
				flist = result.flist;
				
				var tc = new Array();
				var html = '';
				
				$.each(flist, function( index, value ) {
					tc.push({no : value.bfNo ,title : value.bfTitle, status : value.bfStatus}); 
                 });
				
				for(key in tc){
				html += '<tr>';
				html += '<td><input name="upfst" id="fcb" type="checkbox" value="'+tc[key].no+'"></td>';
				html += '<td>'+tc[key].no+'</td>';
				html += '<td>'+tc[key].title+'</td>';
				html += '<td>'+tc[key].status+'</td>';
				html += '</tr>';
				}
							
				$("#fundTbody").empty();
				$("#fundTbody").append(html);
				
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
			async: false,
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
	  
	  	$.ajax({
			type: "get",
			url: "${path}/member/admin",
			dataType: "json",
			async: false,
			data: {
				// id(파라미터 키값):id
				mStatus // 파라미터의 키값과 변수명이 동일할 경우
			},
			success: function(result) {
				mlist = result.list;
				
				var tc = new Array();
				var html = '';
				
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
							
				$("#dynamicTbody").empty();
				$("#dynamicTbody").append(html);
				
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
			async: false,
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