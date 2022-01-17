<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.top {float: left; }
	.bookmark {float: right;}
	.star, .star1, .star2{
	  display:inline-block;
	  width: 30px;height: 30px;
	  cursor: pointer;
	}
	.star_empty{
	  background: url(${path}/resources/p_images/nostar.png) no-repeat 0 0; 
	  background-size: 30px; 
	  margin-right: -3px;
	}
	.on{
	  background-image: url(${path}/resources/p_images/star.png);
	  background-size: 30px;
	}
	input[type=radio] {display: none; } 
	.btn {
	background-color: rgb(64,123,37);
	color: white;
	}
	.btn:hover {
		background-color: rgb(114,201,75);
	}
	.bgcolor{	
		background-color: rgb(64,123,37);
		color: white; 
		border-radius: 5px;
	}	
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript">
	$(function() {
		$('#prevListDisp').load('prevList.do?place_num=${place.place_num}');	
		$('#insertprev').click(function() {
			if(${empty id}){
				alert("로그인 후 이용가능합니다");
				return false;
			}
			if(frm1.prev_title.value == ''){
				alert("제목을 입력하세요");
				return false;
			}
			if(frm1.prev_content.value == ''){
				alert("내용을 입력하세요");
				return false;
			}
			if(frm1.score.value == ''){
				alert("별점을 선택해주세요");
				return false;
			}
			var sendData = $('#frm1').serialize();
			$.post('insertPrev.do', sendData, function(data) {
				alert("댓글이 작성 되었습니다.");
				$('#prevListDisp').html(data);
				frm1.prev_title.value = "";
				frm1.prev_content.value = "";	
				$(".star").removeClass("on");
			});
		});
	});
	function bookMarkChk(place_num) {
		if(${empty id}){
			alert("로그인 후 이용가능합니다");
			return false;
		}
		$.post("bookMark.do", "place_num="+place_num, function(data) {
			var bookMarkImgSrc = data;
			if(bookMarkImgSrc.indexOf('no') == -1){
				alert("북마크에 저장되었습니다");
			}else{
				alert("북마크가 삭제되었습니다");
			}
			$(".bmChk").attr("src", bookMarkImgSrc);
		});			
	};
	
// 	클릭한 별 이전에 있는 모든별 채우기
	$(function() {
	    $(".star").on('click',function(){
	    	var idx = $(this).index();
	    	$(".star").removeClass("on");
	    		for(var i=0; i<=idx; i++){
	    	    $(".star").eq(i).addClass("on");
	    	}
	    });
	});

</script>
</head>
<body>
	<div class="container" style="margin-left: 10%;">
		<div align="center" class="top"><img alt="" src="${place.place_photo }" style="width: 450px; height: 400px;"></div>
		<div id="map" class="top" style="width:450px; height: 400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(${place.lat}, ${place.lng}),
				level: 3
			};	
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${place.lat}, ${place.lng}); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			map.setZoomable(false); 
			map.setDraggable(false); 
			marker.setMap(map);
		</script>
	</div>
	<div class="container" style="margin-left: 10%; width: 81.5%;">
		<div class="bookmark"><img style="border-radius:10px; width: 50px;" class="bmChk" onclick="bookMarkChk(${place.place_num})" src="${bookMarkImgSrc }"> </div>
		<h2 class="text-primary">${place.place_name }</h2>
		<br>
		<h3>평점 : <fmt:formatNumber value="${avgScore }" pattern="0.00"></fmt:formatNumber> </h3>
		<h4>지역 : ${place.place_area }</h4>
		<h4>카테고리 : ${place.place_cate }</h4>
		<h4>주소(지번) : ${place.place_addr }</h4>
		<h4>주소(도로명) : ${place.place_addrd }</h4>
		<h4>태그 : ${place.place_tag }</h4>
		<h4>내용 : ${place.place_content }</h4>	
	</div>
	<div id="prevListDisp" style="margin-left: 9%; width: 85%;"></div>
	<hr style="margin-left: 10%; width: 80%;">
	<div style="margin-left: 10%; width: 85%;">
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="place_num" value="${place.place_num }">
			<h3 class="text-primary">평가글 작성</h3>
				<div style="margin-left:5%; color:red"><b>* 제목은 최대 10글자</b></div>
			<table style="margin-top: 0px;">
				<tr>
					<td align="center" style="width: 7%;" class="bgcolor">제목</td><td style="width: 25%; padding-left: 10px; padding-right: 10px;" >
						<input type="text" class="form-control" maxlength="10" name="prev_title" required="required"></td>
					<td align="center" style="width: 7%;" class="bgcolor">평점</td><td  style="width: 22%;">
						<div class="star-box" style="padding-left: 10px; padding-right: 10px;">
							  <label for="star1" class="star star_empty"></label>
							  <label for="star2" class="star star_empty"></label>
							  <label for="star3" class="star star_empty"></label>
							  <label for="star4" class="star star_empty"></label>
							  <label for="star5" class="star star_empty"></label>
							   <input type="radio" name="score" id="star1" class="radio" value="1">
							   <input type="radio" name="score" id="star2" class="radio" value="2">
							   <input type="radio" name="score" id="star3" class="radio" value="3">
							   <input type="radio" name="score" id="star4" class="radio" value="4">
							   <input type="radio" name="score" id="star5" class="radio" value="5">
						</div>
					</td>
					<td align="center" style="width: 7%;" class="bgcolor">내용</td><td colspan="5" style="padding-left: 10px;">
					<textarea rows="2" cols="30" name="prev_content" required="required"></textarea></td>
					<td><input type="button" style="margin-left: 10%;" class="btn" value="등록" id="insertprev"></td>
			</table>
			<hr>
		</form>
	</div>
</body>
</html>