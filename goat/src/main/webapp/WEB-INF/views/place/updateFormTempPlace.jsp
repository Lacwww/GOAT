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
		
		if(${empty id}){
			alert("로그인 후 이용하세요");
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
<div class="container">
		<div><img id="imgpreview" style="width:450px; height: 400px;" src="${place.place_photo }"> </div>
		<div id="map" style="width:450px; height: 400px;"></div>
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
			            
			            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			            infowindow.setContent(content);
			            infowindow.open(map, marker);
			            
			
			            frm.lat.value ='';
			            frm.lng.value ='';
			            frm.temp_addr.value ='';
			            frm.temp_addrd.value ='';
			
			            frm.temp_addr.value = result[0].address.address_name;
			            if(result[0].road_address){
			            	frm.temp_addrd.value = result[0].road_address.address_name;	
			            }else{
			            	frm.temp_addrd.value = '정보없음';
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
			    // 좌표로 행정동 주소 정보를 요청합니다
			    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
			}
			
			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 법정동 상세 주소 정보를 요청합니다
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
			
			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
			  
			}
			</script>
		<form action="updateTempPlace.do" name="frm" onsubmit="return Chk()" method="post" enctype="multipart/form-data">			
			<input type="hidden" name="place_num" value="${place.place_num }">
			<input type="hidden" name="lat" value="${place.lat }">
			<input type="hidden" name="lng" value="${place.lng }">
			<div>
			<table>
				<tr><th><input type="file" name="file" id="temp_photo"></th>
					<th>장소 검색 : <input type="text" name="mapSearch"><input type="button" onclick="PS()" value="검색"></th></tr>
				<tr><th>장소 이름  </th><th><input type="text" name="temp_name" autofocus="autofocus" required="required"
											value="${place.place_name }"></th></tr>
				<tr><th>카테고리 </th><th>
						<select name="temp_cate">
							<c:if test="${place.place_cate == '관광지' }">
								<option value="관광지" selected="selected">관광지</option>
							</c:if>
							<c:if test="${place.place_cate != '관광지' }">
								<option value="관광지">관광지</option>
							</c:if>
						</select></th>
				</tr>
				<tr><th>태그</th><th><input type="text" name="temp_tag" size="40" required="required" value="${place.place_tag }"></th></tr>
				<tr><th>지번 주소</th><th><input type="text" name="temp_addr" size="40" required="required" value="${place.place_addr }"></th></tr>
				<tr><th>도로명 주소</th><th><input type="text" name="temp_addrd" size="40" value="${place.place_addrd }"></th></tr>
				<tr><th>장소 설명</th>
				<th><textarea rows="5" cols="50" name="temp_content" required="required">${place.place_content }</textarea></th></tr>
				<tr><th>건의 이유</th>
				<th><textarea rows="5" cols="50" name="temp_explanation" required="required"></textarea></th></tr>
				<tr><th colspan="3" align="center">
					<input type="submit" value="수정신청">
					<input type="button" onclick="history.back()" value="취소">
				</th></tr>
			</table>
			</div>
			
		</form>
	</div>
</body>
</html>