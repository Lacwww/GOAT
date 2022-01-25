<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="../tool.jsp"%>
<%@	include file="../tool3.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainNav {position: fixed;}
</style>
<script type="text/javascript">
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode= 2;
			return false;
		}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){
			return false;
			}
		}
	document.onkeydown = noEvent;	
</script>
<script type="text/javascript">
	$(function() {
		$.post('/goat/member/chkAlert.do', "m_num=${m_num}", function(alert) {
			console.log(alert);
		});
	});
</script>
</head>
<body>
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav" style="margin-bottom: 0px;">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a id="active" class="nav-link active" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
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
<div style="margin-top: 10%;"></div>
<c:if test="${result > 0 }">
	<div align="center">
		<h3>플레이스 수정 건의가 완료되었습니다</h3>
		<h3>건의 내용은 마이페이지에서 확인 가능합니다</h3>
		<button class="btn" style="background-color: green; color:white;" onclick="location.href='${path}/member/myPage.do'">마이페이지</button>
		<button class="btn btn-warning" onclick="location.href='/goat/main/home.do#map'">메인</button>
		<button class="btn btn-primary" onclick="location.href='placeList.do'">플레이스</button>
	</div>	
</c:if>
<c:if test="${result == 0 }">
	<div align="center">
		<h3>플레이스 수정 건의에 실패하셨습니다</h3>
		<h4>플레이스 수정 건의에 자꾸 실패하실 경우 고객문의로 문의 바랍니다</h4>
		<button class="btn btn-danger" onclick="location.href='${path}/cs/csList.do'">고객문의</button>
		<button style="background-color: green; color:white;" onclick="location.href='updateFormTempPlace.do?place_num=${place_num}'">이전 플레이스 수정</button>
		<button class="btn btn-warning" onclick="location.href='/goat/main/home.do#map'">메인</button>
		<button class="btn btn-primary" onclick="location.href='placeList.do'">플레이스</button>
	</div>		
</c:if>
</body>
</html>