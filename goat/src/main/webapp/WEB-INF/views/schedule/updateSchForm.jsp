<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript">
	var places_num1 = '${places_numS}';
	var places_num=[];
	var id = [];
	places_num = places_num1.split(',');
	
	window.onload = function () {
		if(places_num== null  || places_num.length == 0) {
			id = [];
			alert(id+"1");
		} else {
			for(var i=0; i<places_num.length; i++) {
				id.push(Number(places_num[i]));
				frm.id.value=id;
			}
		}
	}
	
	$(document).ready(function() {
		var today = new Date();
		var s_date = $('input[name=s_date]').val()
		var e_date = $('input[name=e_date]').val()
	    $('#datepick').daterangepicker({ 
	    	"locale": { "format": "YYYY-MM-DD", 
	    	"separator": " ~ ", 
	    	"applyLabel": "확인", 
	    	"cancelLabel": "취소", 
	    	"fromLabel": "From", 
	    	"toLabel": "To", 
	    	"customRangeLabel": "Custom", 
	    	"weekLabel": "W", 
	    	"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"], 
	    	"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], 
	    	}, 
	    	"minDate": new Date(),
	    	"startDate" : new Date(s_date),
	    	"endDate": new Date(e_date),
	    	"drops": "auto" 
	    	}, function (start, end, label) { 
	    		$('input[name=s_date]').val(start.format('YYYY-MM-DD'));
	    		$('input[name=e_date]').val(end.format('YYYY-MM-DD'));
	    		console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') 
	    				+ ' (predefined range: ' + label + ')'); });
		
		 if(keyword==null || keyword==''){
			var keyword = $('#keyword').val();
			var search = $('#search option:selected').val()
			$('#list').load("placeList.do?place_area=${place_area}");
		} 
	});
	function searchPlace() {
		var keyword = $('#keyword').val();
		var search = $('#search option:selected').val()
		$('#list').load('placeList.do?search='+search+'&keyword='+keyword+'&place_area=${place_area}');
		setMarkers(null);    
	}
	
	function chk() {
		if($('#sdate').val()==null || $('#sdate').val()=="" || $('#edate').val()==null || $('#edate').val()=="") {
			alert("여행 일정을 선택해 주세요");
			return false;
		}
		
		var table = document.getElementById('Ppick');
		var s_date = $('input[name=s_date]').val();
		var s_arr = s_date.split("-");
		var e_date = $('input[name=e_date]').val();
		var e_arr = e_date.split("-");
		var stDate=new Date(s_arr[0], s_arr[1], s_arr[2]);
		var endDate=new Date(e_arr[0], e_arr[1], e_arr[2]);
		var btMs = endDate.getTime() - stDate.getTime();
		var days = btMs / (1000*60*60*24)+1;
		var tbody = table.tBodies[0].rows.length
		if(tbody-1 < days) {
			alert("선택한 플레이스가 여행 일수보다 적을 수 없습니다.");
			return false;
		}
	}
	
 	function show(cate) {
		$('.place_box').hide();
		$('#'+cate).show();
		$('.cate_select2').addClass('cate_select');
		$('.cate_select2').removeClass('cate_select2');
		$('#cate_' + cate).addClass('cate_select2');
 	}
</script>
<style type="text/css">
div #map {
	text-align: center;
}

input {
	border-radius: 3px;
}

.date {
	text-align: center;
}

#list {
	margin-left: 3px;
	height: 65%;
}

#wrapper {
	width: 65%;
	height: 100%;
	margin: auto;
}

.pList {
	margin-bottom: 20px;
}

#pimage {
	margin-bottom: 20px;
	float: left;
}

