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
<div align="center" class="text-primary" style="color: green;"><h2><b>등록 건의 상세보기</b></h2></div>
<br>
<c:if test="${empty place }">
	<div class="container" style="margin-left: 9%; width: 85%;">
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
			
			map.setZoomable(false); 
			map.setDraggable(false); 
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
	</div>
	<div class="container" style="margin-left: 9%; width: 85%;">
		<h2 class="text-primary" style="color: green;" align="center"><b>장소명 :</b><span style="color: black;"> ${tp.temp_name }</span></h2>
		<h3 class="text-primary" style="color: green;" align="center"><b>건의자 :</b><span style="color: black;"> ${member.m_name }</span></h3>
		<br>
		<table style="margin-left: 5%; width: 90%">
			<tr><td class="bgcolor textTh"><h4>요청사항</h4>
				</td><td class="lpad">${tp.temp_crud }
					<c:if test="${tp.del != 'n' }">
						<b style="color: red"> (처리완료)</b>
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
</c:if>
<c:if test="${not empty place && tp.del == 'n'}">
	<div align="center">
	<table style=" width: 74%">
		<tr><th></th><th align="center" class="bgcolor textTh" style="border-right: 1px solid white;"><h4>수정전</h4></th>
					<th align="center" class="bgcolor textTh"><h4>수정후</h4></th></tr>
		<tr><th class="bgcolor textTh1"><h4>사진</h4></th>
			<th><img alt="" src="${place.place_photo }" style="width: 350px; height: 300px;"></th>
			<th><img alt="" src="${tp.temp_photo }" style="width: 350px; height: 300px;"></th></tr>
		<tr><th class="bgcolor textTh1"><h4>위치</h4></th><th>
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
						
						map.setZoomable(false); 
						map.setDraggable(false); 
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
	<div class="container" style="margin-left: 9%; width: 85%;">
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
			
			map.setZoomable(false); 
			map.setDraggable(false); 
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>
	</div>
	<div class="container"  style="margin-left: 9%; width: 85%;">
		<h2 class="text-primary" style="color: green;" align="center"><b>장소명 :</b><span style="color: black;"> ${tp.temp_name }</span></h2>
		<h3 class="text-primary" style="color: green;" align="center"><b>건의자 :</b><span style="color: black;"> ${member.m_name }</span></h3>
		<br>
		<table style="margin-left: 5%; width: 90%">
			<tr><td class="bgcolor textTh"><h4>요청사항</h4>
				</td><td class="lpad">${tp.temp_crud }
					<c:if test="${tp.del != 'n' }">
						<b style="color: red"> (처리완료)</b>
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