<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
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
	#noticeTable td { width: 11.1%; height: 70px; font-size: 15px; cursor: pointer; }
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
</head>
<body>
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
						<li class="nav-item"><a class="nav-link" href="#signup"><img
								title="MyPage" style="border-radius: 50%;"
								src="/goat/resources/m_photo/${m_img }" width="70px"
								height="70px" /></a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/admin/admin.do">AdminPage</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<div align="center">
		<h2 class="text-primary">공지 사항 상세 조회</h2>
		<table id="noticeTable">
			<tr>
				<th>제목</th>
				<td>${notice.no_title}</td>
				<th>작성자</th>
				<td>${notice.m_nick}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${notice.no_view}</td>
				<th>작성일</th>
				<td>${notice.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto;">${notice.no_content}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
				<c:if test="${not empty admin}">
					<a href="noticeUpdateForm.do?no_num=${notice.no_num}&pageNum=${pageNum }" class="btn btn-success">수정</a>
					<input type="button" onclick="delCs()" class="btn btn-danger" value="삭제">
				</c:if>
				</td>
			</tr>
		</table>
	</div>
	<div id="nrListDisp"></div>
	<!-- submit할 때 action이 없는 경우에는 자신(여기서는 view)를 한번 더 실행한다 -->
	<div>
		<form action="" id="frm1" name="frm1">
			<input type="hidden" name="no_num" value="${notice.no_num }">
		<table class="table table-hover">
		<!-- 회원 게시판의 경우에는 회원이름 또는 회원별명 또는 회원 id -->
			<tr><th>댓글</th><td><textarea rows="3" cols="100" name="nor_content"></textarea></td>
				<td><input type="button" value="댓글입력" onclick="sessionChk()" id="rInsert"></td></tr>
		</table>	
		</form>
	</div>
	
</body>
</html>