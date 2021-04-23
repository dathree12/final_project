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
            <p class="title">profile</p>
            <div class="profile">
                <p style="padding-left: 10px;"><span>${member.name}</span>님 환영합니다.</p>
                <button class="info_btn" onclick="profile();">회원정보수정</button>
            </div>
            
            <!-- 스크랩 -->
            <p class="scrap_title">scrap</p>
            <div class="scrap">
                <div>
                    <a><img class="btn_img" src="${path}/images/left.png" style="margin-right: 5%;"></a>
                    <div class="book_info" id="book1">
                        <a href="#" name="thumbnailbox"><img class="scrap_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-A5U34i3_y1GNyv8o_I9piMiSFg52KPQzw&usqp=CAU"></a>
                        <p>책이름</p>
                        <div class="starRev">
                            <span class="starR on">1</span>
                            <span class="starR on">2</span>
                            <span class="starR">3</span>
                            <span class="starR">4</span>
                            <span class="starR">5</span>
                        </div>
                    </div>
                    <div class="book_info" id="book1">
                        <a href="#" name="thumbnailbox"><img class="scrap_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-A5U34i3_y1GNyv8o_I9piMiSFg52KPQzw&usqp=CAU"></a>
                        <p>책이름</p>
                        <div class="starRev">
                            <span class="starR on">1</span>
                            <span class="starR on">2</span>
                            <span class="starR">3</span>
                            <span class="starR">4</span>
                            <span class="starR">5</span>
                        </div>
                    </div>
                    <div class="book_info" id="book1">
                        <a href="#" name="thumbnailbox"><img class="scrap_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-A5U34i3_y1GNyv8o_I9piMiSFg52KPQzw&usqp=CAU"></a>
                        <p>책이름</p>
                        <div class="starRev">
                            <span class="starR on">★</span>
                            <span class="starR on">★</span>
                            <span class="starR">★</span>
                            <span class="starR">★</span>
                            <span class="starR">★</span>
                        </div>
                    </div>
                    <a><img class="btn_img" src="${path}/images/right.png" style="margin-left: 5%;"></a>
                </div>
                <div class="small_pageBar" id="pageBar">
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

        <!-- 캘린더 -->
        <script type="text/javascript">
            var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
            var date = new Date();//today의 Date를 세어주는 역할
            function prevCalendar() {//이전 달
            // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
             buildCalendar(); //달력 cell 만들어 출력 
            }
     
            function nextCalendar() {//다음 달
                // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
                //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
                //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
                 today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                 buildCalendar();
            }
            function buildCalendar(){
                var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
                //이번 달의 첫째 날, new를 쓰면 이번달의 로컬 월을 정확하게 받아오기에 getMonth()+1을 안해줘도 된다. 
                var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
                //이번 달의 마지막 날
                //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
                //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
                //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
                var tbCalendar = document.getElementById("calendar");
                //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
                var tbCalendarYM = document.getElementById("tbCalendarYM");
                //테이블에 정확한 날짜 찍는 변수
                //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
                //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
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
                 //테이블에 새로운 열 삽입//즉, 초기화
                 var cnt = 0;// count, 셀의 갯수를 세어주는 역할
                // 1일이 시작되는 칸을 맞추어 줌
                 for (i=0; i<doMonth.getDay(); i++) {
                 /*이번달의 day만큼 돌림*/
                      cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                      cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
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
                     cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                     
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
                     	cell.innerHTML = i 
                     	+ "<div class='calendar_img' id='calendar_img_" + brNo + "'></div>"
                     	+ '<input type="hidden" id="review-bookisbn_' + brNo + '" value="' + isbn + '">';
                	 } else {
                		cell.innerHTML = i + "<div class='calendar_img'/>";
                	 }                 
                      cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                     
                  /*일요일 계산*/
                  if (cnt % 7 == 1) {
                	 if (parseInt(createDate) == parseInt(myDate)){
                    	cell.innerHTML = "<font color=#F79DC2>" + i + "<div class='calendar_img' id='calendar_img_${board.brNo}'></div>"
                    	+ '<input type="hidden" id="review-bookisbn_${board.brNo}" value="${board.brIsbn}">';
                  	 } else {
                  		cell.innerHTML = "<font color=#F79DC2>" + i + "<div class='calendar_img'/>";
                  	 }
                }    
                      
                      
                  /* 토요일 구하기*/
                  if (cnt%7 == 0){
                	  if (parseInt(createDate) == parseInt(myDate)){
                      cell.innerHTML = "<font color=skyblue>" + i + "<div class='calendar_img' id='calendar_img_${board.brNo}'></div>"
                      + '<input type="hidden" id="review-bookisbn_${board.brNo}" value="${board.brIsbn}">';
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
            <p class="title">calendar</p>
            <div class="calendar">
                <table id="calendar">
                    <tr style="height: 5%;"><!-- label은 마우스로 클릭을 편하게 해줌 -->
                        <th><label onclick="prevCalendar()">&lt;</label></td>
                        <th id="tbCalendarYM" colspan="5">
                        yyyy년 m월</th>
                        <th><label onclick="nextCalendar()">&gt;</label></th>
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
            <p class="title">북클럽</p>
            <div class="club">
                <div class="join_club">
                    <div class="content">
                        <a><img class="btn_img" src="${path}/images/left.png" style="margin-right: 5%;"></a>
                        <c:if test="${myClubList == null}">
									참여중인 클럽이 없습니다.
						</c:if>
						<c:if test="${myClubList != null}">
							<c:forEach var="clublist" items="${myClubList}">
								<div class="book_info" id="book1">
								<a href="#" name="thumbnailbox"><img class="club_image" onclick="bookclub();" value="${clublist.bcNo}" src="${path}/upload/bf_board/${clublist.bcModifyImage}"></a>
                           		<p>${clublist.bcOriginTitle}</p>
                           		</div>
							</c:forEach>
						</c:if>
                        <a><img class="btn_img" src="${path}/images/right.png" style="margin-left: 5%;"></a>
                    </div>
                    <div class="pageBar">
                        <div class="small_pageBar" id="pageBar">
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
										<td><a href="#"><c:out value="${aplctBC.proposeTitle}"/></a></td>
										<td><c:out value="${aplctBC.proposeStatus}"/></td>
									</tr>
								</c:forEach>
							</c:if>
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
            <p class="title">북펀딩</p>
            <div class="funding">
	                <div class="join_club">
	                    <div class="content">
	                        <a><img class="btn_img" src="${path}/images/left.png" style="margin-right: 5%;"></a>
	                        <div class="book_info" id="book1">
	                            <c:if test="${myFundList == null}">
											참여한 펀딩이 없습니다.
								</c:if>
								<c:if test="${myFundList != null}">
									<c:forEach var="fundlist" items="${myFundList}">
										<a href="#" name="thumbnailbox"><img class="image" onclick="bookfunding();" value="${fundlist.bfNo}" src="${path}/upload/bf_board/${fundlist.bfReImgName}"></a>
	                            		<p>${fundlist.bfTitle}</p>
									</c:forEach>
								</c:if>
	                        </div>
	                        <a><img class="btn_img" src="${path}/images/right.png" style="margin-left: 5%;"></a>
	                    </div>
	                    <div class="pageBar">
	                        <div class="small_pageBar" id="pageBar">
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
	                <div class="my_list">
	                    <div class="content">
	                        <p>개설 신청 현황</p>
	                        <table class="list_table">
	                            <tr>
	                                <th class="th">No</th>
	                                <th class="th">Title</th>
	                                <th class="th">Status</th>
	                            </tr>
	                            <tbody>
	                            </tbody>
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
											<td><c:out value="${aplctBF.bfStatus}"/></td>
										</tr>
									</c:forEach>
								</c:if>
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
    </section>
    
    <script type="text/javascript">
    $(document).ready(function () {
		 //나중에 RestTemplate으로 바꾸기
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
                    $("#calendar_img_${board.brNo}").append("<img class='calendar_image' src='" + msg.documents[0].thumbnail + "'/>");
                });
            </c:forEach> 
            <c:forEach var="board" items="${myScrapList}">
		 	 var isbn = document.getElementById("scrap-bookisbn_${board.scrapNo}").innerText
		 	 
            $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                data: { query: isbn },
                headers: { Authorization: "KakaoAK 954b12f5b02d89c0024a777f0dab5148" },
            })
                .done(function (msg) {
                    console.log(msg.documents[0].title);
                    console.log(msg.documents[0].thumbnail);
                    $("#reviewthumbnail_${board.brNo}").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                    $("#review-booktitle_${board.brNo}").append(msg.documents[0].title)
                });
            </c:forEach> 

    });
            	function profile() {
            		location.href = "${path}/member/mypage/profile";
				}
            	function bookclub() {
            		location.href = "${path}/bcBoardDetail";
				}
            	function bookfunding() {
            		location.href = "${path}/board/bf_board/bf_boardList";
				}
            	function bookreview() {
            		location.href = "${path}/brReviewDetail";
				}
	</script>
	
<%@ include file="../../../views/common/footer.jsp" %>