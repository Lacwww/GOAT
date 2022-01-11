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
	
	/* DAY 선택시 실행하는 함수 */
	function day_select(num) {
		var day = $("select[name=day] option:selected").text();
		if($('#day').value!=0) {
			var name = $('#p_name'+num).text();
			var addrs = $('#p_addr'+num).text();
			$('#pList'+num).hide();
			$('#d'+day+'>tbody').append("<tr id='tr"+num+"'><td><c:set var='i' value='1'/>${i}<c:set var='i' value='i+1'/></td><td>"+name+"</td><td>"
					+addrs+"</td><td><select name='day' onchange='day_select(num,day)'><option value='0' selected='selected'>방문할 일자를 선택하세요</option>"+
					+"<c:forEach var='"+day+"' begin='1' end='${days }'><option value='"+day+"'>${day }</option></c:forEach>");
			
		}
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
<style type="text/css">
	div #p_list {overflow : auto; float: right; width: 30%; height: 100%; top: 20px;}
	.p_image { width: 100%; height: 100%;}
	#pimage { width: 160px; height: 140px; float: left; position: relative;}
	#plist { margin: 10px;} 
	#p_image{ width: 150px; height: 150px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="makeSchedule.do" method="post" name="frm">
	<div id="wrapper">
			<div>
				<input type="text" name="sch_name" placeholder="나만의 스케줄 이름을 입력해주세요"><p>
				${s_date } ~ ${e_date }
			</div>
			<!-- 지도 -->
			<div id="map" style="width: 65%; height: 60%; float: left;"></div>
			<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 10
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
			<div class="list" style="width: 35%; height: 60%; overflow : auto; padding-left: 20px;">
				<c:forEach var="p" items="${places }">
					<div id="pList${p.place_num }" style="padding-bottom: 10px;">
						<div id="pimage">
							<img alt="" src="${p.place_photo }" class="p_image"
								id="p_image${p.place_num }">
						</div>
						<div id="pdesc" style="height: 140px;">
							<div style="width: 100%;">
								<span style="font-weight: bold;" id="p_name${p.place_num }">${p.place_name }</span>
								<img alt="자세히 보기" src="${path }/resources/images/info.png"
									width="20px;" height="20px;" onclick="modal(${p.place_num})">
							</div>
							<br> <span>주소</span><br> <span class="p_addr"
								id="p_addr${p.place_num }">${p.place_addr }</span><br> <span>선택 일자</span>
							<select name="day" id="day" onchange="day_select(${p.place_num })">
								<option value="0" selected="selected">방문할 일자를 선택하세요</option>
								<c:forEach var="day" begin="1" end="${days }">
									<option value="${day }">${day }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:forEach>
			</div>
			<div>
				<c:forEach var="d" begin="1" end="${days }">
					<div id="day${d }">
						<table class="table table-striped" id="d${d }"><caption>DAY ${d }</caption>
							<tr><th>여행 순서</th><th>장소명</th><th>주소</th><th>방문일자</th></tr>
						</table>
					</div>
				</c:forEach>
			</div>
	</div>
	</form>
</body>
</html>