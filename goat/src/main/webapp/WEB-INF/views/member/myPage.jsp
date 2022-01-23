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
<style type="text/css">
	#myPage a { text-decoration: underline; color: #2F9D27; }
	#myPage a:active { text-decoration: none; }
	#myPage a:hover { text-decoration: none; color: #FFCD12; }
	#myPage a:visited { text-decoration: none; }
	#myPage td { width: 11.1%; height: 70px; font-size: 15px; cursor: pointer; }
</style>
<script type="text/javascript">
	/* 삭제 */
	function del(m_id) {
		var con = confirm("정말로 탈퇴하시겠습니까?");
		if (con) {
			location.href="delete.do?m_id=" + m_id;
		} else {
			alert("탈퇴가 취소되었습니다");
			return;
		}
	}
</script>
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
</head>
<body id="page-top">
<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Board</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link active" href="/goat/member/myPage.do">MyPage</a></li>						
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/admin/admin.do">AdminPage</a></li>						
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<section class="about-section text-center"
		style="background: linear-gradient(to bottom, rgba(21, 125, 138, 1) 0%, rgba(255, 255, 255, 0.7) 90%);">
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">My Page</h2>
			<img alt="" src="${path }/resources/m_photo/${member.m_photo }" id="preview"
				style = "border-radius:50%;" width="200px;" height="200px;">
		<h3>${member.m_id }</h3>
		<div style="width: 50%;">
			<table id="myPage">
				<tr>
					<td align="center">
						<a href="createPlaceList.do?m_num=${member.m_num }">Create Place</a>
					</td>
					<td align="center">
						<a href="bookmarkList.do?m_num=${member.m_num }">Bookmark Place</a>
					</td>
					<td align="center">
						<a href="myCsList.do?m_num=${member.m_num }">Customer Service</a>
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href="scheduleList.do?m_num=${member.m_num }">Schedule List</a>
					</td>
					<td align="center">
						<a href="tripList.do?m_num=${member.m_num }">Trip History</a>
					</td>
					<td align="center">
						<a href="updateForm.do?m_id=${member.m_id }">Member Update</a>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="Delete" class="btn btn-warning" onclick="del('${member.m_id}')">
					</td>
			</table>
		</div>
	</div>
	</section>
</body>
</html>