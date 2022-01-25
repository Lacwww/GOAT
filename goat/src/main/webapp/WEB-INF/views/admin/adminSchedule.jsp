<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOAT</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
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
<style>
.pagination {
	display: block;
	text-align: center;
}

.pagination>li>a {
	float: none;
}

a {
	color: rgb(64, 123, 37);
	text-decoration: none;
	font-famliy:'NanumSquare',san-serif;
}
#graybutton {
	background-color: rgb(166,166,166, 0.5);

}
</style>
<script type="text/javascript">
$(function() {
	$('#mainNav').addClass('navbar-shrink')
	$('#active').addClass('active')
})
</script>
</head>
<body id="page-top">
<nav
		class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T
				LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/goat/trip/tripList.do">Trip</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link"
							href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="/goat/member/joinForm.do">Join</a></li>
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<li class="nav-item"><a class="nav-link"
							href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/goat/member/myPage.do"><img title="MyPage"
								style="border-radius: 50%;"
								src="/goat/resources/m_photo/${m_img }" width="70px"
								height="70px" /></a></li>
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li class="nav-item"><a class="nav-link"
							href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a id="active" class="nav-link active"
							href="/goat/admin/admin.do">AdminPage</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div style="padding-top: 10%; padding-left: 15%; width: 85%">
		<br> <br>
		<div align="center" style="width: 100%;">
			<h1>
				<a style="font-size: 3rem;" href="adminSchedule.do">스케쥴 목록</a>
			</h1>
			<button id="graybutton" class="btn pull-right" style="font-size: 1.2rem; font-weight: bold; color: white;"
				onclick="location.href='admin.do'">돌아가기</button>
		</div>
		<br> <br>
		<div style="padding-top: 5%;">
			<table style=""class="table table-hover table-striped">
				<thead>
					<tr>
						<th style="width: 7%; text-align: center;">번호</th>
						<th style="width: 40%">스케쥴명</th>
						<th style="width: 10%">출발일</th>
						<th style="width: 10%">도착일</th>
						<th style="width: 10%">회원명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="schedule" items="${list }">
						<tr>
							<td style="text-align: center;">${schedule.sch_num }</td>
							<td>${schedule.sch_name }</td>
							<td>${schedule.s_date }</td>
							<td>${schedule.e_date }</td>
							<td>${schedule.m_name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br> <br>
		<div style="clear: both;">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${startPage > pagePerBlock }">
					<li><a href="adminSchedule.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="adminSchedule.do?pageNum=${startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==i }">
						<li style="font-size: 1.5rem; font-weight: bold;" class="active"><a href="adminSchedule.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage!=i }">
						<li style="font-size: 1.5rem; font-weight: bold;"><a href="adminSchedule.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${endPage < totalPage }">
					<li><a href="adminSchedule.do?pageNum=${endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminSchedule.do?pageNum=${totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>