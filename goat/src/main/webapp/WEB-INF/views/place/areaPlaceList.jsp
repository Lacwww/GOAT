<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
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
<link href="${path }/resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
#sch {
	margin-bottom: 80px;
}

.area {
	width: 23%;
	height: 30%;
	float: left;
	position: relative;
	padding: 10px;
}

.area img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 7px;
}

.desc {
	padding-top: 10%;
	padding-bottom: 10%;
	height: 30%;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	background-color: #5e5a5a;
	opacity: 0.8;
	position: relative;
	bottom: 29%;
	color: #ffffff;
	border-radius: 7px;
}

	.btn1 {
	background-color: rgb(64,123,37);
	color: white;
	}
	.btn1:hover {
		background-color: rgb(114,201,75);
	}
	#mainNav {position: fixed;}
</style>
<script type="text/javascript">
	$(function() {
		$('#MoaModal .modal-content').load("placeModal.do?place_num=1");
		$('#MoaModal').modal();
	});

	function modal(place_num) {
		$('#MoaModal .modal-content').load("placeModal.do?place_num=" + place_num);
		$('#MoaModal').modal();
	}
	
	function insertPlace() {
		if(${not empty admin}){
			alert("관리자는 플레이스 등록을 할 수 없습니다.");
			return false;
		}else if(${empty id}){
			alert("로그인 후 이용가능합니다");
			return false;
		}
		location.href='insertFormTempPlace.do';
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
<body id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav" style="margin-bottom: 0px;">
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
													<a role="menuitem" href="/member/alertSch.do?ale_num${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } 출발일입니다.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="/member/alertSch.do?ale_num${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }이 ${list.day}일 남았습니다.</a>
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
	
<div align="center" style="margin-top: 10%;"><h2><b>${place.place_area }</b></h2></div>
<c:if test="${not empty place.place_areadetail }">
	<div align="center"><h3><b>- ${place.place_areadetail } -</b></h3></div>
</c:if>
<form action="areaPlaceList.do">
	<input type="hidden" name="pageNum" value="1">
	<input type="hidden" name="place_area" value="${place_area }">
	<input type="hidden" name="place_areadetail" value="${place.place_areadetail }">
	<div align="center">
		<select class="form-control" style="width: 6%; text-align:center; display: inline;" name="search">
		<c:if test="${searchPoint == 0}">
			<option>전체</option>
			<option value="관광지">관광지</option>
			<option value="숙소">숙소</option>
			<option value="음식점">음식점</option>
		</c:if>
		<c:if test="${searchPoint == 1 }">
			<option>전체</option>
			<option value="관광지" selected="selected">관광지</option>
			<option value="숙소">숙소</option>
			<option value="음식점">음식점</option>
		</c:if>
		<c:if test="${searchPoint == 2 }">
			<option>전체</option>
			<option value="관광지">관광지</option>
			<option value="숙소" selected="selected">숙소</option>
			<option value="음식점">음식점</option>
		</c:if>
		<c:if test="${searchPoint == 3 }">
			<option>전체</option>
			<option value="관광지">관광지</option>
			<option value="숙소">숙소</option>
			<option value="음식점" selected="selected">음식점</option>
		</c:if>

		</select>
		<input type="text" class="form-control" style="width: 20%; display: inline;" name="keyword" value="${place.keyword }">
		<input type="submit" class="btn btn1" value="검색">
	</div>
</form>

<div align="center">
	<input type="button" class="btn btn1" value="플레이스 등록" onclick="insertPlace()">
</div>
<div align="center">
<c:if test="${empty list }">
	<h2 align="center">지역에 해당하는 장소가 없습니다.</h2>
</c:if>
<c:if test="${not empty list }">
		<div class="container" align="center" style="width: 90%; ">
			<c:forEach var="place" items="${list }">
			<div class="area" onclick="modal('${place.place_num}')" style="margin-left: 1%;">
				<div class="areaPhoto">
						<img alt="${place.place_name }" src="${place.place_photo }">	
				</div>
					<div class="desc">${place.place_name }</div>
			</div>
			</c:forEach>
		</div>
</c:if>	
</div>	
	
<div align="center" style="clear: both;">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${startPage > pagePerBlock }">
			<li><a href="areaPlaceList.do?pageNum=1&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a href="areaPlaceList.do?pageNum=${startPage-1}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==i }">
				<li class="active"><a href="areaPlaceList.do?pageNum=${i}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">${i}</a></li>
			</c:if>
			<c:if test="${currentPage!=i }">
				<li><a href="areaPlaceList.do?pageNum=${i}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${endPage < totalPage }">
			<li><a href="areaPlaceList.do?pageNum=${endPage+1}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="areaPlaceList.do?pageNum=${totalPage}&place_area=${place_area }&keyword=${place.keyword}&place_areadetail=${place.place_areadetail}&search=${place.search}">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>

	<!-- 장소모달 -->
	<div class="modal fade" id="MoaModal" tabindex="-1" role="dialog"
		aria-labelledby="historyModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document" style="margin-top: 10%;">
			<div class="modal-content" ></div>
		</div>
	</div>
</body>
</html>