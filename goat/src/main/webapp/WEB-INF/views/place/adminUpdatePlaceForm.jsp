<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="../tool.jsp"%>
<%@	include file="../tool3.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#imgpreview { float: left; }
	.bgcolor{	
		background-color: rgb(64,123,37);
		color: white; 
		border-radius: 5px;
	}	
	.btn1 {
	background-color: rgb(64,123,37);
	color: white;
	}
	.btn1:hover {
		background-color: rgb(114,201,75);
	}			
	td { border-bottom: 1px solid white; height: 40px;}
</style>
<script>
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<script type="text/javascript">
	//이미지 미리보기
	$(function() {
	    $("#temp_photo").on('change', function(){
	        readURL(this);
	    });
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	       var reader = new FileReader();
	       reader.onload = function (e) {
	          $('#imgpreview').attr('src', e.target.result);
	       }
	       reader.readAsDataURL(input.files[0]);
	    }
	}
	function Chk() {
		
		if(${empty admin}){
			alert("관리자만 이용가능합니다.");
			return false;
		}else if(frm.lat.value == ''){
			alert("지도에서 장소를 선택하세요");
			return false;
		}else if(frm.lng.value == ''){
			alert("지도에서 장소를 선택하세요");
			return false;
		}else{
			var con = confirm("수정하시겠습니까?");
			if(con){
				
			}else{
				return false;
			}
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
<div align="center"><h2 class="text-primary" style="color: green; margin-top: 10%;"><b>장소 수정 건의</b></h2></div>
<br>
<div align="center" class="container" style="width: 85%;">
	<div style="display: flex; justify-content: center;">
		<div><img id="imgpreview" style="width:450px; height: 400px;" src="${place.place_photo }"> </div>
		<div id="map" style="width:450px; height: 400px;"></div>
	</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9&libraries=services"></script>
		<script>
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(${place.lat}, ${place.lng}), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var markerPosition  = new kakao.maps.LatLng(${place.lat}, ${place.lng});
		    
			var marker = new kakao.maps.Marker({ // 클릭한 위치를 표시할 마커입니다
			    position: markerPosition
			});
			
			marker.setMap(map);
			
			function PS() {
				var place = frm.mapSearch.value;
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
			
				// 키워드로 장소를 검색합니다
				ps.keywordSearch(place, placesSearchCB);
			
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
			
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
			
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
			
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {}	
			}
			//주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
			  
				
			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			
			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			            
			            var content = '<div class="bAddr">' +detailAddr +  '</div>';
			            
			            // 마커를 클릭한 위치에 표시합니다 
			            marker.setPosition(mouseEvent.latLng);
			            marker.setMap(map);
			            
			            // 인포윈도우에 클릭한 위치에 대한 상세 주소정보를 표시합니다
// 			            infowindow.setContent(content);
// 			            infowindow.open(map, marker);
			            
			
			            frm.lat.value ='';
			            frm.lng.value ='';
			            frm.place_addr.value ='';
			            frm.place_addrd.value ='';
			
			            frm.place_addr.value = result[0].address.address_name;
			            if(result[0].road_address){
			            	frm.place_addrd.value = result[0].road_address.address_name;	
			            }else{
			            	frm.place_addrd.value = '정보없음';
			            }
			            frm.lat.value = mouseEvent.latLng.getLat();
			            frm.lng.value = mouseEvent.latLng.getLng();
			            
			        }   
			    });
			});
			
			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});
			
			function searchAddrFromCoords(coords, callback) {
			    // 좌표로 주소 정보를 요청합니다
			    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
			}
			
			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 상세 주소 정보를 요청합니다
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
			
			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
			  
			}
			</script>
		<form action="adminUpdatePlace.do" name="frm" onsubmit="return Chk()" method="post" enctype="multipart/form-data">			
			<input type="hidden" name="place_num" value="${place.place_num }">
			<input type="hidden" name="lat" value="${place.lat }">
			<input type="hidden" name="lng" value="${place.lng }">
			<div align="center" style="width: 77%; margin-left: 8%;">
			<table style="width: 90%; margin-top: 10px;">
				<tr><td style="width: 25%; margin-right: 3%;">
					<input type="file" name="file" class="form-control" id="temp_photo"></td>
					<td class="bgcolor" align="center" style="width: 10%;">장소 검색</td>
					<td style="width: 34%;">
					<input type="text" class="form-control" style="width: 60%; display: inline;margin-left:5px; margin-right: 5px;" name="mapSearch">
					<input type="button" class="btn btn1" style="width: 16%; height: 40px;" onclick="PS()" value="검색"></td></tr>
			</table>
			<br>
			<table style="width: 75%;">
				<tr><td class="bgcolor" align="center" style="width: 18%;">장소 이름  </td>
					<td style="width: 53%;">
						<input type="text" class="form-control" style="width: 50%; margin-left: 10px;" name="place_name" autofocus="autofocus" required="required"
											value="${place.place_name }"></td></tr>
				<tr><td class="bgcolor" align="center">카테고리 </td><td>
						<select name="place_cate"  class="form-control" style="text-align:center; width: 18%; margin-left: 10px;">
							<c:if test="${place.place_cate == '관광지' }">
								<option value="관광지" selected="selected">관광지</option>
								<option value="숙소">숙소</option>
								<option value="음식점">음식점</option>
							</c:if>
							<c:if test="${place.place_cate == '숙소' }">
								<option value="관광지">관광지</option>
								<option value="숙소" selected="selected">숙소</option>
								<option value="음식점">음식점</option>
							</c:if>
							<c:if test="${place.place_cate == '음식점' }">
								<option value="관광지">관광지</option>
								<option value="숙소">숙소</option>
								<option value="음식점" selected="selected">음식점</option>
							</c:if>
						</select></td>
				</tr>
				<tr><td class="bgcolor" align="center">태그</td>
					<td><input type="text" name="place_tag" class="form-control" style="width: 70%; margin-left: 10px;" size="40" required="required" value="${place.place_tag }"></td></tr>
				<tr><td class="bgcolor" align="center">지번 주소</td>
					<td><input type="text" name="place_addr" class="form-control" style="width: 70%; margin-left: 10px;" size="40" required="required" value="${place.place_addr }"></td></tr>
				<tr><td class="bgcolor" align="center">도로명 주소</td>
					<td><input type="text" name="place_addrd" class="form-control" style="width: 70%; margin-left: 10px;"  size="40" value="${place.place_addrd }"></td></tr>
				<tr><td class="bgcolor" align="center">장소 설명</td>
				<td><textarea rows="5" cols="50" style="margin-left: 10px;" class="form-control" name="place_content" required="required">${place.place_content }</textarea></td></tr>
				<tr><td colspan="3" align="center">
					<input type="submit" style="margin-top: 5px;" class="btn btn1" value="수정">
					<input type="button" style="margin-top: 5px;" class="btn btn-danger" onclick="history.back()" value="취소">
				</td></tr>
			</table>
			</div>
			
		</form>
	</div>
</body>
</html>