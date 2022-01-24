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
			window.open("${path}/place/updateFormTempPlace.do?place_num="+${place.place_num });
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
			<div class="container" id="inner_content" style="width: 100%;">
				<div class="bookmark"><img style="border-radius:10px; width: 50px;" class="bmChk" onclick="bookMarkChk(${place.place_num})" src="${bookMarkImgSrc }"> </div>
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
				onclick="window.open('${path }/place/prevDetailView.do?place_num=${place.place_num}')">
			<button class="btn btn-sm btn-danger pull-right"
				data-dismiss="modal" id="btnClose">
				닫기
			</button>
		</div>
	</div>
</body>
</html>