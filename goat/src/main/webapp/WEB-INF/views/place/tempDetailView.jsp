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
<div align="center"><h2>등록 건의 상세보기</h2></div>
<c:if test="${empty place }">
	<div class="container">
		<div align="center" class="top"><img alt="" src="${tp.temp_photo }" style="width: 450px; height: 400px;"></div>
		<div id="map" class="top" style="width:450px; height: 400px;"></div>
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
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
	</div>
	<div class="container">
		<h2 class="text-primary">${tp.temp_name }</h2>
		<br>
		<h4>요청사항 : ${tp.temp_crud }
		<c:if test="${tp.del != 'n' }">
			<b style="color: red"> (처리완료)</b>
		</c:if>	
		</h4>
		<h4>지역 : ${tp.temp_area }</h4>
		<h4>상세지역 : ${tp.temp_areadetail }</h4>
		<h4>카테고리 : ${tp.temp_cate }</h4>
		<h4>주소(지번) : ${tp.temp_addr }</h4>
		<h4>주소(도로명) : ${tp.temp_addrd }</h4>
		<h4>태그 : ${tp.temp_tag }</h4>
		<h4>내용 : ${tp.temp_content }</h4>	
		<h4>건의 이유 : ${tp.temp_explanation }</h4>
		<button onclick="location.href='${path}/member/createPlaceList.do?m_num=${m_num }'">목록</button>	
		<c:if test="${not empty admin && tp.del == 'n'}">
			<button onclick="insertTemp()">건의 완료</button>
			<button onclick="del()">건의 취소</button>
		</c:if>
	</div>
</c:if>
<c:if test="${not empty place && tp.del == 'n'}">
	<table>
		<tr><th></th><th align="center">수정전</th><th align="center">수정후</th></tr>
		<tr><th>사진</th><th><img alt="" src="${place.place_photo }" style="width: 350px; height: 300px;"></th>
						<th><img alt="" src="${tp.temp_photo }" style="width: 350px; height: 300px;"></th></tr>
		<tr><th>위치</th><th>
				<div id="map" class="top" style="width:350px; height: 300px;"></div>
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
						
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
					</script></th>
				<th>
					<div id="map1" class="top" style="width:350px; height: 300px;"></div>
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
							
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
						</script></th>
			</tr>
			<tr><th>요청사항</th><td colspan="2">${tp.temp_crud }</td></tr>
			<tr><th>장소 이름</th><td>${place.place_name }</td><td>${tp.temp_name }</td></tr>
			<tr><th>카테고리</th><td>${place.place_cate }</td><td>${tp.temp_cate }</td></tr>
			<tr><th>장소 태그</th><td>${place.place_tag }</td><td>${tp.temp_tag }</td></tr>
			<tr><th>지번 주소</th><td>${place.place_addr }</td><td>${tp.temp_addr }</td></tr>
			<tr><th>도로명 주소</th><td>${place.place_addrd }</td><td>${tp.temp_addrd }</td></tr>			
			<tr><th>장소 내용</th><td>${place.place_content }</td><td>${tp.temp_content }</td></tr>
			<tr><th>건의 이유</th><td colspan="2">${tp.temp_explanation }</td></tr>
					
	</table>

		<button onclick="location.href='${path}/member/createPlaceList.do?m_num=${m_num }'">목록</button>	
		<c:if test="${not empty admin && tp.del == 'n'}">
			<button onclick="updateTemp()">건의 완료</button>
			<button onclick="del()">건의 취소</button>
		</c:if>
</c:if>
<c:if test="${not empty place && tp.del != 'n'}">
	<div class="container">
		<div align="center" class="top"><img alt="" src="${tp.temp_photo }" style="width: 450px; height: 400px;"></div>
		<div id="map" class="top" style="width:450px; height: 400px;"></div>
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
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
	</div>
	<div class="container">
		<h2 class="text-primary">${tp.temp_name }</h2>
		<br>
		<h4>요청사항 : ${tp.temp_crud }<b style="color: red"> (처리완료)</b></h4>
		<h4>지역 : ${tp.temp_area }</h4>
		<h4>상세지역 : ${tp.temp_areadetail }</h4>
		<h4>카테고리 : ${tp.temp_cate }</h4>
		<h4>주소(지번) : ${tp.temp_addr }</h4>
		<h4>주소(도로명) : ${tp.temp_addrd }</h4>
		<h4>태그 : ${tp.temp_tag }</h4>
		<h4>내용 : ${tp.temp_content }</h4>	
		<button onclick="location.href='${path}/member/createPlaceList.do?m_num=${m_num }'">목록</button>	
	</div>
</c:if>
</body>
</html>