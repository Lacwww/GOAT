<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tiles/sessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="${path}/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	.area_img2 {
		width: 100%;
		height: 100%;
		padding-right: 2px;
	}
	
	.area_photo {
		float: left;
		width: 50%;
		height: 100%;
	}
	
	.area_text {
		margin-left : 3%;
		width: 90%;
		padding: 5px;
	}
	#inner_content {
		width: 100%;
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
<script type="text/javascript">
	function chk() {
			if(${empty id }) { 
				alert("로그인 후 이용해주세요 ");
				location.href="${path}/member/loginForm.do";
				return false; 
			} else {
				location.href='makeScheduleForm.do?place_area=${area.place_area}';
			}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="modal-header">
			<h3>${area.place_area }</h3>
		</div>
		<div class="modal-body">
			<div class="container" id="inner_content" style="display:flex;flex-direction: row;justify-content: center;align-items: center;">
				<div class="area_photo">
					<img alt="${area.place_area }"
						src="${path }/resources/areaImages/${area.area_photo }" class="area_img2">
				</div>
				<div class="area_text">
					<h4>${area.place_area }</h4>
					<span>${area.description}</span>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="foot">
				<input type="button" class="btn btn-sm btn-success" id="select"
					value="Go on a Trip"
					onclick="chk()">
				<button class="btn btn-sm btn-danger pull-right"
					data-dismiss="modal" id="btnClose">
					<i class="ace-icon fa fa-times"></i>닫기
				</button>
			</div>
		</div>
	</div>
</body>
</html>