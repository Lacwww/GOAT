<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
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
<style type="text/css">
#myPage a {
	text-decoration: none;
	color: #2F9D27;
	font-size: 2rem;
}

#myPage a:active {
	text-decoration: none;
}

#myPage a:hover {
	text-decoration: none;
	color: #FFCD12;
}

#myPage a:visited {
	text-decoration: none;
}

#myPage td {
	width: 11.1%;
	height: 70px;
	font-size: 15px;
}
</style>
</head>
<body id="page-top">
	<!-- Navigation-->
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
	<div class="container" align="center"
		style="width: 100%; height: 100%; display: flex; flex-direction: column; align-items: center; justify-content: center;">
		<h1 style="margin-bottom: 50px;">Admin Page</h1>
		<img alt="" src="${path }/resources/kwon_image/adminImage.jpg"
			id="preview" style="border-radius: 50%;" width="200px;"
			height="200px;">
		<h2>Admin</h2>
		<div style="width: 50%;">
			<table id="myPage">
				<tr>
					<td align="center"><a href="adminPlace.do?pageNum=1">플레이스
							목록</a></td>
					<td align="center"><a href="adminTempPlace.do">플레이스 등록 요청
							목록</a></td>
				</tr>
				<tr>
					<td align="center"><a href="adminSchedule.do?pageNum=1">스케줄
							목록</a></td>
					<td align="center"><a href="adminMember.do?pageNum=1">회원
							목록</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>