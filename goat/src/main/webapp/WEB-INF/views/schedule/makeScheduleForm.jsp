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
		$('#list').load("placeList.do?place_area=${place_area}");
	});
</script>
<style type="text/css">
	div #map {text-align: center;}
	input {	border-radius: 5px; text-align: center;}
	#list { margin-left: 10px; height: 65%;}
	#wrapper {
		width: 100%; 
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
		<form action="makeSchedule.do" name="frm" method="post">
			<div>
				<img alt="calendar" src="${path }/resources/images/calendar.png"
					 style="width: 60px; height: 70px; padding-bottom : 5px;">
				<input type="text" name="s_date" id="start">
				<span class="glyphicon glyphicon-minus" style="padding-left: 15px; padding-right: 15px;">
				</span><input type="text" name="e_date" id="end">
			</div>
			<!-- 지도 -->
				<div id="map" style="width:100%;height:60%;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df7b638398d433401d5b74ea1f4fb0"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 3
					};
					var map = new kakao.maps.Map(container, options);
				</script>
			</form>
			</div>
				<!-- 플레이스 목록 -->
				<div id="list">
				</div>
		</div>
</body>
</html>