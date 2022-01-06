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
	<div>
		<div class="modal-header">
		</div>
		<div class="modal-body">
			<div class="container">
			<%-- areaPlaceList.do?place_area=${area.place_area } --%>
				<div>지역 : ${place_area }</div>
				<input type="button" value="전 지역" onclick="location.href='areaPlaceList.do?place_area=${place_area }'">
				<c:forEach var="areaDe" items="${areaDetailList }">
					<input type="button" value="${areaDe.place_areadetail }"
						onclick="location.href='areaPlaceList.do?place_area=${place_area }&place_areadetail=${areaDe.place_areadetail }'" >
				</c:forEach>
			</div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</body>
</html>