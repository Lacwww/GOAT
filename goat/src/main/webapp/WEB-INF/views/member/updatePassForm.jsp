<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
			if (frm.m_pass.value != frm.m_pass2.value) {
				alert("암호와 암호 확인이 다릅니다");
				frm.m_pass2.focus();
				frm.m_pass2.value = "";
				return false;
			}
		}
</script>
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
	})
</script>
<style type="text/css">
	.data { width: 20%; height: 35px; margin: 10px; font-size: 15px; }
	.divtext>a {text-decoration: none; }
	.divtext>a:hover{color: #2F9D27; }
	.divtext { display: flex; justify-content: space-evenly; width: 25%; }
</style>
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
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive" style="display: flex !important;">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Trip</a></li>
					<li class="nav-item"><a id="active" class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
				</ul>
			</div>
		</div>
	</nav>
	<section class="about-section text-center"
		style="background: linear-gradient(to bottom, rgba(21, 125, 138, 1) 0%, rgba(255, 255, 255, 1) 90%); height: 100%;">
	<div class="container" align="center" style="height: 100%;">
		<div align="center" style="height: 100%; display: flex; justify-content:center; align-items: center;">
			<div style="width: 100%;">
				<h2 style="margin-bottom: 50px;">Update Password</h2>
				<div align="center">
					<form action="updatePassResult.do" method="post" name="frm" onsubmit="return chk()">
						<input type="hidden" name="m_id" value="${member.m_id }">
						<div align="center">
							<input type="password" name="m_pass" required="required" autofocus="autofocus" placeholder="New Password" class="data">
						</div>
						<div align="center">
				            <input type="password" name="m_pass2"required="required" placeholder="New Password Confirm" class="data">
				        </div>
						<div align="center">
				            <input type="submit" value="Find Pass" class="btn btn-success" style="margin: 10px; width: 145.5px;">
				        </div>
		       		</form>
				</div>
				<div class="divtext" align="center">
					<a href="findIdForm.do">아이디 찾기</a> | <a href="loginForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
</html>