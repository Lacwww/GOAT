<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<%@ include file="../tool3.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>GOAT</title>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${path }/resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="${path }/resources/css/styles.css" />
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
	#mainNav {position: fixed;}
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
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
	})
	$(window).scroll(function(event) {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
	});
</script>
</head>
<body>
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav" style="margin-bottom: 0px;">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a id="active" class="nav-link active" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Trip</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/myPage.do"><img
								title="MyPage" style="border-radius: 50%;"
								src="/goat/resources/m_photo/${m_img }" width="70px"
								height="70px" /></a></li>						
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/admin/admin.do">AdminPage</a></li>						
					</c:if>
					<c:if test="${not empty id && empty admin }">
					<li class="nav-item">
						<ul class="dropdown">
							<c:if test="${empty alert}">
								<img src="/goat/resources/images/notice.png" title="notice" width="40px" height="40px">
							</c:if>
							<c:if test="${not empty alert }">
								<img data-toggle="dropdown" alt="" src="/goat/resources/images/notice2.png"
									title="notice" width="40px" height="40px">
								<ul class="dropdown-menu" role="menu" style="margin-top: 20px;">
									<c:forEach var="list" items="${alert }">
										<c:if test="${list.sch_num!=0 && list.day >= 0 && list.day < 8 && list.cs_num==0 && list.temp_num==0 && list.t_num==0}">
											<c:if test="${list.day == 0 }">
												<li role="presentation">
													<a role="menuitem" href="${path }/member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } 출발일입니다.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="${path }//member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }이 ${list.day}일 남았습니다.</a>
												</li>
											</c:if>
										</c:if>
										<c:if test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }에 대한 ${list.temp_crud } 요청이 
													<c:if test="${list.del == 'y' }">
														승인 완료되었습니다
													</c:if>
													<c:if test="${list.del == 'd' }">
														승인 거절되었습니다
													</c:if>
												</a>
											</li>
										</c:if>
										<c:if test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }에 답변이 달렸습니다 </a>
											</li>
										</c:if>
										<c:if test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
											<li role="presentation">
												<c:if test="${list.t_like==1 && list.t_reply==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 좋아요를 눌렀습니다 </a>
												</c:if>
												<c:if test="${list.t_reply==1 && list.t_like==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 댓글이 달렸습니다 </a>
												</c:if>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" align="center" style="width:100%; margin-top: 7%; display: flex; justify-content: center;">
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
	<div class="container" style="width: 48%;">
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
	<hr style="margin-left: 10%; width: 80%;">
	<div style="width: 100%; margin-left: 4%;" align="center">
		<h3 class="text-primary" style="margin-right:50%;"><b>장소 평가</b></h3>
	<div id="prevListDisp" align="center" style="width: 75%;"></div>
	</div>
	<br>
	<hr style="margin-left: 10%; width: 80%;">
	<div align="center">
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="place_num" value="${place.place_num }">
			<h3 class="text-primary" style="margin-right:30%;"><b>평가글 작성</b></h3>
				<div style="margin-right:20%; color:red"><b>* 제목은 최대 10글자</b></div>
			<table style="width: 35%;">
				<tr>
					<td align="center" style="width: 14.5%;"  class="bgcolor">제목</td><td style="width: 29.5%;">
						<input type="text" class="form-control" style="width: 90%; margin-left: 5%;" maxlength="10" name="prev_title" required="required"></td>
					<td align="center" style="width: 14%;"  class="bgcolor">평점</td><td>
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
					
			<table style="width:35%; margin-top: 2px;" >
					<tr>
						<td align="center" style="width: 15%;" class="bgcolor">내용</td>
						<td style="padding-left: 10px;">
							<textarea rows="4" cols="59" name="prev_content" required="required"></textarea>
						</td>
						<td><input style="float: right;" type="button" class="btn" value="등록" id="insertprev"></td>
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