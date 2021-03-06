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
	#mainNav {position: fixed;}
	.mainBody {
		margin-top: 70px;
		width: 60%; 
		margin: auto;
	}
	.tl {
		border-bottom: 1px solid black;
	}
	
	.td1, .td2, .td3, .td4, .td5 {
		height: 30px;
	}
	.hotTrip {
		width : 250px;
		text-align: center;
		border-radius: 10px; 
		border: 1px solid black;
		margin: 15px;
		padding : 15px;
	}
	.hotTrip img {
		margin-bottom: 10px;
	}
	.hotLikeContainer {
		display: flex;
		margin : 0px auto;
		justify-content: center;
	}
	svg {
		vertical-align: middle;
	}
	
	.pagination { font-family: "Roboto", sans-serif; }
	.pagination li a { border-radius:0 !important; color:#333 !important; }
	.pagination li.active a { color:#fff !important; background:#444 !important; border-color:#444 !important; }
	
	.form-selectcate	{ height : 40px;} 
	.form-controllogin	{ height : 40px;} 
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
			alert("???????????? ????????? ??? ????????????");
			location.href="${path}/member/loginForm.do";
		} else {
			location.href="tripInsertForm.do?pageNum=1";
		} 
	}
</script>
</head>
<body id="page-top">
<div style="display: flex;">
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" id="active" href="/goat/trip/tripList.do">Trip</a></li>
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
													<a role="menuitem" href="${path }/member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } ??????????????????.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="${path }//member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }??? ${list.day}??? ???????????????.</a>
												</li>
											</c:if>
										</c:if>
										<c:if test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }??? ?????? ${list.temp_crud } ????????? 
													<c:if test="${list.del == 'y' }">
														?????? ?????????????????????
													</c:if>
													<c:if test="${list.del == 'd' }">
														?????? ?????????????????????
													</c:if>
												</a>
											</li>
										</c:if>
										<c:if test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }??? ????????? ??????????????? </a>
											</li>
										</c:if>
										<c:if test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
											<li role="presentation">
												<c:if test="${list.t_like==1 && list.t_reply==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }??? ???????????? ??????????????? </a>
												</c:if>
												<c:if test="${list.t_reply==1 && list.t_like==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }??? ????????? ??????????????? </a>
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
	<section class="about-section text-center" style="display: flex; justify-content: center; margin-top: 70px;">
	<div class="mainBody" align="center">
		<h1>Trip</h1>
		<h4>????????? HOT ?????????<small>&nbsp;(*????????? ?????????)</small></h4>
		<div>
			<c:if test="${empty hotLike }">
				<i>????????? ??????????????????.</i>
			</c:if>
			<c:if test="${not empty hotLike }">
				<div class="hotLikeContainer">
				<c:forEach var="hl" items="${hotLike }">
				<c:set var="i" value="${i+1}"></c:set>
					<div class="hotTrip">
						<img style="width: 140px; height: 140px;"
							onclick="location.href='tripView.do?t_num=${hl.t_num }&pageNum=${pb.currentPage }'" src="/goat/resources/tripPhoto/${i}.png">
						<div style="font-size: 15px;">?????? :  ${hl.t_title }</div>
						<div style="font-size: 15px;">????????? : ${hl.m_name }</div>
					</div>
				</c:forEach>
				</div>
			</c:if>
		</div>
		
		<table class="table table-hover">
		<thead>
			<tr style="background: #CEE3E6;">
				<th class="tl" style="width:8%; text-align: center;">??????</th>
				<th class="tl" style="width:40%;">??????</th>
				<th class="tl" style="width:8%; text-align: center;">?????????</th>
				<th class="tl" style="width:8%; text-align: center;">?????????</th>
				<th class="tl" style="width:13%; text-align: center;">?????????</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">????????? ?????????????????? ????????????.</td>
				</tr>
			</c:if>
		</thead>
		<tbody>
			<c:if test="${not empty list}">
				<c:forEach var="trip2" items="${list }">
						<c:if test="${trip2.del != 'y' }">
						<tr onclick="location.href='tripView.do?t_num=${trip2.t_num}&pageNum=${pb.currentPage}'" style="cursor: pointer;">
							<td class="td1" style="text-align: center;">${no}<c:set var="no" value="${no - 1}"></c:set></td>
							<td class="td2">${trip2.t_title}</td>
							<td class="td3" style="text-align: center;">${trip2.m_name }</td>
							<td class="td4" style="text-align: center;">${trip2.t_view }</td>
							<td class="td5" style="text-align: center;">${trip2.reg_date }</td>
						</tr>
						</c:if>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		<div style="display: flex; justify-content: center;">
			<ul class="pagination">
				<!-- ?????? ???????????? pagePerBlock?????? ?????? ?????? ????????? ?????? ?????? -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="tripList.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="tripList.do?pageNum=${pb.startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage==i }">
						<li class="active"><a href="tripList.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage!=i }">
						<li><a href="tripList.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- ????????? ?????? ???????????? ???????????? endPage?????? totalPage??? ????????? -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="tripList.do?pageNum=${pb.endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="tripList.do?pageNum=${pb.totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		
		<div>

		<form method="post" action="tripSearch.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="form-selectcate" style="font-size: 15px;">
				<c:forTokens var="sh" items="t_title,t_content,subcon" delims="," varStatus="i">
					<c:if test="${sh==trip.search }">
						<option value="${sh}" selected="selected">${title[i.index]}</option>
					</c:if>
					<c:if test="${sh!=trip.search }">
						<option value="${sh}">${title[i.index]}</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" class="form-controllogin" value="${trip.keyword }" style="font-size: 15px;"/>
			<input type="submit" value="??????" class="btn btn-primary mar" style="font-size: 13px; height: 40px; margin-bottom: 5px;"/> 
		</form>
		</div>
		
		<div align="center" style="font-size: 15px;">
			<input type="button" class="btn btn-primary" onclick="sessionChk()" value="????????? ??????">
		</div>
	</div>
	</section>
</body>
</html>