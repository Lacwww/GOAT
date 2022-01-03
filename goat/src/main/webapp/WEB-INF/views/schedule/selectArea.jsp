<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function modal(area) {
		$('#Modal .modal_content').load("selectModal.do?place_area="+area);
		$('#Modal').modal();
	}
</script>
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
		<h2 id="sch">스케줄 생성</h2>
		<h3 class="text-primary" style="margin-bottom: 40px;">어디로 가볼까요?</h3>
		<form action="selectArea.do" method="get" name="frm">
			<input type="text" name="keyword" id="keyword"
				placeholder=" 지역을 검색해주세요" value="${keyword }"
				style="width: 45%; height: 4%; font-size: 25px;">
			<button type="submit" class="btn btn-light">검색</button>
		</form>
		<div class="container" align="center">
			<c:forEach var="area" items="${list }">
			<div class="area" onclick="modal('${area.place_area}')">
				<div class="areaPhoto">
					<img alt="${area.place_area }" src="${path}/resources/areaImages/${area.area_photo }">
				</div>
					<div class="desc">${area.place_area }</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 지역 모달 -->
	<div class="container" id="Modal">
		<div class="modal_content"></div>
	</div>
</body>
</html>