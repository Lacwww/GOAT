<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btn {
	background-color: rgb(64,123,37);
	color: white;
	}
	.btn:hover {
		background-color: rgb(114,201,75);
	}
</style>
</head>
<body>
	<div>
		<div class="modal-header">
		</div>
		<div class="modal-body">
			<div class="container">
				<div style="width: 73%;" align="center"><h2><b>${place_area }</b></h2></div>
				<br>
				<div style="width: 73%;" align="center">
					<input type="button" class="btn" value="전 지역" onclick="location.href='areaPlaceList.do?place_area=${place_area }'">
					<c:forEach var="areaDe" items="${areaDetailList }">
						<input type="button" class="btn" value="${areaDe.place_areadetail }"
							onclick="location.href='areaPlaceList.do?place_area=${place_area }&place_areadetail=${areaDe.place_areadetail }'" >
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</body>
</html>