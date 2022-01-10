<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">Bookmark Place</h2>
		<c:if test="${empty list }">
			<h2 align="center">북마크가 없습니다</h2>
		</c:if>
		<c:if test="${not empty list }">
			<div class="container" align="center">
				<c:forEach var="place" items="${list }">
					<div class="area" onclick="location.href='${path }/place/prevDetailView.do?place_num=${place.place_num }'">
						<div class="areaPhoto">
							<img alt="${place.place_name }" src="${place.place_photo }">	
						</div>
						<div class="desc">${place.place_name }</div>
					</div>
				</c:forEach>
			</div>
		</c:if>	
	</div>
</body>
</html>