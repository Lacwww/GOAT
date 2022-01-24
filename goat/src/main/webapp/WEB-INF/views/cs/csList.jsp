<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tl {
	border-bottom: 1px solid black;
}

.td1, .td2, .td3, .td4, .td5 {
	height: 30px;
}
</style>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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
<script type="text/javascript">
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
<body>
<div style="display: flex; float: left;">
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main.home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link active" href="/goat/cs/csList.do">Service</a></li>
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
				</ul>
			</div>
		</div>
	</nav>
        </div>
	<section class="about-section text-center"
		style="background: linear-gradient(to bottom, rgba(21, 125, 138, 1) 0%, rgba(255, 255, 255, 0.7) 90%);">
	<div align="center">
		<h2>고객문의</h2>
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th class="tl">번호</th>
					<th class="tl">제목</th>
					<th class="tl">작성자</th>
					<th class="tl">조회수</th>
					<th class="tl">작성일</th>
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
						<tr>
							<td class="td1">${no}<c:set var="no" value="${no - 1}"></c:set></td>
							<c:if test="${cs2.del != 'y' }">
								<td class="td2"><c:if test="${cs2.cs_re_level > 0 }">
										<!-- 답변글 레벨당 10px들여 쓰기 -->
										<img alt="" src="${path}/resources/csImages/level.gif"
											height="5" width="${cs2.cs_re_level * 10 }">
										<img alt="" src="${path}/resources/csImages/reply.png"
											height="12" width="15">
									</c:if> <a
									href="csView.do?cs_num=${cs2.cs_num}&pageNum=${pb.currentPage}">${cs2.cs_title}</a>
								</td>
								<c:if test="${cs2.admin != 'y' }">
									<td class="td3">${cs2.m_name }</td>
								</c:if>
								<c:if test="${cs2.admin == 'y' }">
									<td class="td3">${cs2.m_nick }</td>
								</c:if>
								<td class="td4">${cs2.cs_view }</td>
								<td class="td5">${cs2.reg_date }</td>
							</c:if>
							<c:if test="${cs2.del == 'y' }">
								<td colspan="4" class="td2">관리자에 의해 삭제된 게시글입니다.</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div align="center">
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
		<div align="center">
			<input type="button" onclick="sessionChk()" value="게시글 입력">
		</div>
	</div>
	</section>
</body>
</html>