select {
	width: 80px;
	height: 40px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	font-size: 14px;
	background: url('${path}/resources/images/arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}

.cate_select {
	box-shadow: 0px 10px 14px -7px #3e7327;
	background: linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	background-color: #77b55a;
	border-radius: 28px;
	border: 1px solid #4b8f29;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	padding: 9px 17px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #5b8a3c;
	margin-right: 5%;
	font-size: 1.3rem;
	margin-bottom: 2%;
}

.cate_select:hover {
	background: linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
	background-color: #72b352;
}

.cate_select:active {
	position: relative;
	top: 1px;
}

.cate_select2 {
	box-shadow: 0px 10px 14px -7px #3e7327;
	background: linear-gradient(to bottom, #2dabf9 5%, #0688fa 100%);
	background-color: #0688fa;
	border-radius: 28px;
	border: 1px solid #4b8f29;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-weight: bold;
	padding: 9px 17px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #5b8a3c;
	margin-right: 5%;
	font-size: 1.5rem;
	margin-bottom: 2%;
}

.cate_select2:hover {
	background: linear-gradient(to bottom, #0688fa 5%, #2dabf9 100%);
	background-color: #0688fa;
}

.cate_select2:active {
	position: relative;
	top: 1px;
}

#datepick {
	width: 200px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="text text-primary" align="center">여행할 장소를 선택해주세요</h2>
	<!-- 여행 일자 선택 -->
	<div id="wrapper">
		<form action="updateSchDetail.do" name="frm" method="post"
			onsubmit="return chk();">
			<input type="hidden" name="sch_num" value="${sch.sch_num }">
			<div id="navyDiv" style="width: 100%;">
				<input type="hidden" id="id" name="id" value=""> 
				<input type="hidden" name="place_area" value="${place_area }">
				<div style="width: 100%;">
					<img alt="calendar" src="${path }/resources/images/calendar.png"
						style="width: 60px; height: 70px; padding-bottom: 5px;">
						<input type="text" id="datepick" value=""> 
						<input type="hidden" name="s_date" id="sdate" class="date" value="${sch.s_date }">
						<input type=hidden name="e_date" id="edate" class="date" value="${sch.e_date }">
					<!-- 플레이스 검색 -->
					<div style="float: right; margin-right:3%;">
						<div>
							<select name="search" id="search">
								<c:forTokens var="sh" items="place_name,place_tag" delims=","
									varStatus="i">
									<c:if test="${sh==place.search }">
										<option value="${sh }" selected="selected">${t[i.index ]}</option>
									</c:if>
									<c:if test="${sh!=place.search }">
										<option value="${sh }">${t[i.index ]}</option>
									</c:if>
								</c:forTokens>
							</select> <input type="text" name="keyword" id="keyword"
								placeholder="검색어를 입력해주세요" value="" style="width: 200px; height: 40px;"> 
								<input type="button"class="btn btn-light" onclick="searchPlace()"
									value="검색"  style="width: 60px; height: 40px;">
						</div>
						<!-- 플레이스 카테고리 선택 -->
						<div align="center">
							<div class="cate_select2" id="cate_tour" onclick="show('tour')">관광지</div>
							<div class="cate_select" id="cate_food" onclick="show('food')">식당</div>
							<div class="cate_select" id="cate_rest" onclick="show('rest')">숙소</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 지도 -->
				<div class="mapDiv" style="width: 65%; float: left;">
			
				<div id="map" style="width:100%;height:60%;"></div>
				<script type="text/javascript" 
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0&libraries=services"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 9
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
				<div id="btn" align="center" style="margin-top: 1%;">
					<input type="submit" value="상세일정 작성" class="btn btn-primary">
					<input type="button" value="취소" onclick="history.back()"
							class="btn btn-danger">
				</div>

				</div>
	
				<!-- 플레이스 목록 -->
				<div id="list"></div>
				
				<!-- 플레이스 고른 목록 -->
				<div id="pick_place" style="align-items: center;">
					<table class="table table-bordered table-striped" id="Ppick" style="align-content: center;"><caption>내가 고른 플레이스 목록</caption>
						<thead>
							<tr><th>사진</th><th>장소</th><th>주소</th><th>태그</th></tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${plist }">
								<tr><tr id="tr${p.place_num }"><td style="position:relative;" class='column1' align='center'><span onclick='del(${p.place_num})' 
									class='glyphicon glyphicon-remove' style='position : absolute; top:8%; left:5%;'></span>
									<img alt='' src="${p.place_photo }" id='p_image' style="align : center; width: 150px; height: 150px;"></td>
									<td>${p.place_name }</td><td>${p.place_addr }</td><td>${p.place_tag }</td></tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>	
		</div>
		
</body>
</html>