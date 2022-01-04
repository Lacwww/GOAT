<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	img {width: 100%; height: 100%; padding-right: 2px;}
	.area_photo { float: left; width: 30%; height: 30%;}
	.area_text { width: 80%; padding: 5px; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="modal-header">
			<h3>${place.place_area }</h3>
		</div>
		<div class="modal-body">
			<div class="container" id="inner_content">
				<div class="area_photo">
					<img alt=""	src="${place.place_photo }">
				</div>
				<div class="area_text">
					<h3>${place.place_name}</h3>
					<h4>평점 : </h4>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="modal-footer">
				<input type="button" class="btn btn-sm btn-success" id="select" value="상세보기"
					onclick="location.href='makeSchedule.do?place_area=${area.place_area}'">
				<button class="btn btn-sm btn-danger pull-right"
					data-dismiss="modal" id="btnClose">
					<i class="ace-icon fa fa-times"></i>닫기
				</button>
			</div>
		</div>
	</div>
</body>
</html>