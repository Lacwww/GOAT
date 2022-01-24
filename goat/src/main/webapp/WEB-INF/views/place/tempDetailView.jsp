<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.top {float: left; }
	.bgcolor{	
		background-color: rgb(64,123,37);
		color: white; 
		border-radius: 5px;
	}
	.textTh {text-align:center; width: 20%; border-bottom: 1px solid white; }
	.textTh1 {text-align:center; width: 17%; border-bottom: 1px solid white; }
	.lpad {padding-left: 5%; border-bottom: 1px solid black;}
	.rblack {border-right: 1px solid black;}
</style>
<script type="text/javascript">
	function del() {
		var con = confirm("등록된 건의를 취소 처리하시겠습니까?");
		if(con){
			location.href='${path}/place/deleteTempPlace.do?temp_num=${tp.temp_num }';
		}
	}
	
	function insertTemp() {
		var con = confirm("등록된 건의를 승인 처리하시겠습니까?");
		if(con){
			location.href="${path}/place/insertPlace.do?temp_num=${tp.temp_num }";
		}
	}
	function updateTemp() {
		var con = confirm("등록된 건의를 승인 처리하시겠습니까?");
		if(con){
			location.href="${path}/place/updatePlace.do?temp_num=${tp.temp_num }";
		}
	}
	
</script>
</head>
<body>
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav" style="margin-bottom: 0px;">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a id="active" class="nav-link active" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
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
													<a role="menuitem" href="/member/alertSch.do?ale_num${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } 출발일입니다.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="/member/alertSch.do?ale_num${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }이 ${list.day}일 남았습니다.</a>
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
<div align="center" class="text-primary" style="color: green; margin-top: 8%;"><h2><b>등록 건의 상세보기 </b></h2></div>
<br>
<c:if test="${empty place }">
<div style="width: 100%;">
	<div align="center" class="container" style="width: 85%;">
		<div style="display: flex; justify-content: center;">
		<div align="center" class="top"><img alt="" src="${tp.temp_photo }" style="width: 450px; height: 400px;"></div>
		<div id="map" class="top" style="width:450px; height: 400px;"></div>
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(${tp.lat}, ${tp.lng}),
				level: 3
			};	
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${tp.lat}, ${tp.lng}); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			map.setZoomable(false); 
			map.setDraggable(false); 
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
	</div>
</div>
<div style="width: 100%;">
	<div class="container" align="center" style="width: 85%; margin-top: 20px;">
		<h2 class="text-primary" style="color: green;" align="center"><b>장소명 :</b><span style="color: black;"> ${tp.temp_name }</span></h2>
		<h3 class="text-primary" style="color: green;" align="center"><b>건의자 :</b><span style="color: black;"> ${member.m_name }</span></h3>
		<br>
		<table style="width: 65% ">
			<tr><td class="bgcolor textTh"><h4>요청사항</h4>
				</td><td class="lpad">${tp.temp_crud }
					<c:if test="${tp.del == 'y' }">
						<b style="color: red"> (처리 완료)</b>
					</c:if>
					<c:if test="${tp.del == 'c' }">
						<b style="color: red"> (본인 취소)</b>
					</c:if>
					<c:if test="${tp.del == 'd' }">
						<b style="color: red"> (건의가 거절되었습니다)</b>
					</c:if>	</td></tr>
			<tr><td class="bgcolor textTh"><h4>지역</h4></td><td class="lpad">${tp.temp_area }</td></tr>
			<tr><td class="bgcolor textTh"><h4>상세지역 </h4></td><td class="lpad">${tp.temp_areadetail }</td></tr>
			<tr><td class="bgcolor textTh"><h4>카테고리</h4></td><td class="lpad">${tp.temp_cate }</td></tr>
			<tr><td class="bgcolor textTh"><h4>지번 주소</h4></td><td class="lpad">${tp.temp_addr }</td></tr>
			<tr><td class="bgcolor textTh"><h4>도로명 주소</h4></td><td class="lpad">${tp.temp_addrd }</td></tr>
			<tr><td class="bgcolor textTh"><h4>태그</h4></td><td class="lpad">${tp.temp_tag }</td></tr>
			<tr><td class="bgcolor textTh"><h4>내용</h4></td><td class="lpad">${tp.temp_content }</td></tr>
			<tr><td class="bgcolor textTh"><h4>건의 이유</h4></td><td class="lpad">${tp.temp_explanation }</td></tr>
		</table>
		<div align="center">
			<c:if test="${empty admin }">
				<button class="btn bgcolor" style="margin-top: 10px;" onclick="location.href='${path}/member/createPlaceList.do?m_num=${m_num }'">목록</button>
			</c:if>	
			<c:if test="${not empty admin && tp.del == 'n'}">
				<button class="btn btn-primary" style="margin-top: 10px;" onclick="insertTemp()">건의 완료</button>
				<button class="btn btn-danger" style="margin-top: 10px;" onclick="del()">건의 취소</button>
			</c:if>
		</div>
	</div>
