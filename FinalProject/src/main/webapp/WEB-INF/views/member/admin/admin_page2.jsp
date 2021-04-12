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
            <span><a href="#quit">마감현황</a></span>
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
                        <p>클럽 제안 현황</p>
                        <table class="list_table">
                            <tr>
                                <th></th>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
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
                <div class="open_list">
                    <!-- 운영중인 클럽 -->
                    <div class="content">
                        <p>운영중인 클럽</p>
                        <table class="list_table">
                            <tr>
                                <th></th>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
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
                            <button>마감</button>
                            </div>
                    </div>
                </div>
                <div class="refusal_list">
                    <div class="content">
                        <p>취소 된 클럽</p>
                        <table class="list_table">
                            <tr>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                        </table>
                    </div>
                    <div class="pageBar">
                        <div id="pageBar">
                            <!-- 이전 페이지로 -->
                            <button>&lt;</button>
                            <!--  10개 페이지 목록(비트윈으로 조회) -->
                            <button disabled>1</button>
                            <button>2</button>
                            <button>3</button>
                            <!-- 다음 페이지로 -->
                            <button >&gt;</button>
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
                    <div class="content">
                        <p>펀딩 신청 현황</p>
                        <table class="list_table">
                            <tr>
                                <th></th>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>검토중</td>
                            </tr>
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
                <div class="open_list">
                    <div class="content">
                        <p>모집중인 펀딩</p>
                        <table class="list_table">
                            <tr>
                                <th></th>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
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
                            <button>마감</button>
                            </div>
                    </div>
                </div>
                <div class="refusal_list">
                    <div class="content">
                        <p>취소 된 펀딩</p>
                        <table class="list_table">
                            <tr>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>거절</td>
                            </tr>
                        </table>
                    </div>
                    <div class="pageBar">
                        <div id="pageBar">
                            <!-- 이전 페이지로 -->
                            <button>&lt;</button>
                            <!--  10개 페이지 목록(비트윈으로 조회) -->
                            <button disabled>1</button>
                            <button>2</button>
                            <button>3</button>
                            <!-- 다음 페이지로 -->
                            <button >&gt;</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 마감현황 -->
        <div class="status_quit">
            <p class="title" id="quit">마감현황</p>
            <div class="quit">
                <div class="quit_list">
                    <div class="content">
                        <p>북클럽</p>
                        <table class="list_table">
                            <tr>
                                <th></th>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                        </table>
                    </div>
                    <div class="pageBar">
                        <div id="pageBar">
                            <!-- 이전 페이지로 -->
                            <button>&lt;</button>
                            <!--  10개 페이지 목록(비트윈으로 조회) -->
                            <button disabled>1</button>
                            <button>2</button>
                            <button>3</button>
                            <!-- 다음 페이지로 -->
                            <button >&gt;</button>
                        </div>
                    </div>
                </div>
                <div class="refusal_list">
                    <div class="content">
                        <p>북펀딩</p>
                        <table class="list_table">
                            <tr>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>책스초코의 비밀</td>
                                <td>모집중</td>
                            </tr>
                        </table>
                    </div>
                    <div class="pageBar">
                        <div id="pageBar">
                            <!-- 이전 페이지로 -->
                            <button>&lt;</button>
                            <!--  10개 페이지 목록(비트윈으로 조회) -->
                            <button disabled>1</button>
                            <button>2</button>
                            <button>3</button>
                            <!-- 다음 페이지로 -->
                            <button >&gt;</button>
                        </div>
                    </div>
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
                        <p style="display: inline-block;">회원목록</p>
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
										<td><input type="checkbox"></td>
										<td><c:out value="${member.userId}"/></td>
										<td><c:out value="${member.name}"/></td>
										<td><c:out value="${member.userNname}"/></td>
										<td><c:out value="${member.status}"/></td>
									</tr>
								</c:forEach>
							</c:if>
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
                        <button>정지</button>
                        <button>복구</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
   
<script type="text/javascript">
$("select[name=mStatus]").change(function(){
	
	var mStatus = $(this).val();
	  console.log($(this).val()); //value값 가져오기
	var mlist = {};
	  
	  $.ajax({
			type: "get",
			url: "${path}/member/admin/admin_page",
			dataType: "json",
			data: {
				// id(파라미터 키값):id
				mStatus // 파라미터의 키값과 변수명이 동일할 경우
			},
			success: function(data) {
				console.log(data);
			},
			error: function(e) {
				console.log(e);
			}
		});
	  
});
	
</script>
<%@ include file="../../../views/common/footer.jsp" %>