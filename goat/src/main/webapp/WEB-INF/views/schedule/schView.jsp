<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#div1 { display: flex; align-items: center;}
	 {border: 2px;}
	#day_box {background: gray; border: 2px;}
	.lst { display: none;}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0&libraries=services"></script>
<script type="text/javascript">
	var positions = [];
	var markers = [];
	var linePath = [];
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 3, // 선의 두께 입니다
	    strokeColor: '#2ECCFA', // 선의 색깔입니다
	    strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	window.onload = function () {
		$('.place:last-child').find('.rout').remove();
	}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
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
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	        console.dir(markers[i]);
	    }            
		markers = [];
	}
	function make_marker(day) {
		positions = [];
		linePath = [];
		
		setMarkers(null);
		polyline.setMap(null);
		
		var count_place = $('#schedule_day'+day).children().length;
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		for(var i=1; i<=count_place; i++) {
			var place_name = $('#schedule_day'+day).children('.place').eq(i-1).find('span').html();
			var lat = $("input[name=plat"+day+"]").eq(i-1).val();
			var lng = $("input[name=plng"+day+"]").eq(i-1).val();
 			var p = {
			        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+place_name+'</div>', 
			        latlng: new kakao.maps.LatLng(lat, lng)
					};   
 			positions.push(p);
 			var latlng = new kakao.maps.LatLng(lat, lng);
 			linePath.push(latlng);
		}
		
		 for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			   var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });
			    markers.push(marker);
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });		

		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow)); 
		}
		
		// 지도에 표시할 선을 생성합니다
		polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 3, // 선의 두께 입니다
		    strokeColor: '#FF0000', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		// 지도에 선을 표시합니다 
		polyline.setMap(map); 
	}
	function rout(day,d) {
		var count_place = $('#schedule_day'+day).children().length;
		var place_name1 = $('#schedule_day'+day).children('.place').eq(d-1).find('span').html();
		var lat1 = $("input[name=plat"+day+"]").eq(d-1).val();
		var lng1 = $("input[name=plng"+day+"]").eq(d-1).val();
		
		var place_name2 = $('#schedule_day'+day).children('.place').eq(d).find('span').html();
		var lat2 = $("input[name=plat"+day+"]").eq(d).val();
		var lng2 = $("input[name=plng"+day+"]").eq(d).val();
		
		window.open("https://map.kakao.com/link/from/"+place_name1+","+lat1+","+lng1+"/to/"+place_name2+","+lat2+","+lng2);
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div id="sch1">
		${sch.sch_name }<p>
		<img alt="calendar" src="${path }/resources/images/calendar.png"
					 style="width: 60px; height: 70px; padding-bottom : 5px;">${sch.s_date } ~ ${sch.e_date }
	</div>
	<div id="sch2" class="row" align="center">
		<div class="col-md-9" id="map" style="height: 80%;">
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
				</script>
		</div>
		<div class="col-md-3" id="day_box" style="height: 80%;">
         <c:forEach var="day" begin="1" end="${days }">
         	<c:set var="d" value="1"/>
            <div class="row" id="div1">
               <div class="col-md-5 day" style="height: 100%;">
                  <div>
	                  <span>Day${day }</span><p>
	                  <input type="button" id="prev${day }" value="직선경로 보기" onclick="make_marker(${day})">
                  </div>
               </div>
               <div class="col-md-7 cont" id="schedule_day${day }" style="background: white; height: 100%">
                  <c:forEach var="scd" items="${list }">
                     <c:if test="${scd.day==day }">
	                    <div class="place">
                              <span>${scd.place_name }</span>
                              <input type="hidden" name="plat${scd.day}" id="${d }" value="${scd.lat }">
                              <input type="hidden" name="plng${scd.day}" id="${d }" value="${scd.lng }"><br>
                              <input type="button" class="rout" value="상세경로" onclick="rout(${day },${d})">
                              <c:set var="d" value="${d+1 }"/>
                     	</div>
                     </c:if>
                  </c:forEach>
               </div>
            </div>
         </c:forEach>
         </div>
   </div>
   <div id="btns">
   		<input type="button" value="목록" onclick="history.back();">
   		<input type="button" value="수정" onclick="location.href='updateSchForm.do?sch_num=${sch_num}'">
   </div>
</div>
</body>
</html>