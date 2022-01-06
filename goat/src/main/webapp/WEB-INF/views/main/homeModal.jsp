<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="modal-header">
			<h3>${area }</h3>
		</div>
		<div class="modal-body">
			<div class="container" id="inner_content" align="center" style="width: 100%;">
				<a href="/goat/makeScheduleForm.do?place_area=제주시">제주시</a>
				<a href="/goat/makeScheduleForm.do?place_area=서귀포시">서귀포시</a>
			</div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</body>
</html>