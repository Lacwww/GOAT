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
	.mainBody {margin-top: 70px; width: 60%; margin: auto;}
	table { width: 100%; margin-top: 3%;}
	tr { width: 100%;}
	.about-section p { margin-bottom: 0px;}
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
	
	// 여행이야기 삭제
	function delTrip() {
		var con = confirm("등록한 여행이야기를 삭제하시겠습니까?");
		if(con) {
			location.href="tripDelete.do?t_num=${trip.t_num}&pageNum=${pageNum}";
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
		$('#trListDisp').load('tripReplyList.do?t_num=${trip.t_num}');
		$('#trInsert').click(function() {
			if(frm1.tre_content.value == "") {
				alert("댓글을 입력해주세요");
				frm1.tre_content.focus();
				return false;
			}
			// serialize() form의 모든값을 받을 수 있음
			var sendData = $('#frm1').serialize();
			$.post('trInsert.do?tre_num=0',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#trListDisp').html(data);
				frm1.tre_content.value="";  // 작성했던 댓글 지우기
			});
		});
	});
 	
  	function tripLike(t_num) {
		if(${empty id && empty admin}){
			alert("로그인 후 이용가능합니다");
			location.href="${path}/member/loginForm.do";
			return false;
		}
		if(${not empty admin}) {
			alert("관리자는 공감 버튼이 막혀있습니다.");
			return false;
		}
		
		$.post("tripLike.do", "t_num="+t_num, function(data) {
			var likeYesOrNo = '${tripLikeImgSrc}'; //현재 사용자가 공감이 되어있는지 아닌지 확인
            if(likeYesOrNo.indexOf('full') == -1){
               var cnt = 0; // 공감 안했던거면 0으로 보내고
            }else{
               var cnt = 1; // 공감을 했으면 1로 보내고
            }
            var tripLikeImgSrc = data;
            if(tripLikeImgSrc.indexOf('full') == -1 && cnt == 0){ // full이라는 글씨가 있으면, full이라는 글자의 인덱스를 반환하기 때문에
                                           // 0포함  0보다 큰 수가 나옴
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt});
               var del = '${tripLikeCnt}';
            }else if(tripLikeImgSrc.indexOf('full') > -1 && cnt == 0){
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt + 1});
            }else if(tripLikeImgSrc.indexOf('full') == -1 && cnt == 1){              
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt -1});
               var del = '${tripLikeCnt - 1}';
            }else if(tripLikeImgSrc.indexOf('full') > -1 && cnt == 1){
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt});
            }
            if(del == 0){
               $('#likeSpan').empty();
            }
            $(".tlChk").attr("src", tripLikeImgSrc);
		});
	}; 
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
	<section class="about-section text-center mainBody" style="margin-top: 80px;">
	<div class="mainBody2" align="center">
	
		<h1>여행 이야기 조회</h1>
		<table>
			<tr style="height: 3em;">
				<th style="width: 10%;">제목</th>
				<td style="width: 50%;">${trip.t_title}</td>
				<th style="width: 10%;">작성자</th>
				<td style="width: 30%;">${trip.m_name}</td>
			</tr>
			<tr style="height: 3em;">
				<th>조회수</th>
				<td>${trip.t_view}</td>
				<th>작성일</th>
				<td>${trip.reg_date}</td>
			</tr>
			<tr>
				<th style="vertical-align : top;">내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto;">${trip.t_content}</td>
			</tr>
			<tr align="center">
				<td colspan="4">
				<c:if test="${empty keyword }">
					<c:if test="${prevUrl == 'member' }">
						<input type="button" class="btn btn-primary"
							onclick="location.href='${path }/member/tripList.do?m_num=${m_num }'" value="게시글 목록">
					</c:if>
					<c:if test="${prevUrl != 'member' }">
						<input type="button" class="btn btn-primary"
							onclick="location.href='tripList.do?pageNum=${pageNum }'" value="게시글 목록">
					</c:if>
				</c:if>
				<c:if test="${not empty keyword }">
					<c:if test="${prevUrl == 'member' }">
						<input type="button" class="btn btn-primary"
							onclick="location.href='${path }/member/tripList.do?m_num=${m_num }'" value="게시글 목록">
					</c:if>
					<c:if test="${prevUrl != 'member' }">
						<input type="button" class="btn btn-primary"
							onclick="location.href='tripSearch.do?pageNum=${pageNum }&search=${search}&keyword=${keyword}'" value="게시글 목록">
					</c:if>
				</c:if>
					
				<c:if test="${m_num == trip.m_num || not empty admin}">
					<input type="button" class="btn btn-warning"
						onclick="location.href='tripUpdateForm.do?t_num=${trip.t_num}&pageNum=${pageNum }'" value="수정">
					<input type="button" class="btn btn-danger"	onclick="delTrip()" value="삭제">
				</c:if>
				</td>
			</tr>
		</table>
	</div>

	<!-- 좋아요(추천수) -->
	<div style="text-align: center; margin: 20px;">
		<img style="border-radius : 10px; width: 40px;" class="tlChk" 
			onclick="tripLike(${trip.t_num})" src="${tripLikeImgSrc}">
		<c:if test="${tripLikeCnt == 0}">
			<span style="font-size: 20px;">공감</span><span id="likeSpan"></span>
		</c:if>
		<c:if test="${tripLikeCnt != 0}">
			<span style="font-size: 20px;">공감</span><span id="likeSpan">:${tripLikeCnt}</span>
		</c:if>
	</div>
	
	<div id="trListDisp"></div>
	<!-- submit할 때 action이 없는 경우에는 자신(여기서는 view)를 한번 더 실행한다 -->
	<div>
		<form action="" id="frm1" name="frm1">
			<input type="hidden" name="t_num" value="${trip.t_num }">
		<table class="table table-hover">
		<!-- 회원 게시판의 경우에는 회원이름 또는 회원별명 또는 회원 id -->
			<tr><th>댓글</th><td><textarea rows="3" cols="100" name="tre_content"></textarea></td>
				<td><input type="button" value="댓글입력" onclick="sessionChk()" id="trInsert"></td></tr>
		</table>	
		</form>
	</div>
	</section>	
</body>
</html>