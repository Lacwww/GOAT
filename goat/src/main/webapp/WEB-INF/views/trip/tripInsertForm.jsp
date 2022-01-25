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
#mainNav {
	position: fixed;
}

.mainBody {
	margin-top: 70px;
}
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
<script src="//cdn.ckeditor.com/4.17.1/full/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink');
		$('#active').addClass('active');
	});
	$(window).scroll(function(event) {
		$('#mainNav').addClass('navbar-shrink');
		$('#active').addClass('active');
	});
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body id="page-top">
	<div style="display: flex;">
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-light fixed-top"
			id="mainNav">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T
					LOGO</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					Menu
					<svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true"
						focusable="false" data-prefix="fas" data-icon="bars" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
						data-fa-i2svg="">
						<path fill="currentColor"
							d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg>
					<i class="fas fa-bars"></i> Font Awesome fontawesome.com
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
						<li class="nav-item"><a class="nav-link" id="active"
							href="/goat/trip/tripList.do">Trip</a></li>
						<c:if test="${empty id && empty admin }">
							<li class="nav-item"><a class="nav-link"
								href="/goat/member/loginForm.do">Login</a></li>
							<li class="nav-item"><a class="nav-link"
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
							<li class="nav-item"><a class="nav-link"
								href="/goat/admin/admin.do">AdminPage</a></li>
						</c:if>
						<c:if test="${not empty id && empty admin }">
							<li class="nav-item">
								<ul class="dropdown">
									<c:if test="${empty alert}">
										<img src="/goat/resources/images/notice.png" title="notice"
											width="40px" height="40px">
									</c:if>
									<c:if test="${not empty alert }">
										<img data-toggle="dropdown" alt=""
											src="/goat/resources/images/notice2.png" title="notice"
											width="40px" height="40px">
										<ul class="dropdown-menu" role="menu"
											style="margin-top: 20px;">
											<c:forEach var="list" items="${alert }">
												<c:if
													test="${list.sch_num!=0 && list.day >= 0 && list.day < 8 && list.cs_num==0 && list.temp_num==0 && list.t_num==0}">
													<c:if test="${list.day == 0 }">
														<li role="presentation"><a role="menuitem"
															href="${path }/member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }
																출발일입니다.</a></li>
													</c:if>
													<c:if test="${list.day != 0 }">
														<li role="presentation"><a role="menuitem"
															href="${path }//member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }이
																${list.day}일 남았습니다.</a></li>
													</c:if>
												</c:if>
												<c:if
													test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
													<li role="presentation"><a role="menuitem"
														href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }에
															대한 ${list.temp_crud } 요청이 <c:if
																test="${list.del == 'y' }">
														승인 완료되었습니다
													</c:if> <c:if test="${list.del == 'd' }">
														승인 거절되었습니다
													</c:if>
													</a></li>
												</c:if>
												<c:if
													test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
													<li role="presentation"><a role="menuitem"
														href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }에
															답변이 달렸습니다 </a></li>
												</c:if>
												<c:if
													test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
													<li role="presentation"><c:if
															test="${list.t_like==1 && list.t_reply==0}">
															<a role="menuitem"
																href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에
																좋아요를 눌렀습니다 </a>
														</c:if> <c:if test="${list.t_reply==1 && list.t_like==0}">
															<a role="menuitem"
																href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에
																댓글이 달렸습니다 </a>
														</c:if></li>
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
	</div>
	<section class="about-section text-center">
		<div class="mainBody" align="center">

			<h1>여행이야기 등록</h1>
			<br><br>
			<form action="tripInsert.do?" method="post" name="frm"
				enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<c:if test="${not empty id && empty admin }">
					<input type="hidden" name="m_num" value="${member.m_num }">
				</c:if>
				<c:if test="${empty id && not empty admin }">
					<input type="hidden" name="m_num" value="${adminInfo.m_num }">
				</c:if>

				<table>
					<tr style="height: 2.5em;">
						<th>제목</th>
						<td style="padding-left: 1em;"><input type="text" name="t_title" required="required"
							autofocus="autofocus"></td>
					</tr>

					<tr style="height: 2.5em;">
						<th>작성자</th>
						<td style="padding-left: 1em;"><c:if test="${not empty id && empty admin}">${member.m_name }</c:if>
							<c:if test="${not empty admin && empty id}">${adminInfo.m_name }</c:if></td>
					</tr>
					<tr>
						<th>내용</th>
						<td style="padding-left: 1em;"><textarea class="form-control" name="t_content"
								id="t_content"></textarea> <script type="text/javascript">
									CKEDITOR
											.replace(
													't_content',
													{
														filebrowserUploadUrl : 'imageUpload.do',
														height : 500,
														width : 1000
													});
								</script></td>
					</tr>
					<tr>
						<td style="height: 5em;" align="center" colspan="2"><input class="btn btn-primary" type="submit"
							value="등록하기"> <input class="btn btn-danger" type="button" value="취소"
							onclick="location.href='tripList.do?pageNum=${pageNum}'"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
</html>