</div>
</c:if>
<c:if test="${not empty place  && tp.del == 'n'}">
	<div align="center">
	<table style=" width: 50%">
		<tr><th class="bgcolor textTh1"><h4>사진</h4></th>
			<th><img alt="" src="${place.place_photo }" style="width: 390px; height: 380px;"></th>
			<th><img alt="" src="${tp.temp_photo }" style="width: 390px; height: 380px;"></th></tr>
		<tr><th class="bgcolor textTh1"><h4>위치</h4></th><th>
				<div id="map" class="top" style="width:390px; height: 380px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(${place.lat}, ${place.lng}),
							level: 3
						};	
						var map = new kakao.maps.Map(container, options);
						
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(${place.lat}, ${place.lng}); 
			
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						
						map.setZoomable(false); 
						map.setDraggable(false); 
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
					</script></th>
				<th>
					<div id="map1" class="top" style="width:390px; height: 380px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9"></script>
						<script>
							var container = document.getElementById('map1');
							var options = {
								center: new kakao.maps.LatLng(${tp.lat}, ${tp.lng}),
								level: 3
							};	
							var map = new kakao.maps.Map(container, options);
							
							// 마커가 표시될 위치입니다 
							var markerPosition  = new kakao.maps.LatLng(${tp.lat}, ${tp.lng}); 
				
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							
							map.setZoomable(false); 
							map.setDraggable(false); 
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
						</script></th>
			</tr>
			<tr><th class="bgcolor textTh1"><h4>요청사항</h4></th>
				<td colspan="2" class="lpad">${tp.temp_crud }</td></tr>
			<tr><th class="bgcolor textTh1"><h4>건의자</h4></th>
				<td colspan="2" class="lpad">${member.m_name }</td></tr>
			<tr><th></th>
				<td class="bgcolor textTh1">수정 전</td>
				<td class="bgcolor textTh1">수정 후</td></tr>
			<tr><th class="bgcolor textTh1"><h4>장소 이름</h4></th>
				<td class="lpad rblack">${place.place_name }</td>
				<td class="lpad">${tp.temp_name }</td></tr>
			<tr><th class="bgcolor textTh1"><h4>카테고리</h4></th>
				<td class="lpad rblack">${place.place_cate }</td>
				<td class="lpad">${tp.temp_cate }</td></tr>
			<tr><th class="bgcolor textTh1"><h4>장소 태그</h4></th>
				<td class="lpad rblack">${place.place_tag }</td>
				<td class="lpad">${tp.temp_tag }</td></tr>
			<tr><th class="bgcolor textTh1"><h4>지번 주소</h4></th>
				<td class="lpad rblack">${place.place_addr }</td>
				<td class="lpad">${tp.temp_addr }</td></tr>
			<tr><th class="bgcolor textTh1"><h4>도로명 주소</h4></th>
				<td class="lpad rblack">${place.place_addrd }</td>
				<td class="lpad">${tp.temp_addrd }</td></tr>			
			<tr><th class="bgcolor textTh1"><h4>장소 내용</h4></th>
				<td class="lpad rblack">${place.place_content }</td>
				<td class="lpad">${tp.temp_content }</td></tr>
			<tr><th class="bgcolor textTh1"><h4>건의 이유</h4></th>
				<td colspan="2" class="lpad">${tp.temp_explanation }</td></tr>
					
		</table>
	</div>
	<div align="center">
		<c:if test="${empty admin }">
			<button class="btn bgcolor" style="margin-top: 10px;" onclick="location.href='${path}/member/createPlaceList.do?m_num=${m_num }'">목록</button>
		</c:if>	
		<c:if test="${not empty admin && tp.del == 'n'}">
			<button class="btn btn-primary" style="margin-top: 10px;" onclick="updateTemp()">건의 완료</button>
			<button class="btn btn-danger" style="margin-top: 10px;" onclick="del()">건의 취소</button>
		</c:if>
	</div>
