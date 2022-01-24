<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	.placeImg {width: 100%; height: 100%; padding-right: 2px;}
	.area_photo { float: left; width: 30%; height: 30%;}
	.area_photo img { border-radius: 10px;}
	a {cursor: pointer; }
	.bookmark {float: right;}
	.bmChk { cursor: pointer;}
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
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function updatePlace() {
		if(${not empty admin}){ 
			alert("관리자는 플레이스 건의를  할 수 없습니다.");
			return false;
		}else if(${empty id}){
			alert("로그인 후 이용가능합니다");
			return false;
		}
		var con = confirm("플레이스 건의를 하시겠습니까?");
		if(con){
			location.href="updateFormTempPlace.do?place_num="+${place.place_num };
		}
	};
	function bookMarkChk(place_num) {
		if(${not empty admin}){
			alert("관리자는 북마크를 할 수 없습니다.");
			return false;
		}else if(${empty id}){
			alert("로그인 후 이용가능합니다");
			return false;
		}
		$.post("${path}/place/bookMark.do", "place_num="+place_num, function(data) {
			var bookMarkImgSrc = data;
			if(bookMarkImgSrc.indexOf('no') == -1){
				alert("북마크에 저장되었습니다");
			}else{
				alert("북마크가 삭제되었습니다");
			}
			$(".bmChk").attr("src", bookMarkImgSrc);
		});			
	};
</script>
</head>
<body>
	<div>
		<div class="modal-header">
			<h3>${place.place_area }</h3>
		</div>
		<div class="modal-body">
		<table style="width: 100%; height: 200px;">
			<tr><td rowspan="5" style="width: 40%;"><div class="area_photo" style="float: left; width: 100%; height: 100%;">
					<img class="placeImg" alt=""	src="${place.place_photo }">
				</div></td></tr>
			<tr><td><h3 style="display: inline;">${place.place_name}</h3><div class="bookmark"><img style="border-radius:10px; width: 50px;" class="bmChk" onclick="bookMarkChk(${place.place_num})" src="${bookMarkImgSrc }"> </div></td></tr>
			<tr><td><h4>평점 : <fmt:formatNumber value="${avgScore }" pattern="0.00"/></h4></td></tr>
			<tr><td><h5>태그 : ${place.place_tag }</h5></td></tr>
			<tr><td><h5>${place.place_content }</h5></td></tr>
		</table>
		</div>
		<div class="modal-footer" style="display: inline;">
			<a style="padding-left: 2%;" class="pull-left" onclick="updatePlace()">플레이스 건의</a>
			<button class="btn btn-sm btn-danger pull-right"
				data-dismiss="modal" id="btnClose" style="margin-right: 2%;">
				닫기
			</button>
			<input type="button" class="btn btn-sm btn-success pull-right" id="select" value="상세보기"
				onclick="location.href='prevDetailView.do?place_num=${place.place_num}'">

		</div>
	</div>
</body>
</html>