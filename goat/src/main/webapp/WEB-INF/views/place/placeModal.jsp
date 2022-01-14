<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.placeImg {width: 100%; height: 100%; padding-right: 2px;}
	.area_photo { float: left; width: 30%; height: 30%;}
	.area_photo img { border-radius: 10px;}
	.area_text {margin-left: 35%;}
	a {cursor: pointer; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function updatePlace() {
		if(${empty id}){
			alert("로그인 후 이용해주세요");
			return false;
		}
		var con = confirm("플레이스 건의를 하시겠습니까?");
		if(con){
			location.href="updateFormTempPlace.do?place_num="+${place.place_num };
		}
	};
</script>
</head>
<body>
	<div>
		<div class="modal-header">
			<h3>${place.place_area }</h3>
		</div>
		<div class="modal-body">
			<div class="container" id="inner_content" style="width: 100%;">
				<div class="area_photo">
					<img class="placeImg" alt=""	src="${place.place_photo }">
				</div>
				<div class="area_text">
					<h3>${place.place_name}</h3>
					<br>
					<h4>평점 : <fmt:formatNumber value="${avgScore }" pattern="0.00"/></h4>
					<h5>태그 : ${place.place_tag }</h5>
					<br>
					<h5>${place.place_content }</h5>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="pull-left"><a onclick="updatePlace()">플레이스 건의</a></div>
			<input type="button" class="btn btn-sm btn-success" id="select" value="상세보기"
				onclick="location.href='prevDetailView.do?place_num=${place.place_num}'">
			<button class="btn btn-sm btn-danger pull-right"
				data-dismiss="modal" id="btnClose">
				닫기
			</button>
		</div>
	</div>
</body>
</html>