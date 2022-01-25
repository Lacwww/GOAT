<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<%@ include file="../tool3.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript">
	$(function() {
		$.post('/goat/member/chkAlert.do', "m_num=${m_num}", function(alert) {
			console.log(alert);
		});
	});
</script>

<script type="text/javascript">
	document.cookie = "safeCookie1=foo; SameSite=Lax";
	document.cookie = "safeCookie2=foo";
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
	var id = [];
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
	}, true);

	$(document).ready(
			function() {
				if(${m_num==null}) { 
					alert("로그인 후 이용해주세요");
					location.href='${path}/member/loginForm.do';
				}
				var today = new Date();
				$('#datepick').daterangepicker(
						{
							"locale" : {
								"format" : "YYYY-MM-DD",
								"separator" : " ~ ",
								"applyLabel" : "확인",
								"cancelLabel" : "취소",
								"fromLabel" : "From",
								"toLabel" : "To",
								"customRangeLabel" : "Custom",
								"weekLabel" : "W",
								"daysOfWeek" : [ "일", "월", "화", "수", "목", "금",
										"토" ],
								"monthNames" : [ "1월", "2월", "3월", "4월", "5월",
										"6월", "7월", "8월", "9월", "10월", "11월",
										"12월" ],
							},
							"minDate" : new Date(),
							"startDate" : new Date(),
							"endDate" : new Date(),
							"drops" : "auto"
						},
						function(start, end, label) {
							$('input[name=s_date]').val(
									start.format('YYYY-MM-DD'));
							$('input[name=e_date]').val(
									end.format('YYYY-MM-DD'));
							console.log('New date range selected: '
									+ start.format('YYYY-MM-DD') + ' to '
									+ end.format('YYYY-MM-DD')
									+ ' (predefined range: ' + label + ')');
						});

				if (keyword == null || keyword == '') {
					var keyword = $('#keyword').val();
					var search = $('#search option:selected').val()
					$('#list').load("placeList.do?place_area=${place_area}");
				}
			});
	function searchPlace() {
		var keyword = $('#keyword').val();
		var search = $('#search option:selected').val()
		$('#list').load(
				'placeList.do?search=' + search + '&keyword=' + keyword
						+ '&place_area=${place_area}');
		setMarkers(null);
	}

	function chk() {
		if ($('#sdate').val() == null || $('#sdate').val() == ""
				|| $('#edate').val() == null || $('#edate').val() == "") {
			alert("여행 일정을 선택해 주세요");
			return false;
		}

		var table = document.getElementById('Ppick');
		var s_date = $('input[name=s_date]').val();
		var s_arr = s_date.split("-");
		var e_date = $('input[name=e_date]').val();
		var e_arr = e_date.split("-");
		var stDate = new Date(s_arr[0], s_arr[1], s_arr[2]);
		var endDate = new Date(e_arr[0], e_arr[1], e_arr[2]);
		var btMs = endDate.getTime() - stDate.getTime();
		var days = btMs / (1000 * 60 * 60 * 24) + 1;
		var tbody = table.tBodies[0].rows.length
		if (tbody < days) {
			alert("선택한 플레이스가 여행 일수보다 적을 수 없습니다.");
			return false;
		}
	}

	function show(cate) {
		$('.place_box').hide();
		$('#' + cate).show();
		$('.btn-success').removeClass('btn-success').addClass('btn-info');
		$('#cate_'+cate).removeClass('btn-info').addClass('btn-success');
	}
</script>
<style type="text/css">
div #map {
	text-align: center;
}

input {
	border-radius: 3px;
}

.date {
	text-align: center;
}

#list {
	margin-left: 3px;
	height: 65%;
}

#wrapper {
	width: 65%;
	height: 100%;
	margin: auto;
	margin-top: 4%;
}

.pList {
	margin-bottom: 20px;
}

#pimage {
	margin-bottom: 20px;
	float: left;
}