</c:if>
<c:if test="${not empty place && tp.del != 'n'}">
<div style="width: 100%;">
	<div class="container" align="center" style="width: 85%;">
	<div style="display: flex; justify-content: center;">
		<div align="center" class="top"><img alt="" src="${tp.temp_photo }" style="width: 450px; height: 400px;"></div>
		<div id="map" class="top" style="width:450px; height: 400px;"></div>
	</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(${tp.lat}, ${tp.lng}),
				level: 3
			};	
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${tp.lat}, ${tp.lng}); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			map.setZoomable(false); 
			map.setDraggable(false); 
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
	</div>
</div>
	<div class="container" align="center"  style=" width: 85%; margin-top: 20px;">
		<h2 class="text-primary" style="color: green;" align="center"><b>장소명 :</b><span style="color: black;"> ${tp.temp_name }</span></h2>
		<h3 class="text-primary" style="color: green;" align="center"><b>건의자 :</b><span style="color: black;"> ${member.m_name }</span></h3>
		<br>
		<table style="width: 65%;">
			<tr><td class="bgcolor textTh"><h4>요청사항</h4>
				</td><td class="lpad">${tp.temp_crud }
					<c:if test="${tp.del == 'y' }">
						<b style="color: red"> (처리 완료)</b>
					</c:if>
					<c:if test="${tp.del == 'c' }">
						<b style="color: red"> (본인 취소)</b>
					</c:if>
					<c:if test="${tp.del == 'd' }">
						<b style="color: red"> (건의가 거졀되었습니다)</b>
					</c:if>	</td></tr>
			<tr><td class="bgcolor textTh"><h4>지역</h4></td><td class="lpad">${tp.temp_area }</td></tr>
			<tr><td class="bgcolor textTh"><h4>상세지역 </h4></td><td class="lpad">${tp.temp_areadetail }</td></tr>
			<tr><td class="bgcolor textTh"><h4>카테고리</h4></td><td class="lpad">${tp.temp_cate }</td></tr>
			<tr><td class="bgcolor textTh"><h4>지번 주소</h4></td><td class="lpad">${tp.temp_addr }</td></tr>
			<tr><td class="bgcolor textTh"><h4>도로명 주소</h4></td><td class="lpad">${tp.temp_addrd }</td></tr>
			<tr><td class="bgcolor textTh"><h4>태그</h4></td><td class="lpad">${tp.temp_tag }</td></tr>
			<tr><td class="bgcolor textTh"><h4>내용</h4></td><td class="lpad">${tp.temp_content }</td></tr>
			<tr><td class="bgcolor textTh"><h4>건의 이유</h4></td><td class="lpad">${tp.temp_explanation }</td></tr>
		</table>
		<div align="center">	
			<c:if test="${empty admin }">
				<button class="btn bgcolor" style="margin-top: 10px;" onclick="location.href='${path}/member/createPlaceList.do?m_num=${m_num }'">목록</button>
			</c:if>
		</div>	
	</div>
</c:if>
</body>
</html>