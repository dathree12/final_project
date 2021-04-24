<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<%@ include file="../../../views/common/header.jsp" %>
    <link rel="stylesheet" href="${path}/css/member/mypage_style/mypage.css">
    <section class="mypage">
        <h3 style="text-align: center; margin: 50px;">My page</h3>
    
        <hr>

        <div class="info">
            <!-- 회원정보 -->
            <p class="title"><B>Profile</B></p>
            <div class="profile">
                <p style="padding-left: 10px;"><span>${member.name}</span>님 환영합니다.</p>
                <button class="info_btn" onclick="profile();">회원정보수정</button>
            </div>
            
            <!-- 스크랩 -->
            <p class="scrap_title"><B>Scrap</B></p>
            <div class="scrap">
                <div class="scrap_info">
                    <c:if test="${myScrapList == null}">
						<div class="book_info" id="book1">
							<p>스크랩 목록이 없습니다.</p>
                    	</div>
					</c:if>
					<c:if test="${myScrapList != null}">
                    	<a><img onclick="location.href='${path}/member/mypage/mypage?sPage=${myScrapPageInfo.prvePage}&sListLimit=${myScrapPageInfo.listLimit}'" class="btn_img" src="${path}/images/left.png" style="margin-right: 5%;"></a>
							<c:forEach var="scrapList" items="${myScrapList}">
								<div class="book_info" id="book1" class="scrap_info">
	                          		<a href="${path}/board/br_board/brReviewDetail?scrapList=${scrapList.scrapNo}" name="thumbnailbox" id="scrapthumbnail_${scrapList.scrapNo}"></a>
	                          		<p id="scrap-bookisbn_${scrapList.scrapNo}" style="display:none"><c:out value="${scrapList.bsIsbn}"/></p>
	                    		</div>
							</c:forEach>
                    	<a><img onclick="location.href='${path}/member/mypage/mypage?sPage=${myScrapPageInfo.nextPage}&sListLimit=${myScrapPageInfo.listLimit}'" class="btn_img" src="${path}/images/right.png" style="margin-left: 5%;"></a>
					</c:if>
                </div>
                <c:if test="${myScrapList != null}">
                <div class="small_pageBar" id="pageBar">
                    <button type="button" onclick="location.href='${path}/member/mypage/mypage?sPage=${myScrapPageInfo.prvePage}&sListLimit=${myScrapPageInfo.listLimit}'">&lt;</button>
                    <c:forEach begin="${myScrapPageInfo.startPage}" end="${myScrapPageInfo.endPage}" step="1" varStatus="status">
						<c:if test="${status.current == myScrapPageInfo.currentPage}">
							<button type="button" disabled><c:out value="${status.current}"/></button>
				   		</c:if>
						<c:if test="${status.current != myScrapPageInfo.currentPage}">
							<button type="button" onclick="location.href='${path}/member/mypage/mypage?sPage=${status.current}&sListLimit=${myScrapPageInfo.listLimit}'"><c:out value="${status.current}"/></button>
				   		</c:if>
					</c:forEach>
                    <button type="button" onclick="location.href='${path}/member/mypage/mypage?sPage=${myScrapPageInfo.nextPage}&sListLimit=${myScrapPageInfo.listLimit}'">&gt;</button>
                </div>
                </c:if>
            </div>
        </div>

        <!-- 캘린더 -->
        <script type="text/javascript">
            var today = new Date();
            var date = new Date();//today의 Date를 세어주는 역할
            function prevCalendar() {//이전 달
             today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
             buildCalendar(); //달력 cell 만들어 출력 
            }
     
            function nextCalendar() {//다음 달
                 today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                 buildCalendar();
            }
            function buildCalendar(){
                var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
                //이번 달의 첫째 날, new를 쓰면 이번달의 로컬 월을 정확하게 받아오기에 getMonth()+1을 안해줘도 된다. 
                var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
                //이번 달의 마지막 날
                var tbCalendar = document.getElementById("calendar");
                //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
                var tbCalendarYM = document.getElementById("tbCalendarYM");
                //테이블에 정확한 날짜 찍는 변수
                 tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
     
                 /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
                while (tbCalendar.rows.length > 2) {
                //열을 지워줌
                //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                      tbCalendar.deleteRow(tbCalendar.rows.length-1);
                      //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                    //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
                 }
                 var row = null;
                 row = tbCalendar.insertRow();
                 // 테이블 초기화
                 var cnt = 0;// count, 셀의 갯수를 세어주는 역할
                // 1일이 시작되는 칸을 맞추어 줌
                 for (i=0; i<doMonth.getDay(); i++) {
                 /*이번달의 day만큼 돌림*/
                      cell = row.insertCell();//열 추가
                      cnt = cnt + 1;
                 }
                /*달력 출력*/
                 for (i=1; i<=lastDate.getDate(); i++) { 
                	
                	var myMonth = (today.getMonth() + 1);
                	var myDay = i;
                	 
                	if((myMonth + "").length < 2){
                		myMonth = "0" + myMonth;
                	}
                	if((i + "").length < 2){
                		myDay = "0" + i;
                	}
                	 
                	var myDate = today.getFullYear() +""+ myMonth +""+ myDay ;
                    cell = row.insertCell();
                     
                    // 리뷰 불러와서 값 세팅하기
                	var arr = new Array("${myReviewList}".listSize);
                	
                	var j = 0;
                	
                	<c:forEach var="board" items="${myReviewList}">
               		<fmt:formatDate var="brCreateDate" value="${board.brCreateDate}" pattern="yyyy-MM-dd"/>
	                	/* 리뷰 등록 날짜 구하기 */
		               	var createDate = "${brCreateDate}";
		               	var dateSplit = createDate.split("-");
		               	var crYear = dateSplit[0];
		               	var crMonth = dateSplit[1];
		               	var crDay = dateSplit[2];
						
		               	createDate = crYear +""+ crMonth +""+ crDay;
	                	arr[j] = { brNo : ${board.brNo}, isbn : '${board.brIsbn}', cr : createDate};
	                		
	                	j = j+1;
                	</c:forEach>
                	
                	// 구한 리뷰 날짜로 새 배열 만들기
                	var newArr = arr.filter(function(item){    
                		  return item.cr === myDate;
                		});  
                	
                	var createDate = "10"; 
                	
                	// 새 배열 빈 값 체크
                	if(newArr.length != 0) {
                		createDate = newArr[0].cr; 
                		var brNo = newArr[0].brNo; 
                		var isbn = newArr[0].isbn; 
                	}
                	
                	// 새로 만든 배열 값으로 캘린더 출력하기
                    if (parseInt(createDate) == parseInt(myDate)){
                     	cell.innerHTML = i + "<div class='calendar_img' id='calendar_img_" + brNo + "'></div>"
                     	+ '<input type="hidden" id="review-bookisbn_' + brNo + '" value="' + isbn + '">';
                	} else {
                		cell.innerHTML = i + "<div class='calendar_img'/>";
                	}                 
                    cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                     
					/*일요일 계산*/
                    if (cnt % 7 == 1) {
	                	if (parseInt(createDate) == parseInt(myDate)){
	                    	cell.innerHTML = "<font color=#F79DC2>" + i + "<div class='calendar_img' id='calendar_img_" + brNo + "'></div>"
	                     	+ '<input type="hidden" id="review-bookisbn_' + brNo + '" value="' + isbn + '">';
	                  	} else {
	                  		cell.innerHTML = "<font color=#F79DC2>" + i + "<div class='calendar_img'/>";
	                  	}
               		}    
                      
                      
                  	/* 토요일 구하기*/
                 	if (cnt%7 == 0){
                		if (parseInt(createDate) == parseInt(myDate)){
                      		cell.innerHTML = "<font color=skyblue>" + i + "<div class='calendar_img' id='calendar_img_" + brNo + "'></div>"
                         	+ '<input type="hidden" id="review-bookisbn_' + brNo + '" value="' + isbn + '">';
                    	} else {
                      		cell.innerHTML = "<font color=skyblue>" + i + "<div class='calendar_img'/>";
                    	}
                       		row = calendar.insertRow();
                  	}
                  
                  	/* 오늘 날짜 */
                  	if (today.getFullYear() == date.getFullYear()
                    	&& today.getMonth() == date.getMonth()
                    	&& i == date.getDate()) {
                    	cell.bgColor = "#FAF58C";
                   	}
				}
            }
        </script>

        <div class="boolcalendar">
            <p class="title"><B>Calendar</B></p>
            <div class="calendar">
                <table id="calendar">
                    <tr style="height: 5%;"><!-- label은 마우스로 클릭을 편하게 해줌 -->
                        <th><label id="preCal" onclick="prevCalendar()">&lt;</label></td>
                        <th id="tbCalendarYM" colspan="5">
                        yyyy년 m월</th>
                        <th><label id="nextCal" onclick="nextCalendar()">&gt;</label></th>
                    </tr>
                    <tr style="height: 5%;">
                        <th>SUN</th>
                        <th>MON</th>
                        <th>TUE</th>
                        <th>WED</th>
                        <th>THU</th>
                        <th>FRI</th>
                        <th>SAT</th>
                    </tr> 
                </table>
            </div>
        </div>

        <script language="javascript" type="text/javascript">
            buildCalendar();//
        </script>

        <!-- 북클럽 -->
        <div class="bookclub">
            <p class="title"><B>Clubs</B></p>
            <div class="club">
                <div class="join_club">
                    <div class="content">
                        <c:if test="${myClubList == null}">
							<div class="book_info" id="book1">
								참여중인 클럽이 없습니다.
                          	</div>
						</c:if>
						<c:if test="${myClubList != null}">
                        <a><img onclick="location.href='${path}/member/mypage/mypage?cPage=${myClubPageInfo.prvePage}&cListLimit=${myClubPageInfo.listLimit}'" class="btn_img" src="${path}/images/left.png" style="margin-right: 5%;"></a>
							<c:forEach var="clublist" items="${myClubList}">
								<div class="book_info" id="book1">
								<a href="#" name="thumbnailbox"><img onclick="location.href='${path}/board/bc_board/bcBoardDetail?bcNo=${clublist.bcNo}'" class="club_image" value="${clublist.bcNo}" src="${path}/upload/bf_board/${clublist.bcModifyImage}"></a>
                           		<p>${clublist.bcOriginTitle}</p>
                           		</div>
							</c:forEach>
                        <a><img onclick="location.href='${path}/member/mypage/mypage?cPage=${myFundPageInfo.nextPage}&cListLimit=${myClubPageInfo.listLimit}'" class="btn_img" src="${path}/images/right.png" style="margin-left: 5%;"></a>
						</c:if>
                    </div>
                    <c:if test="${myClubList != null}">
                    <div class="pageBar">
                        <div class="small_pageBar" id="pageBar">
                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?cPage=${myClubPageInfo.prvePage}&cListLimit=${myClubPageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${myClubPageInfo.startPage}" end="${myClubPageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == myClubPageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != myClubPageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/mypage/mypage?cPage=${status.current}&cListLimit=${myClubPageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?cPage=${myFundPageInfo.nextPage}&cListLimit=${myClubPageInfo.listLimit}'">&gt;</button>
                        </div>
                    </div>
                    </c:if>
                </div>
                <div class="my_list">
                    <div class="content">
                        <p>클럽제안현황</p>
                        <table class="list_table">
                            <tr>
                                <th class="th">No</th>
                                <th class="th">Title</th>
                                <th class="th">Status</th>
                            </tr>
                            <c:if test="${myAplctClubList == null}">
								<tr>
									<td colspan="6">
										제안 된 클럽 내역이 없습니다.
									</td>
								</tr>	
							</c:if>
							<c:if test="${myAplctClubList != null}">
								<c:forEach var="aplctBC" items="${myAplctClubList}">
									<tr>
										<td><c:out value="${aplctBC.proposeNo}"/></td>
										<td><a href="${path}/board/bc_board//bcBoardRead?proposeNo=${aplctBC.proposeNo}"><c:out value="${aplctBC.proposeTitle}"/></a></td>
										<td>
											<c:choose>
												<c:when test="${aplctBC.proposeStatus eq 'N'}">미승인</c:when>
												<c:otherwise>승인</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:if>
                        </table>
                    </div>
                    <c:if test="${myAplctClubList != null}">
                    <div class="pageBar">
                        <div id="pageBar">
                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?cAplctPage=${myAplctClubpageInfo.prvePage}&cAplctListLimit=${myAplctClubpageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${myAplctClubpageInfo.startPage}" end="${myAplctClubpageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == myAplctClubpageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != myAplctClubpageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/mypage/mypage?cAplctPage=${status.current}&cAplctListLimit=${myAplctClubpageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?cAplctPage=${myAplctClubpageInfo.nextPage}&cAplctListLimit=${myAplctClubpageInfo.listLimit}'">&gt;</button>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- 북펀딩 -->
        <div class="bookfunding">
            <p class="title"><B>Funding</B></p>
            <div class="funding">
	                <div class="join_club">
	                    <div class="content">
	                            <c:if test="${myFundList == null}">
	                        		<div class="book_info" id="book1">
										참여한 펀딩이 없습니다.
	                        		</div>
								</c:if>
								<c:if test="${myFundList != null}">
	                        		<a><img onclick="location.href='${path}/member/mypage/mypage?fPage=${myFundPageInfo.prvePage}&fListLimit=${myFundPageInfo.listLimit}'" class="btn_img" src="${path}/images/left.png" style="margin-right: 5%;"></a>
										<c:forEach var="fundlist" items="${myFundList}">
		                        			<div class="book_info" id="book1">
												<a href="#" name="thumbnailbox"><img onclick="location.href='${path}/board/bf_board/bf_viewDetail?bfNo=${fundlist.bfNo}'" class="image" value="${fundlist.bfNo}" src="${path}/upload/bf_board/${fundlist.bfReImgName}"></a>
		                            			<p>${fundlist.bfTitle}</p>
		                        			</div>
										</c:forEach>
	                        		<a><img onclick="location.href='${path}/member/mypage/mypage?fPage=${status.current}&fListLimit=${myFundPageInfo.listLimit}'" class="btn_img" src="${path}/images/right.png" style="margin-left: 5%;"></a>
								</c:if>
	                    </div>
	                    <c:if test="${myFundList != null}">
	                    <div class="pageBar">
	                        <div class="small_pageBar" id="pageBar">
	                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?fPage=${myFundPageInfo.prvePage}&fListLimit=${myFundPageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${myFundPageInfo.startPage}" end="${myFundPageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == myFundPageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != myFundPageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/mypage/mypage?fPage=${status.current}&fListLimit=${myFundPageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?fPage=${myFundPageInfo.nextPage}&fListLimit=${myFundPageInfo.listLimit}'">&gt;</button>
	                        </div>
	                    </div>
	                    </c:if>
	                </div>
	                <div class="my_list">
	                    <div class="content">
	                        <p>개설 신청 현황</p>
	                        <table class="list_table">
	                            <tr>
	                                <th class="th">No</th>
	                                <th class="th">Title</th>
	                                <th class="th">Status</th>
	                            </tr>
	                            <c:if test="${myAplctFundList == null}">
									<tr>
										<td colspan="6">
											조회된 펀딩 내역이 없습니다.
										</td>
									</tr>	
								</c:if>
								<c:if test="${myAplctFundList != null}">
									<c:forEach var="aplctBF" items="${myAplctFundList}">
										<tr>
											<td><c:out value="${aplctBF.bfNo}"/></td>
											<td><a href="${path}/board/bf_board/bf_userCheck?bfNo=${aplctBF.bfNo}"><c:out value="${aplctBF.bfTitle}"/></a></td>
											<td>
												<c:choose>
													<c:when test="${aplctBF.bfStatus eq 'N'}">검토중</c:when>
													<c:when test="${aplctBF.bfStatus eq 'P'}">모집중</c:when>
													<c:when test="${aplctBF.bfStatus eq 'D'}">거절</c:when>
													<c:otherwise>마감</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:if>
	                        </table>
	                    </div>
	                    <c:if test="${myAplctFundList != null}">
	                    <div class="pageBar">
	                        <div id="pageBar">
	                            <!-- 이전 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?fAplctPage=${pageInfo.prvePage}&fAplctListLimit=${pageInfo.listLimit}'">&lt;</button>
	                            <!--  10개 페이지 목록(비트윈으로 조회) -->
	                            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
									<c:if test="${status.current == pageInfo.currentPage}">
										<button type="button" disabled><c:out value="${status.current}"/></button>
					   				</c:if>
									<c:if test="${status.current != pageInfo.currentPage}">
										<button type="button" onclick="location.href='${path}/member/mypage/mypage?fAplctPage=${status.current}&fAplctListLimit=${pageInfo.listLimit}'"><c:out value="${status.current}"/></button>
					   				</c:if>
								</c:forEach>
	                            <!-- 다음 페이지로 -->
	                            <button type="button" onclick="location.href='${path}/member/mypage/mypage?fAplctPage=${pageInfo.nextPage}&fAplctListLimit=${pageInfo.listLimit}'">&gt;</button>
	                        </div>
	                    </div>
	                    </c:if>
	                </div>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
    $(document).ready(function () {
    	
		 	<c:forEach var="board" items="${myReviewList}">
		 	 var isbn = $('#review-bookisbn_${board.brNo}').val();
		 	 
            $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                data: { query: isbn },
                headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
            })
                .done(function (msg) {
                    console.log(msg.documents[0].title);
                    console.log(msg.documents[0].thumbnail);
                    $("#calendar_img_${board.brNo}").append("<a><img onclick=\"location.href='${path}/board/br_board/brReviewDetail?brNo=${board.brNo}'\" class='calendar_image' src='" + msg.documents[0].thumbnail + "'/></a>");
                });
            </c:forEach> 
            
            // 스크랩
            <c:forEach var="scrapList" items="${myScrapList}">
		 	 var isbn = document.getElementById("scrap-bookisbn_${scrapList.scrapNo}").innerText
		 	 
            $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                data: { query: isbn },
                headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
            })
                .done(function (msg) {
                    console.log(msg.documents[0].title);
                    console.log(msg.documents[0].thumbnail);
                    $("#scrapthumbnail_${scrapList.scrapNo}").append("<img class='scrap_image' src='" + msg.documents[0].thumbnail + "'/>");
                    $("#scrap-booktitle_${scrapList.scrapNo}").append(msg.documents[0].title);
                });
            </c:forEach> 
            
    });
    
            $("#nextCal, #preCal").on('click', function (){
            	<c:forEach var="board" items="${myReviewList}">
   		 	 var isbn = $('#review-bookisbn_${board.brNo}').val();
   		 	 
               $.ajax({
                   method: "GET",
                   url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                   data: { query: isbn },
                   headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
               })
                   .done(function (msg) {
                       console.log(msg.documents[0].title);
                       console.log(msg.documents[0].thumbnail);
                       $("#calendar_img_${board.brNo}").append("<a><img onclick=\"location.href='${path}/board/br_board/brReviewDetail?brNo=${board.brNo}'\" class='calendar_image' src='" + msg.documents[0].thumbnail + "'/></a>");
                   });
               </c:forEach>
            });
            	function profile() {
            		location.href = "${path}/member/mypage/profile";
				}
            	function bookclub() {
            		location.href = "${path}/member/mypage/profile";
				}
            	function bookreview() {
            		location.href = "${path}/brReviewDetail";
				}
	</script>
	
<%@ include file="../../../views/common/footer.jsp" %>