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
	.mainBody {margin-top: 70px; width: 60%; }
	thead, tbody, tfoot, tr, td, th { padding: 8px 0; }
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
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body id="page-top">
	<div style="display: flex;">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T</a>
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
	
		<c:if test="${not empty id && empty admin }">
			<h1 style="margin-bottom:35px;">고객문의 등록</h1>
			<i style="color:red; font-size: 12px;">* 한번 작성된 고객문의는 삭제 불가능합니다.<br>
								게시판 특성과 맞지 않는 게시물 또는 관련성 없는 비방성 글은
								사전 통보없이 관리자의 임의적인 판단으로 삭제됩니다.</i>
		</c:if>
		<c:if test="${empty id && not empty admin }">
			<h1 style="margin-bottom:35px;">고객문의 답변</h1>
		</c:if>
		
		<form action="csInsert.do?cs_num=${cs_num}" method="post" name="frm">
			<input type="hidden" name="cs_num" value="${cs_num }"> 
			<input type="hidden" name="pageNum" value="${pageNum}"> 
			<input type="hidden" name="cs_ref" value="${ref}"> 
			<input type="hidden" name="cs_re_level" value="${re_level}"> 
			<input type="hidden" name="cs_re_step" value="${re_step}">
		<c:if test="${not empty id && empty admin }">
			<input type="hidden" name="m_num" value="${member.m_num }">
		</c:if>
		<c:if test="${empty id && not empty admin }">
			<input type="hidden" name="m_num" value="${adminInfo.m_num }">
		</c:if>		
			<table style="margin-bottom: 30px;">
				<c:if test="${cs_num == 0 }">
					<tr>
						<th style="width:15%;">제목</th>
						<td><input type="text" name="cs_title" required="required"
							autofocus="autofocus" size="50"></td>
					</tr>
				</c:if>
				<c:if test="${cs_num != 0 }">
						<tr>
							<th style="width:15%;">제목</th>
							<td><input type="text" name="cs_title" required="required"
								autofocus="autofocus" value="✔ )  답변등록" size="50"></td>
						</tr>
				</c:if>
				<tr>
					<th>작성자</th>
					<td><c:if test="${not empty id && empty admin}">${member.m_name }</c:if>
						<c:if test="${not empty admin && empty id}">${adminInfo.m_name }</c:if></td>
				</tr>
				<tr style="vertical-align: top;">
					<th>내용</th>
					<td>
					<c:if test="${empty content }">
					<textarea rows="20" cols="80" name="cs_content"
							required="required" id="cs_content"></textarea></c:if>
					<c:if test="${not empty content }">
					<textarea rows="20" cols="80" name="cs_content"
							required="required" id="cs_content">제목)${title }&#10;내용)${content }&#10;---------------------------------------------------&#10;😃답변내용😃&#10;&#10;&#10;&#10;추가 문의사항은 새로운 게시글을 통해 해주세요^^</textarea>
					</c:if>		
					</td>
				</tr>
				</table>
				
				<div align="center" style="font-size: 15px;">
					<c:if test="${not empty id && empty admin }">
						<input type="submit" class="btn btn-primary" value="문의하기">
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<input type="submit" class="btn btn-primary" value="답변하기">
					</c:if>
					<c:if test="${cs_num == 0 }">
						<input type="button" class="btn btn-warning" onclick="location.href='csList.do?pageNum=${pageNum}'" value="취소">
					</c:if>
					<c:if test="${cs_num != 0 }">
						<input type="button" class="btn btn-warning" onclick="location.href='csView.do?cs_num=${cs_num }&pageNum=${pageNum}'" value="취소">
					</c:if>
				</div>
		</form>
	</div>
	</section>
</body>
</html>