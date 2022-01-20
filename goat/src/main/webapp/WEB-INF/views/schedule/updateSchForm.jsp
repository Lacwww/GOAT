<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

	$(function() {
		$("#start").datepicker({
			showOn : "both",
			buttonImage : "${path}/resources/images/date.png",
			buttonImageOnly : "true",
			dateFormat : "yy-mm-dd",
			minDate: 0,
			buttonText : "여행 시작날짜",
			onClose : function(selectDate) {
				$("#end").datepicker("option","minDate",selectDate)
			}
		});
		
		$("#end").datepicker({
			showOn : "both",
			buttonImage : "${path}/resources/images/date.png",
			buttonImageOnly : "true",
			dateFormat : "yy-mm-dd",
			minDate: 0,
			buttonText : "여행 종료날짜",
			onClose : function(selectDate) {
				$("#start").datepicker("option","maxDate",selectDate)
			}
		});
	});
	
	$(document).ready(function() {
		var keyword = $('#keyword').val();
		var search = $('#search option:selected').val()
		if(keyword==null || keyword==''){
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
		if($('#start').val()==null || $('#start').val()=="" || $('#end').val()==null || $('#end').val()=="") {
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
</script>
<style type="text/css">
	div #map {text-align: center;}
	input {	border-radius: 5px;}
	.date { text-align: center;}
	#list { margin-left: 3px; height: 65%;}
	#wrapper {
		width: 100%; height: 100%;; 
	} 
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="text text-primary" align="center">여행할 장소를 선택해주세요</h2>
	<!-- 여행 일자 선택 -->
	<div id="wrapper">
		<div id="outer" style="width: 65%; float: left;">
		<form action="updateSchDetail.do" name="frm" method="post" onsubmit="return chk();"> 
			<input type="hidden" name="id" value="">
			<input type="hidden" name="sch_num" value="${sch_num }">
			<input type="hidden" name="place_area" value="${place_area }">
			<div style="width: 100%;">
				<img alt="calendar" src="${path }/resources/images/calendar.png"
					 style="width: 60px; height: 70px; padding-bottom : 5px;">
				<input type="text" name="s_date" id="start" class="date" value="${sch.s_date }">
				<span class="glyphicon glyphicon-minus" style="padding-left: 15px; padding-right: 15px;">
				</span><input type="text" name="e_date" id="end" class="date" value="${sch.e_date }">

				<!-- 플레이스 검색 -->
				<div style="float: left;">
				<select name="search" id="search">
					<c:forTokens var="sh" items="place_name,place_tag" delims="," varStatus="i">
						<c:if test="${sh==place.search }">
							<option value="${sh }" selected="selected">${t[i.index ]}</option>
						</c:if>
						<c:if test="${sh!=place.search }">
							<option value="${sh }">${t[i.index ]}</option>
						</c:if>
					</c:forTokens>
				</select>
				<input type="text" name="keyword" id="keyword"
					placeholder="검색어를 입력해주세요" value="">
				<input type="button" class="btn btn-light" onclick="searchPlace()" value="검색">
				</div>
			</div>
			
			
			<!-- 지도 -->
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
				<div id="btn">
					<input type="submit" value="상세일정 작성">
					<input type="button" value="취소" onclick="location.href='selectArea.do'">
				</div>
					</form>	

				</div>
	
				<!-- 플레이스 목록 -->
				<div id="list"></div>
				
				<!-- 플레이스 고른 목록 -->
				<div id="pick_place" style="align-items: center;">
					<table class="table table-bordered" id="Ppick" style="align-content: center;"><caption>내가 고른 플레이스 목록</caption>
						<tr><th>사진</th><th>장소</th><th>주소</th><th>태그</th></tr>
						<c:forEach var="p" items="${plist }">
							<tr><tr id="tr${p.place_num }"><td><span onclick='del(${p.place_num})' class='glyphicon glyphicon-remove'></span>
								<img alt='' src="${p.place_photo }" id='p_image' style="align : center; width: 150px; height: 150px;"></td>
								<td>${p.place_name }</td><td>${p.place_addr }</td><td>${p.place_tag }</td></tr>
						</c:forEach>
					</table>
				</div>
		</div>
</body>
</html>