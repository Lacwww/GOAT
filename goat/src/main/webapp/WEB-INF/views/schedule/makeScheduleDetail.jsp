<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" 
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0&libraries=services"></script>
<script type="text/javascript">
	var positions = [];
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
</script>
<c:forEach var="i" items="${places }">
	<script type="text/javascript">
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var p = {
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">${i.place_name}</div>', 
		        latlng: new kakao.maps.LatLng(${i.lat}, ${i.lng})
			};
		positions.push(p);
	</script>
</c:forEach>
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
					});
					for (var i = 0; i < positions.length; i ++) {
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng // 마커의 위치
						    });
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: positions[i].content // 인포윈도우에 표시할 내용
					    });		

					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}
				</script>
				<div id="schedule">
					<c:set var="d" value="1"/>
					<c:forEach var="place" items="${places }">
						<div>
							<h3>DAY ${d }</h3><c:set var="d" value="${d+1 }"/>
						</div>
					</c:forEach>
				</div>
	</form>
</div>
</body>
</html>