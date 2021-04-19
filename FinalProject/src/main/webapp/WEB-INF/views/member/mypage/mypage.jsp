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
        <script>
            // $('.starRev span').click(function(){
            // $(this).parent().children('span').removeClass('on');
            // $(this).addClass('on').prevAll('span').addClass('on');
            // return false;
            // });
        </script>

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
                 buildCalendar();//달력 cell 만들어 출력
            }
            function buildCalendar(){//현재 달 달력 만들기
                var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
                //이번 달의 첫째 날,
                //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
                //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
                //왜냐면 getMonth()는 0~11을 반환하기 때문
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
                 //1일부터 마지막 일까지 돌림
                      cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                      cell.innerHTML = i + "<div class='calendar_img'><img class=calendar_image src=" + "></div>";//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                      cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                  if (cnt % 7 == 1) {/*일요일 계산*/
                      //1주일이 7일 이므로 일요일 구하기
                      //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                    cell.innerHTML = "<font color=#F79DC2>" + i + "<div class='calendar_img'><img class=calendar_image onclick='bookreview();' src=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD-A5U34i3_y1GNyv8o_I9piMiSFg52KPQzw&usqp=CAU></div>"
                    //1번째의 cell에만 색칠
                }    
                  if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                      //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                      cell.innerHTML = "<font color=skyblue>" + i + "<img class=calendar_image src=" + ">"
                      //7번째의 cell에만 색칠
                       row = calendar.insertRow();
                       //토요일 다음에 올 셀을 추가
                  }
                  /*오늘의 날짜에 노란색 칠하기*/
                  if (today.getFullYear() == date.getFullYear()
                     && today.getMonth() == date.getMonth()
                     && i == date.getDate()) {
                      //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                    cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
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
                        <!-- 
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
						 -->
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
                            <!-- 
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
							 -->
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
											<td><a href="#"><c:out value="${aplctBF.bfTitle}"/></a></td>
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