<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">선택 지역 : ${place.place_area }</div>
<form action="">
<div align="center"><input type="text" name="keyword"><input type="submit" value="검색"></div>
</form>
<div align="center"> <input type="button" value="플레이스 등록"> <input type="button" value="플레이스 건의"> </div>

<c:if test="${empty list }">
	<h2 align="center">지역에 해당하는 장소가 없습니다.</h2>
</c:if>
<c:if test="${not empty list }">
	

</c:if>
<div align="center">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${startPage > pagePerBlock }">
			<li><a href="areaPlaceList.do?pageNum=1&place_area=${place_area }">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a href="areaPlaceList.do?pageNum=${startPage-1}&place_area=${place_area }">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==i }">
				<li class="active"><a href="areaPlaceList.do?pageNum=${i}&place_area=${place_area }">${i}</a></li>
			</c:if>
			<c:if test="${currentPage!=i }">
				<li><a href="areaPlaceList.do?pageNum=${i}&place_area=${place_area }">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${endPage < totalPage }">
			<li><a href="areaPlaceList.do?pageNum=${endPage+1}&place_area=${place_area }">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="areaPlaceList.do?pageNum=${totalPage}&place_area=${place_area }">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</body>
</html>