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
	.bookmark {float: right; margin-right: 20%;}
</style>
</head>
<body>
	<div class="container">
		<div align="center" class="top"><img alt="" src="${place.place_photo }" style="width: 450px; height: 400px;"></div>
		<div id="map" class="top" style="width:450px; height: 400px;"></div>
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
		</script>
	</div>
	<div class="container">
		<div class="bookmark"><img alt="" src="${path }/resources/bookMarkImg/따봉.png"> </div>
		<h2 class="text-primary">${place.place_name }</h2>
		<br>
		<h3>평점 : ${avgScore }</h3>
		<h4>지역 : ${place.place_area }</h4>
		<h4>카테고리 : ${place.place_cate }</h4>
		<h4>주소(지번) : ${place.place_addr }</h4>
		<h4>주소(도로명) : ${place.place_addrd }</h4>
		<h4>태그 : ${place.place_tag }</h4>
		<h4>내용 : ${place.place_content }</h4>	
	</div>
</body>
</html>