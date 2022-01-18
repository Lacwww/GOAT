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
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	background-color: #5e5a5a;
	opacity: 0.8;
	position: relative;
	bottom: 24%;
	color: #ffffff;
	border-radius: 7px;
}

	.btn {
	background-color: rgb(64,123,37);
	color: white;
	}
	.btn:hover {
		background-color: rgb(114,201,75);
	}
</style>
<script type="text/javascript">
	function modal(place_num) {
		$('#MoaModal .modal-content').load("placeModal.do?place_num=" + place_num);
		$('#MoaModal').modal();
	}
</script>
</head>
<body>

<div align="center"><h2><b>${place.place_area }</b></h2></div>
<c:if test="${not empty place.place_areadetail }">
	<div align="center"><h3><b>- ${place.place_areadetail } -</b></h3></div>
</c:if>
<form action="areaPlaceList.do">
	<input type="hidden" name="pageNum" value="1">
	<input type="hidden" name="place_area" value="${place_area }">
	<input type="hidden" name="place_areadetail" value="${place.place_areadetail }">
	<div align="center">
		<select class="form-control" style="width: 8%; display: inline;" name="search">
		<c:if test="${searchPoint == 0}">
			<option>전체</option>
			<option value="관광지">관광지</option>
			<option value="숙소">숙소</option>
			<option value="음식점">음식점</option>
		</c:if>
		<c:if test="${searchPoint == 1 }">
			<option>전체</option>
			<option value="관광지" selected="selected">관광지</option>
			<option value="숙소">숙소</option>
			<option value="음식점">음식점</option>
		</c:if>
		<c:if test="${searchPoint == 2 }">
			<option>전체</option>
			<option value="관광지">관광지</option>
			<option value="숙소" selected="selected">숙소</option>
			<option value="음식점">음식점</option>
		</c:if>
		<c:if test="${searchPoint == 3 }">
			<option>전체</option>
			<option value="관광지">관광지</option>
			<option value="숙소">숙소</option>
			<option value="음식점" selected="selected">음식점</option>
		</c:if>

		</select>
		<input type="text" class="form-control" style="width: 20%; display: inline;" name="keyword" value="${place.keyword }">
		<input type="submit" class="btn" value="검색">
	</div>
</form>

<div align="center">
	<input type="button" class="btn" value="플레이스 등록" onclick="location.href='insertFormTempPlace.do'">
</div>

<c:if test="${empty list }">
	<h2 align="center">지역에 해당하는 장소가 없습니다.</h2>
</c:if>
<c:if test="${not empty list }">
		<div class="container" align="center" style="margin-left: 3%;">
			<c:forEach var="place" items="${list }">
			<div class="area" onclick="modal('${place.place_num}')">
				<div class="areaPhoto">
						<img alt="${place.place_name }" src="${place.place_photo }">	
				</div>
					<div class="desc">${place.place_name }</div>
			</div>
			</c:forEach>
		</div>
</c:if>	
	
	
<div align="center" style="clear: both;">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${startPage > pagePerBlock }">
			<li><a href="areaPlaceList.do?pageNum=1&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a href="areaPlaceList.do?pageNum=${startPage-1}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==i }">
				<li class="active"><a href="areaPlaceList.do?pageNum=${i}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">${i}</a></li>
			</c:if>
			<c:if test="${currentPage!=i }">
				<li><a href="areaPlaceList.do?pageNum=${i}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${endPage < totalPage }">
			<li><a href="areaPlaceList.do?pageNum=${endPage+1}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="areaPlaceList.do?pageNum=${totalPage}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>

	<!-- 장소모달 -->
	<div class="modal" id="MoaModal" tabindex="-1" role="dialog"
		aria-labelledby="historyModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document" style="margin-top: 10%;">
			<div class="modal-content" ></div>
		</div>
	</div>
</body>
</html>