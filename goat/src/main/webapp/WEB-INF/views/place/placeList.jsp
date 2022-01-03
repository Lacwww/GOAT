<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#sch {
	margin-bottom: 80px;
}

.area {
	width: 23%;
	height: 30%;
	float: left;
	position: relative;
	padding: 10px;
}

.area img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 7px;
}

.desc {
	padding: 20px;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	background-color: #5e5a5a;
	opacity: 0.8;
	position: relative;
	bottom: 24%;
	color: #ffffff;
	border-radius: 7px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 지역 리스트 -->
	<div class="container" align="center">
		<h2 id="sch">플레이스 지역 선택</h2>
		<h3>어디로 가볼까요?</h3>
		<form action="" name="frm">
			<input type="text" name="keyword" value="">
			<button type="submit">검색</button>
		</form>
		<div align="center"> <input type="button" value="플레이스 등록"> <input type="button" value="플레이스 건의"> </div>
		<div class="container" align="center">
			<c:forEach var="area" items="${list }">
			<div class="area">
				<div class="areaPhoto">
					<a href="areaPlaceList.do?place_area=${area.place_area }">
						<img alt="${area.place_area }" src="${path}/resources/areaImages/${area.area_photo }">	
					</a>
				</div>
					<div class="desc">${area.place_area }</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>