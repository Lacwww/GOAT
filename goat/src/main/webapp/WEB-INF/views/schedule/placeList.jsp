<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수
	var markers = [];
	var id = [];
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	/* 플레이스 선택 시  */
	function pick(num) {
		/* 선택 목록에 테이블 추가하기 */
		id.push(num);
		frm.id.value=id;
		var src = $('#p_image'+num).attr("src");
		var name = $('#p_name'+num).text();
		var addr = $('#p_addr'+num).text();
		var tag = $('#p_tag'+num).text();
		$('#Ppick>tbody').append("<tr id='tr"+num+"'><td><span onclick='del("+num+")' class='glyphicon glyphicon-remove'></span>"+
			"<img alt='' src='"+src+"' id='p_image' style='align : center;'></td><td>"
				+name+"</td><td>"+addr+"</td><td>"+tag+"</td></tr>");
		$('#pList'+num).hide();
		
		/* 지도에 표시 & 이동 */
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
			setMarkers(null);    
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		     // 마커를 생성하고 지도위에 표시하는 함수입니다
		            // 마커를 생성합니다
		            var marker = new kakao.maps.Marker({
		                position: coords
		            });
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
		            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		            map.panTo(coords);
		    } 
		});    
		/* input type hidden 추가하기 */
		$('#id').val(id);
	}
 	function del(num) {
 		var msg = confirm("플레이스를 삭제하시겠습니까?");
 		if(msg) {
			setMarkers(null); 
			$('#tr'+num).remove();
			$('#pList'+num).show();
			arr.splice(num,1);
 		}
	}
 	/* 플레이스 상세정보 */
	function modal(place) {
		$('#MoaModal .modal-content').load("prevDetailView.do?place_num=" + place);
		$('#MoaModal').modal();
	}
</script>
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
<input type="hidden" name="place_area" value="${place.place_area }">
<div class="p_container" id="p_list" style="margin-top: 20px;">
	<c:if test="${empty plist }">
		<div id="pList">
			플레이스 데이터를 준비중입니다.
		</div>
	</c:if>
	<c:if test="${not empty plist }">
		<c:forEach var="p" items="${plist }">
			 <div id="pList${p.place_num }">
			 	<div id="pimage">
			 		<img alt="" src="${p.place_photo }" class="p_image" id="p_image${p.place_num }">
			 	</div>
			 	<div id="pdesc" style="height: 140px;">
			 	 	<div style="width: 100%;"><span style="font-weight: bold;" id="p_name${p.place_num }">${p.place_name }</span>
			 	 		<span class="glyphicon glyphicon-plus" id="icon" onclick="pick(${p.place_num})"></span>
			 	 		<img alt="자세히 보기" src="${path }/resources/images/info.png" width="20px;" height="20px;"
			 	 			onclick="modal(${p.place_num})"></div><br>
			 	 	<span>주소</span><br><span class="p_addr" id="p_addr${p.place_num }">${p.place_addr }</span><br>
			 	 	<span>테마</span><br><span class="p_tag" id="p_tag${p.place_num }">${p.place_tag }</span>
			 	 </div>
			 </div>
		</c:forEach>
	</c:if>
	<!-- 플레이스 모달 -->
	<div class="modal fade" id="MoaModal" tabindex="-1" role="dialog"
		aria-labelledby="historyModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content"></div>
		</div>
	</div>
</div>
</body>
</html>