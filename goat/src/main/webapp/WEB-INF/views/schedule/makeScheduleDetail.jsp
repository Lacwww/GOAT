<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	var lat = ${place}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<form action="makeSchedule.do" method="post" name="frm">
	<div>
		<input type="text" name="sch_name" placeholder="나만의 스케줄 이름을 입력해주세요">
		${s_date } ~ ${e_date }
	</div>
		<!-- 지도 -->
		<div id="map" style="width:100%;height:60%;"></div>
		<script type="text/javascript" 
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0&libraries=services"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 9
			};
			var map = new kakao.maps.Map(container, options);
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${place_area}', function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
		   	 if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    }
		</script>
		<c:forEach var="place" items="places">
			<script>
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(${place.lat}, ${place.lng}); 
			            // 마커가 지도 위에 표시되도록 설정합니다
			            marker.setMap(map);
			            // 생성된 마커를 배열에 추가합니다
			            markers.push(marker);
			         	
			            // 인포윈도우로 장소에 대한 설명을 표시합니다
			            var infowindow = new kakao.maps.InfoWindow({
			                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
			            });
			        	 // 마커에 마우스오버 이벤트를 등록합니다
			            kakao.maps.event.addListener(marker, 'mouseover', function() {
			              // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			                infowindow.open(map, marker);
			            });
		
			            // 마커에 마우스아웃 이벤트를 등록합니다
			            kakao.maps.event.addListener(marker, 'mouseout', function() {
			                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			                infowindow.close();
			            });
			</script>
		</c:forEach>
	</form>
</div>
</body>
</html>