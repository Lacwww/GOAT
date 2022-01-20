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
	.up{
	  background-image: url(${path}/resources/p_images/upstar.png);
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
	.bmChk { cursor: pointer;}
	.textTh {text-align:center; width: 20%; border-bottom: 1px solid white; }
	.lpad {padding-left: 5%; border-bottom: 1px solid black;}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript">
	$(function() {
		$('#prevListDisp').load('prevList.do?place_num=${place.place_num}');	
		$('#insertprev').click(function() {
			if(${not empty admin}){
				alert("관리자는 평가를 할 수 없습니다.");
				return false;
			}else if(${empty id}){
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
				alert("평가가 작성 되었습니다.");
				$('#prevListDisp').html(data);
				frm1.prev_title.value = "";
				frm1.prev_content.value = "";	
				$(".star").removeClass("on");
				location.reload();
			});
		});
	});
	function bookMarkChk(place_num) {
		if(${not empty admin}){
			alert("관리자는 북마크를 할 수 없습니다.");
			return false;
		}else if(${empty id}){
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
//  마우스 올려놓을떄 이전별 모드 채우기
	$(function() {
	    $(".star").on('click',function(){
	    	var idx = $(this).index();
	    	$(".star").removeClass("on");
	    		for(var i=0; i<=idx; i++){
	    	    $(".star").eq(i).addClass("on");
	    	}
	    });
	    $(".star").on('mouseenter',function(){
	    	var idx = $(this).index();
	    	$(".star").removeClass("up");
	    		for(var i=0; i<=idx; i++){
	    	    $(".star").eq(i).addClass("up");
	    	}
	    });
	    $(".star").mouseout(function(){
			$('.star').removeClass('up');	
	    });
	});

	function update(num) {
		var con = confirm("수정하시겠습니까?");
		
		if(con){
			location.href="adminUpdatePlaceForm.do?place_num="+num;
		}else{
			
		}
	}
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
		<h2 class="text-primary" style="color: green;"><b>${place.place_name }</b></h2>
		<br>
		<table style="margin-left: 5%; width: 90%">
			<tr><td class="bgcolor textTh"><h4>평점</h4></td><td class="lpad"><fmt:formatNumber value="${avgScore }" pattern="0.00"></fmt:formatNumber></td></tr>
			<tr><td class="bgcolor textTh"><h4>지역</h4></td><td class="lpad">${place.place_area }</td></tr>
			<tr><td class="bgcolor textTh"><h4>카테고리</h4></td><td class="lpad">${place.place_cate }</td></tr>
			<tr><td class="bgcolor textTh"><h4>지번 주소</h4></td><td class="lpad">${place.place_addr }</td></tr>
			<tr><td class="bgcolor textTh"><h4>도로명 주소</h4></td><td class="lpad">${place.place_addrd }</td></tr>
			<tr><td class="bgcolor textTh"><h4>태그</h4></td><td class="lpad">${place.place_tag }</td></tr>
			<tr><td class="bgcolor textTh"><h4>내용</h4></td><td class="lpad">${place.place_content }</td></tr>
		</table>	
	</div>
	<br>
	<hr>
	<div id="prevListDisp" style="margin-left: 9%; width: 81%;"></div>
	<br>
	<hr style="margin-left: 10%; width: 80%;">
	<div style="margin-left: 10%; width: 85%;">
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="place_num" value="${place.place_num }">
			<h3 class="text-primary"><b>평가글 작성</b></h3>
				<div style="margin-left:10%; color:red"><b>* 제목은 최대 10글자</b></div>
			<table style="margin-left:10%; margin-top: 2px; margin-bottom: 4px; width: 70%;">
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
					</td></tr>
					</table>
					<table style="margin-left:10%; margin-top: 0px; width: 68%;">
					<tr>
						<td align="center" style="width: 12%;" class="bgcolor">내용</td>
						<td style="padding-left: 10px;">
							<textarea rows="4" cols="60" name="prev_content" required="required"></textarea>
						</td>
						<td><input type="button" style="margin-left: 2%;" class="btn" value="등록" id="insertprev"></td>
					</tr>	
			</table>
		</form>
	</div>
	<div align="center">
		<input class="btn bgcolor" type="button" value="뒤로가기" onclick="history.back();">
		<c:if test="${not empty admin }">
			<input class="btn btn-danger" type="button" value="수정" onclick="update(${place.place_num})">
		</c:if>
	</div>
	
	<hr style="margin-left: 10%; width: 80%;">
</body>
</html>