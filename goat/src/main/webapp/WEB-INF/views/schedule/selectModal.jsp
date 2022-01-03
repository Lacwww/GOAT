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
		<h4>${area.place_area }에 대하여</h4>
	</div>
	<div class="modal-body">
		<div class="container">
			<div style="float: left;">
				<img alt="${area.place_area }" src="${path }/resources/areaImages/${area.area_photo }">
			</div>
			<div>
				<h5>${area.place_area }</h5><br>
				<span>${area.description}</span>
			</div>
		</div>
	</div>
</div>
</body>
</html>