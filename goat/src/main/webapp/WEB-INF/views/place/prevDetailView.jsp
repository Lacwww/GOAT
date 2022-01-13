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
	.bookmark {float: right; margin-right: 20%;}
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
	}
	input[type=radio] {display: none; } 

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
	<div class="container">
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
	<div class="container">
		<div class="bookmark"><img class="bmChk" onclick="bookMarkChk(${place.place_num})" src="${bookMarkImgSrc }"> </div>
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
	<div id="prevListDisp"></div>
	<div>
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="place_num" value="${place.place_num }">
			<table>
				<tr><th>제목</th><td><input type="text" name="prev_title" required="required"></td>
					<th>평점</th><td>
						<div class="star-box">
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
					<th><input type="button" value="등록" id="insertprev"></th>
					</tr>
				<tr><th>내용</th><th colspan="5">
				<textarea rows="4" cols="50" name="prev_content" required="required"></textarea></th></tr>
			</table>
		</form>
	</div>
</body>
</html>