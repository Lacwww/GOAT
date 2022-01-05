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

	.star-rating{
		display: flex;
		flex-direction: row-reverse;
		font-size: 2.25rem;
		line-height: 2.5rem;
		justify-content: space-around;
		padding: 0 0.2em;
		text-align: center;
		width: 5em;
	}
	
	.star-rating input{
		display: none;
	}
	
	.star-rating label{
		-webkit-text-fill-color:transparent;
		-webkit-text-stroke-width:2.3px;
		-webkit-text-stroke-color:#2b2a29;
		cursor: pointer;
	}
	
	.star-rating:checked ~ label {
		-webkit-text-fill-color:red;
	}
	
	.star-rating label:hover,
	.star-rating lable:hover ~ label {
		-webkit-text-fill-color:pink;
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
			var sendData = $('#frm1').serialize();
			$.post('insertPrev.do', sendData, function(data) {
				alert("댓글이 작성 되었습니다.");
				$('#prevListDisp').html(data);
				frm1.prev_title.value = "";
				frm1.prev_content.value = "";	
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
							<select name="score">
								<option value="5" selected="selected">5</option>
								<option value="4">4</option>
								<option value="3">3</option>
								<option value="2">2</option>
								<option value="1">1</option>
							</select>
					<th><input type="button" value="등록" id="insertprev"></th>
					</tr>
				<tr><th>내용</th><th colspan="5">
				<textarea rows="4" cols="50" name="prev_content" required="required"></textarea></th></tr>
			</table>
		</form>
	</div>
</body>
</html>