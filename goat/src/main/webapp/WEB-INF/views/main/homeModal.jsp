<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#inner_content { display: flex; justify-content: center; align-items: center; width: 100%; }
	#inner_content div { width: 30%; cursor: pointer; margin: 15px; }
	#inner_content img { width: 100%; height: 210px;}
	p { margin: 5px; }
</style>
</head>
<body>
	<div>
		<div class="modal-header">
			<h3>${area }</h3>
		</div>
		<div class="modal-body">
			<div class="container" id="inner_content" align="center">
				<div onclick="location.href='/goat/makeScheduleForm.do?place_area=제주시'">
					<img alt="" src="${path }/resources/images/aewol.jpeg">
					<p>제주시</p>
				</div>
				<div onclick="location.href='/goat/makeScheduleForm.do?place_area=서귀포시'">
					<img alt="" src="${path }/resources/images/seongsan.jpeg">
					<p>서귀포시</p>
				</div>
			</div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</body>
</html>