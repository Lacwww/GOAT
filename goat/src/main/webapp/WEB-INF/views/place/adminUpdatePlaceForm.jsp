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
	.bgcolor{	
		background-color: rgb(64,123,37);
		color: white; 
		border-radius: 5px;
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
<div align="center"><h2 class="text-primary" style="color: green;"><b>장소 수정 건의</b></h2></div>
<br>
<div class="container" style="margin-left: 9%; width: 85%;">
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
			<div align="center">
			<table style="width: 93%;">
				<tr><td style="width: 38%;">
					<input type="file" name="file" class="form-control" id="temp_photo"></td>
					<td class="bgcolor" align="center" style="width: 10%;">장소 검색</td>
					<td style="width: 34%;">
					<input type="text" class="form-control" style="width: 80%; display: inline;margin-left:5px; margin-right: 5px;" name="mapSearch">
					<input type="button" class="btn btn-primary" style="width: 16%; height: 40px;" onclick="PS()" value="검색"></td></tr>
			</table>
			<br>
			<table style="width: 75%;">
				<tr><td class="bgcolor" align="center" style="width: 18%;">장소 이름  </td>
					<td style="width: 53%;">
						<input type="text" class="form-control" style="width: 50%; margin-left: 10px;" name="place_name" autofocus="autofocus" required="required"
											value="${place.place_name }"></td></tr>
				<tr><td class="bgcolor" align="center">카테고리 </td><td>
						<select name="place_cate"  class="form-control" style="width: 18%; margin-left: 10px;">
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
					<input type="submit" class="btn btn-primary" value="수정">
					<input type="button" class="btn btn-warning" onclick="history.back()" value="취소">
				</td></tr>
			</table>
			</div>
			
		</form>
	</div>
</body>
</html>