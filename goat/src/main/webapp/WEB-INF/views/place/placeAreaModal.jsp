<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btn1 {
	background-color: rgb(64,123,37);
	color: white;
	}
	.btn1:hover {
		background-color: rgb(114,201,75);
	}
	.modal-backdrop {
		  position: fixed;
		  top: 0;
		  left: 0;
		  z-index: -1;
		  width: 100vw;
		  height: 100vh;
		  background-color: #000;
	}
</style>
</head>
<body>
	<div>
		<div class="modal-header">
		</div>
		<div class="modal-body">
			<div class="container">
				<div style="width: 68%;" align="center"><h2><b>${place_area }</b></h2></div>
				<br>
				<div style="width: 68%;" align="center">
					<input type="button" class="btn btn1" value="전 지역" onclick="location.href='areaPlaceList.do?place_area=${place_area }'">
					<c:forEach var="areaDe" items="${areaDetailList }">
						<input type="button" class="btn btn1" value="${areaDe.place_areadetail }"
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