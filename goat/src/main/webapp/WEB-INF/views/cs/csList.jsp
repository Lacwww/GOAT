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
	.tl { border-bottom: 1px solid black; }
	.td1, .td2, .td3, .td4, .td5 { height: 30px; }
	#mainNav {position: fixed;}
	.mainBody { margin-top: 70px; width: 60%; }
	
	.pagination { font-family: "Roboto", sans-serif; }
	.pagination li a { border-radius:0 !important; color:#333 !important; }
	.pagination li.active a { color:#fff !important; background:#444 !important; border-color:#444 !important; }
	
	.table > thead > tr > th, 
	.table > tbody > tr > th, 
	.table > tfoot > tr > th, 
	.table > thead > tr > td, 
	.table > tbody > tr > td, 
	.table > tfoot > tr > td { padding: 8px 0;}
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
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink');
		$('#active').addClass('active');
	});
	$(window).scroll(function(event) {
		$('#mainNav').addClass('navbar-shrink');
		$('#active').addClass('active');
	});
	function sessionChk() {
		if (${empty id && empty admin}) {
			alert("고객문의는 로그인후 이용할 수 있습니다");
			location.href="${path}/member/loginForm.do";		
		} else {
			location.href="csInsertForm.do?cs_num=0&pageNum=1";
		} 
	}
</script>
</head>
<body id="page-top">
<div style="display: flex;">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><i class="fas fa-bars"></i> Font Awesome fontawesome.com
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" id="active" href="/goat/cs/csList.do">Service</a></li>
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
        </div>
	<section class="about-section text-center" style="display: flex; justify-content: center;">
	<div class="mainBody" align="center">
	
		<h1 style="margin-bottom:35px;">Customer Service</h1>
		
		<table class="table table-hover" style="margin-bottom:30px;">
			<thead>
				<tr style="background: #CEE3E6;">
					<th class="tl" style="width:8%; text-align: center;">번호</th>
					<th class="tl" style="width:40%;">제목</th>
					<th class="tl" style="width:8%; text-align:center;">작성자</th>
					<th class="tl" style="width:8%; text-align: center;">조회수</th>
					<th class="tl" style="width:13%; text-align: center;">작성일</th>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">처리할 고객문의가 없습니다.</td>
					</tr>
				</c:if>
			</thead>
			<tbody>
				<c:if test="${not empty list}">
					<c:forEach var="cs2" items="${list }">
					<c:if test="${cs2.del != 'y' }">
						<tr onclick="location.href='csView.do?cs_num=${cs2.cs_num}&pageNum=${pb.currentPage}'">
					</c:if>
					<c:if test="${cs2.del == 'y' }">
						<tr>
					</c:if>
							<td class="td1" style="text-align: center;">${no}<c:set var="no" value="${no - 1}"></c:set></td>
							<c:if test="${cs2.del != 'y' }">
								<td class="td2"><c:if test="${cs2.cs_re_level > 0 }">
										<!-- 답변글 레벨당 10px들여 쓰기 -->
										<img alt="" src="${path}/resources/csImages/level.gif"
											height="5" width="${cs2.cs_re_level * 10 }">
										<img alt="" src="${path}/resources/csImages/reply.png"
											height="12" width="15">
									</c:if>${cs2.cs_title}
								</td>
								<c:if test="${cs2.admin != 'y' }">
									<td class="td3" style="text-align: center;">${cs2.m_name }</td>
								</c:if>
								<c:if test="${cs2.admin == 'y' }">
									<td class="td3" style="text-align: center;">${cs2.m_nick }</td>
								</c:if>
								<td class="td4" style="text-align: center;">${cs2.cs_view }</td>
								<td class="td5" style="text-align: center;">${cs2.reg_date }</td>
							</c:if>
							<c:if test="${cs2.del == 'y' }">
								<td colspan="4" class="td2"><b>관리자에 의해 삭제된 게시글입니다.</b></td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div style="display: flex; justify-content: center; margin-bottom:15px; font-size: 15px;" >
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="csList.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="csList.do?pageNum=${pb.startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage==i }">
						<li class="active"><a href="csList.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage!=i }">
						<li><a href="csList.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="csList.do?pageNum=${pb.endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="csList.do?pageNum=${pb.totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<div align="center" style="font-size: 15px;">
			<input type="button" class="btn btn-primary" onclick="sessionChk()" value="문의하기">
		</div>
		</div>
	</section>
	
		<div>
			<button type="button" class="btn btn-primary">Primary</button>
					<button type="button" class="btn btn-secondary">Secondary</button>
					<button type="button" class="btn btn-success">Success</button>
					<button type="button" class="btn btn-danger">Danger</button>
					<button type="button" class="btn btn-warning">Warning</button>
					<button type="button" class="btn btn-info">Info</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-dark">Dark</button>
					<button type="button" class="btn btn-link">Link</button>
		</div>
		<div>
			<button type="button" class="btn btn-outline-primary">Primary</button>
			<button type="button" class="btn btn-outline-secondary">Secondary</button>
			<button type="button" class="btn btn-outline-success">Success</button>
			<button type="button" class="btn btn-outline-danger">Danger</button>
			<button type="button" class="btn btn-outline-warning">Warning</button>
			<button type="button" class="btn btn-outline-info">Info</button>
			<button type="button" class="btn btn-outline-light">Light</button>
			<button type="button" class="btn btn-outline-dark">Dark</button>
		</div>
		<div>
			<p><button type="button" class="btn btn-primary">Button</button></p>
		<p><button type="button" class="btn btn-secondary btn-lg">Button large</button></p>
		<p><button type="button" class="btn btn-success btn-sm">Button Small</button></p>
		<p><button type="button" class="btn btn-danger btn-block">Button Block</button></p>
		</div>
</body>
</html>