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
	
	function noBack() {
		window.history.forward();
	}
	
	// 고객문의 삭제
	function delCs() {
		var con = confirm("고객문의 삭제하시겠습니까?");
		if(con) {
			location.href="noticeDelete.do?no_num=${notice.no_num}&pageNum=${pageNum}";
		}
	}
	
	function sessionChk() {
		if (${empty id && empty admin}) {
			alert("비회원은 댓글쓰기 권한이 없습니다.");
			location.href="${path}/member/loginForm.do";		
		}
	}
	
	$(function() {
		// 현재 게시글에 해당하는 댓글을 가져와서 보여줘라
		$('#nrListDisp').load('noticeReplyList.do?no_num=${notice.no_num}');
		$('#rInsert').click(function() {
			if(frm1.nor_content.value == "") {
				alert("댓글을 입력해주세요");
				frm1.nor_content.focus();
				return false;
			}
			// serialize() form의 모든값을 받을 수 있음
			var sendData = $('#frm1').serialize();
			$.post('rInsert.do?nor_num=0',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#nrListDisp').html(data);
				frm1.nor_content.value="";  // 작성했던 댓글 지우기
			});
		});
	});
</script>
<style type="text/css">
	.nav-link { tlist-style-type: none; }
	#mainNav {position: fixed;}
	#noticeTable td {width:0 auto; height: 70px; font-size: 15px; cursor: pointer; }
	.mainBody {margin-top: 150px; width: 60%; }
	thead, tbody, tfoot, tr, td, th { padding: 15px 0; }
	.about-section { padding-top:0px; padding-bottom: 30px; }
</style>
</head>
<body id="page-top">

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
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item "><a class="nav-link" id="active" href="/goat/notice/noticeList.do">Notice</a></li>
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
	
	<section class="about-section text-center mainBody" style="width: 65%; margin: auto; margin-top: 8%;">
	<div class="mainBody2" align="center">
		<h1 style="margin-bottom:35px; width:30%;">공지 사항 상세 조회</h1>
		<table id="noticeTable" style="width: 80%;">
			<tr>
				<th style="width:15%;">제목</th>
				<td style="width:50%;">${notice.no_title}</td>
				<th style="width:15%;">작성일</th>
				<td>${notice.reg_date}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${notice.m_nick}</td>
				<th>조회수</th>
				<td>${notice.no_view}</td>
			</tr>
			<tr style="height:30em; vertical-align: top;">
				<th>내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto; height: 50%;">${notice.no_content}</td>
			</tr>
			<tr align="center">
				<td colspan="4">
					<input type="button" class="btn btn-primary" onclick="location.href='noticeList.do?pageNum=${pageNum }'" value="게시글 목록">
				<c:if test="${not empty admin}">
					<input type="button" class="btn btn-danger" onclick="location.href='noticeUpdateForm.do?no_num=${notice.no_num}&pageNum=${pageNum }'" value="수정">
					<input type="button" class="btn btn-warning" onclick="delCs()" value="삭제">
				</c:if>
				</td>
			</tr>
		</table>
	</div>
	
		<div id="nrListDisp"></div>
	
	<div style="padding-top: 30px;">
		<!-- submit할 때 action이 없는 경우에는 자신(여기서는 view)를 한번 더 실행한다 -->
		<form action="" id="frm1" name="frm1">
			<input type="hidden" name="no_num" value="${notice.no_num }">
		<table class="table table-hover">
		<!-- 회원 게시판의 경우에는 회원이름 또는 회원별명 또는 회원 id -->
			<tr style="padding: 5px 0;"><th style="vertical-align : middle;">댓글</th><td><textarea rows="3" cols="100" name="nor_content"></textarea></td>
				<td style="vertical-align : middle;">
					<input type="button" style="background:#CEE3E6;" class="btn btn-outline-light" value="댓글입력" onclick="sessionChk()" id="rInsert"></td></tr>
		</table>	
		</form>
	</div>
	</section>
</body>
</html>