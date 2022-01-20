<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div #p_list {
	overflow: auto;
	float: right;
	width: 30%;
	height: 100%;
	top: 20px;
}

.p_image {
	width: 100%;
	height: 100%;
}

#pimage {
	width: 160px;
	height: 140px;
	float: left;
	position: relative;
}

#plist {
	margin: 10px;
}

#p_image {
	width: 150px;
	height: 150px;
}

.dragRow {
	background: gray;
}
td #lat, td #lng {
	display:none;
}
</style>
<script type="text/javascript"
	src="${path }/resources/bootstrap/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${path }/resources/bootstrap/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0&libraries=services"></script>
<script type="text/javascript"> 
	var positions = [];
	var result_day = [];
	var linePath = [];
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 3, // 선의 두께 입니다
	    strokeColor: '#2ECCFA', // 선의 색깔입니다
	    strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
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
	// 일정별 선택한 플레이스들을 보여주는 함수입니다
	function disp(selected_day) {
		if(selected_day!=0) {
			$('.selected_list > div').hide();
			$('#day'+selected_day).show();
		}else {
			$('.selected_list > div').show();
		}
	}
	
	// DAY 선택시 실행하는 함수
	function day_select(num,d) {
			var day = $("select[name="+d+"]").val();
			var name = $('#p_name'+num).text();
			var addrs = $('#p_addr'+num).text();
			var lat = $('#p_lat'+num).val();
			var lng = $('#p_lng'+num).val();
			if(day == 0) return false;
			$('#pList'+num).hide();
			$('#table-'+day).append("<tr id='d"+num+"' class='tr'><td><input type='hidden' name=\"day_value"+day+"\" value=\""+num+"\" id=\""+num+"\"></td><td>"+name+"</td><td>"
					+addrs+"</td><td><select name='change_"+d+"' id='change_"+d+"' onchange=\"day_change("+num+",'"+d+"')\"><option value='0'>방문 일자</option>"
					+"<c:forEach var='tday' begin='1' end='${days}'><option value='${tday}'>${tday }</option></c:forEach></select></td><td style='display : none;'>"+lat+"</td><td style='display : none;'>"+lng+"</td></tr>");
			$('#change_'+d).prop('selectedIndex',day);
			disp(day);
			$( function() {
			    $( "table" ).sortable({
			    	items: $('.tr')
		    	});
			});
		}
	
	// 일정선택한 플레이스들의 일정을 변경하는 함수입니다
	function day_change(num, d) {
		var day = $("select[name=change_"+d+"]").val();
			if(day!=0) {
			$('#table-'+day).append($('#d'+num));
			 $('#'+num).attr({
		            'name' : 'day_value'+day
		          });
			
		}else {
			$('#'+d).prop('selectedIndex',0);
			$('#d'+num).remove();
			$('#pList'+num).show();
		}
	}
	// 이전 페이지로 돌아갑니다
	function back() {
		var con = confirm("작성을 취소하고 이전 페이지로 돌아갈까요?");
		if(con){
			history.back();
		}
	}
	// submit 체크
	function chk() {
		var count = $('.list>div:visible').length;
		if(count != 0) {
			alert("일정이 선택되지 않은 플레이스가 남아있습니다.\r\n일정을 선택해 주세요");
			return false;
		}
		
		if(frm.sch_name.value=="" || frm.sch_name.value==null) {
			alert("스케줄 이름을 설정해주세요");
			frm.sch_name.focus();
			return false;
		}
		
    	//값들의 갯수 -> 배열 길이를 지정
    	for(var i=1; i <= ${days}; i++) {
			var len = $("input[name=day_value"+i+"]").length;
			//배열 생성
			var day_group = new Array(len);
			//배열에 값 주입
			for(var j=0; j<len; j++){                          
				day_group[j] = $("input[name=day_value"+i+"]").eq(j).val();
				if(j==len-1) {
					day_group.push("day");
				}
			}
			result_day.push(day_group);
			$('#input_day'+i).val(day_group);
			$('#result_day').val(result_day);
	    }
    	
       	// 비어있는 일정이 있는지 확인하기
       	for(var i=1; i<= ${days}; i++) {
       		var empty_table = document.getElementById('table-'+i);
       		var row_count = empty_table.rows.length;
       		if(row_count == 1 ) {
       			alert("비어있는 일정이 존재합니다");
       			return false;
       		}
		}
    	var con = confirm("스케줄 작성을 완료하시겠습니까?");
    	if(con==false) {return false;}

	}
	
	function preview() {
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		polyline.setMap(null);
		var i = $("select[name=polyDay]").val();
		var linePath = [];
		var table = document.getElementById('table-'+i);
		var tbody = table.tBodies[0].rows.length;
		for(var j=1; j<=tbody-1; j++) {
			var tr= $('#table-'+i+'>tbody tr').eq(j);
			var td= tr.children();
			var plat= td.eq(4).text();
			var plng= td.eq(5).text();
			var latlng = new kakao.maps.LatLng(plat, plng);
			linePath.push(latlng);
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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertSchedule.do" method="post" name="frm"
		onsubmit="return chk();">
		<c:forEach var="detail" begin="1" end="${days }">
			<input type="hidden" id="input_day${detail }"
				name="input_day${detail }" value="">
		</c:forEach>
		<input type="hidden" name="days" value="${days }">
		<input type="text" name="result_day" id="result_day">
		<input type="hidden" name="s_date" value="${s_date }">
		<input type="hidden" name="e_date" value="${e_date }">
		<div id="wrapper">
			<div>
				<input type="text" name="sch_name" placeholder="나만의 스케줄 이름을 입력해주세요">
				<p>${s_date } ~ ${e_date }
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
			<div class="list"
				style="width: 35%; height: 60%; overflow: auto; padding-left: 20px; border: solid green 1px;">
				<c:set var="d" value="1" />
				<c:forEach var="p" items="${places }">
					<input type="hidden" id="p_lat${p.place_num }" value="${p.lat }">
					<input type="hidden" id="p_lng${p.place_num }" value="${p.lng }">
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
								id="p_addr${p.place_num }">${p.place_addr }</span><br> <span>선택
								일자</span> <select name="place${d }" id="place${d}"
								onchange="day_select(${p.place_num }, 'place${d}')"><c:set
									var="d" value="${d+1 }" />
								<option value="0" selected="selected">방문 일자</option>
								<c:forEach var="day" begin="1" end="${days }">
									<option value="${day }">${day }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="selected_day">
				<div style="float: left;" id="group0" class="group"
					onclick="disp(0)">전체 일정</div>
				<c:forEach var="d" begin="1" end="${days }">
					<div style="float: left;" id="group${d }" class="group"
						onclick="disp(${d})">${d }일차</div>
				</c:forEach>
			</div>
			<div class="selected_list">
				<c:forEach var="d" begin="1" end="${days }">
					<div id="day${d }">
						<table class="table talbe-striped" id="table-${d }">
							<caption>DAY ${d }</caption>
							<tr>
								<th>여행 순서</th>
								<th>장소명</th>
								<th>주소</th>
								<th>방문일자</th>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
			<div class="btn">
				<select name="polyDay">
					<c:forEach var="polyday" begin="1" end="${days }">
						<option value="${polyday }">${polyday }</option>
					</c:forEach>
				</select>
				<input type="button" onclick="preview()" value="경로 그리기">
				<input type="submit" value="확인" class="btn btn-success"> <input
					type="button" onclick="back()" value="이전" class="btn btn-cancel">
			</div>
		</div>
	</form>
</body>
</html>