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
		<form action="makeSchedule.do" name="frm" method="post">
			<div style="width: 100%;">
				<img alt="calendar" src="${path }/resources/images/calendar.png"
					 style="width: 60px; height: 70px; padding-bottom : 5px;">
				<input type="text" name="s_date" id="start" class="date">
				<span class="glyphicon glyphicon-minus" style="padding-left: 15px; padding-right: 15px;">
				</span><input type="text" name="e_date" id="end" class="date">
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
				<div id="list"></div>
				
				<!-- 플레이스 고른 목록 -->
				<div id="pick_place" style="align-items: center;">
					<table class="table table-bordered"><caption>내가 고른 플레이스 목록</caption>
						<tr><th>사진</th><th>장소</th><th>주소</th><th>태그</th></tr>
					</table>
				</div>
				
				<div id="btn">
					<input type="submit" value="상세일정 작성">
					<input type="button" value="취소" onclick="location.href='selectArea.do'">
				</div>
		</div>
</body>
</html>