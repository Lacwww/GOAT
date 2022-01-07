<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#imgpreview { float: left; }
</style>
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
</script>
</head>
<body>
<div class="container">
		<div><img id="imgpreview" style="width:450px; height: 400px;" src=""> </div>
		<div id="map" style="width:450px; height: 400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.372712, 126.52712),
				level: 9
			};	
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(33.372712, 126.52712); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
		<form action="">
			<div>
				<input type="file" name="temp_photo" id="temp_photo">
			</div>
			
			<div>
			<table>
				<tr><th>장소 이름  </th><td><input type="text" name="temp_name" autofocus="autofocus"></td></tr>
				<tr><th>카테고리 </th><td>
						<select name="temp_cate">
							<option value="관광지">관광지</option>
						</select></td>
				</tr>
				<tr><th>지역</th><td></td></tr>
				<tr><th>상세지역</th><td></td></tr>
				<tr><th>지번 주소</th><td></td></tr>
				<tr><th>도로명 주소</th><td></td></tr>
				<tr><th>장소 설명</th><td></td></tr>
			</table>
			</div>
			
		</form>
	</div>
</body>
</html>