select {
	width: 80px;
	height: 40px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	font-size: 14px;
	background: url('${path}/resources/images/arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}

#datepick {
	width: 200px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link active" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Trip</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/myPage.do"><img
								title="MyPage" style="border-radius: 50%;"
								src="/goat/resources/m_photo/${m_img }" width="70px"
								height="70px" /></a></li>						
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/admin/admin.do">AdminPage</a></li>						
					</c:if>
					<c:if test="${not empty id && empty admin }">
					<li class="nav-item">
						<ul class="dropdown">
							<c:if test="${empty alert}">
								<img src="/goat/resources/images/notice.png" title="notice" width="40px" height="40px">
							</c:if>
							<c:if test="${not empty alert }">
								<img data-toggle="dropdown" alt="" src="/goat/resources/images/notice2.png"
									title="notice" width="40px" height="40px">
								<ul class="dropdown-menu" role="menu" style="margin-top: 20px;">
									<c:forEach var="list" items="${alert }">
										<c:if test="${list.sch_num!=0 && list.day >= 0 && list.day < 8 && list.cs_num==0 && list.temp_num==0 && list.t_num==0}">
											<c:if test="${list.day == 0 }">
												<li role="presentation">
													<a role="menuitem" href="${path }/member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } 출발일입니다.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="${path }//member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }이 ${list.day}일 남았습니다.</a>
												</li>
											</c:if>
										</c:if>
										<c:if test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }에 대한 ${list.temp_crud } 요청이 
													<c:if test="${list.del == 'y' }">
														승인 완료되었습니다
													</c:if>
													<c:if test="${list.del == 'd' }">
														승인 거절되었습니다
													</c:if>
												</a>
											</li>
										</c:if>
										<c:if test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }에 답변이 달렸습니다 </a>
											</li>
										</c:if>
										<c:if test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
											<li role="presentation">
												<c:if test="${list.t_like==1 && list.t_reply==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 좋아요를 눌렀습니다 </a>
												</c:if>
												<c:if test="${list.t_reply==1 && list.t_like==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 댓글이 달렸습니다 </a>
												</c:if>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div style="width: 100%; height: 100%; margin-top: 100px;">
		<h2 class="text text-primary" align="center">여행할 장소를 선택해주세요</h2>
		<!-- 여행 일자 선택 -->
		<div id="wrapper">
			<form action="makeScheduleDetail.do" name="frm" method="post"
				onsubmit="return chk();">
				<div id="navyDiv" style="width: 100%; height: 13%;">
					<input type="hidden" id="id" name="id" value=""> <input
						type="hidden" name="place_area" value="${place_area }">
					<div style="width: 100%;display:flex;align-items: flex-start;justify-content: space-between;flex-direction: column;">
						<div style="width: 100%;">
							<img alt="calendar" src="${path }/resources/images/calendar.png"
								style="width: 60px; height: 70px; padding-bottom: 5px;"> <input
								type="text" id="datepick" value=""> <input type="hidden"
								name="s_date" id="sdate" class="date"> <input type=hidden
								name="e_date" id="edate" class="date">
						</div>
						<!-- 플레이스 검색 -->
						<div style="float: right;margin-right: 3%;display:flex;align-items: center;flex-direction: row;width:100%;justify-content: space-between;">
							<div>
								<select name="search" id="search">
									<c:forTokens var="sh" items="place_name,place_tag" delims=","
										varStatus="i">
										<c:if test="${sh==place.search }">
											<option value="${sh }" selected="selected">${t[i.index ]}</option>
										</c:if>
										<c:if test="${sh!=place.search }">
											<option value="${sh }">${t[i.index ]}</option>
										</c:if>
									</c:forTokens>
								</select> <input type="text" name="keyword" id="keyword"
									placeholder="검색어를 입력해주세요" value="" style="width: 200px; height: 40px;"> <input
									type="button" class="btn btn-light" onclick="searchPlace()"
									value="검색"  style="width: 60px; height: 40px;">
							</div>
							<!-- 플레이스 카테고리 선택 -->
							<div align="center" style="margin-right: 8%;">
								<div class="btn btn-success" id="cate_tour" onclick="show('tour')">관광지</div>
								<div class="btn btn-info" id="cate_food" onclick="show('food')">식당</div>
								<div class="btn btn-info" id="cate_rest" onclick="show('rest')">숙소</div>
							</div>
						</div>
					</div>

				</div>
				<div>
				<div class="mapDiv" style="width: 65%; float: left;">
					<!-- 지도 -->
					<div id="map" style="width: 100%; height: 60%;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0&libraries=services"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667),
							level : 9
						};
						var map = new kakao.maps.Map(container, options);
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('${place_area}', function(
								result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
					</script>
					<div id="btn" align="center" style="margin-top: 1%;">
						<input type="submit" value="상세일정 작성" class="btn btn-primary">
						<input type="button" value="취소" onclick="history.back()"
							class="btn btn-danger">
					</div>


				</div>

				<!-- 플레이스 목록 -->
				<div id="list" style="top: 100px;"></div>

				<!-- 플레이스 고른 목록 -->
				<div id="pick_place" style="align-items: center;">
					<table class="table table-bordered table-striped" id="Ppick"
						style="align-content: center;">
						<caption style="caption-side: top;">내가 고른 플레이스 목록</caption>
						<thead>
							<tr>
								<th>사진</th>
								<th>장소</th>
								<th>주소</th>
								<th>태그</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>