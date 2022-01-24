<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#cpList { margin: 0px; }
	#cpList tr { width: 100%; }
</style>
<script type="text/javascript">
	/* 삭제 */
	function del(temp_num, m_num, del) {
		if (del == 'c') {
			alert("취소된 건의입니다");
			return;
		} else if (del == 'y') {
			alert("완료된 건의입니다");
			return;
		} else {
			var con = confirm("정말로 취소하시겠습니까?");
			if (con) {
				location.href="cpDelete.do?temp_num=" + temp_num + '&m_num=' + m_num;
			} else {
				alert("건의 취소가 취소되었습니다");
				return;
			}	
		}
	}
	function updateSuggestion(temp_num) {
		var con = confirm("수정하시겠습니까?");
		if(con){
			location.href="/goat/place/updateFormSuggestion.do?temp_num=" + temp_num;
		}
	}
</script>
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
	})
</script>
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
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive" style="display: flex !important;">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Board</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a id="active" class="nav-link" href="/goat/member/myPage.do"><img
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
	<div class="container" align="center" style="width: 100%; height: 100%; padding-top: 200px;">
		<h1 style="margin-bottom: 50px;">Create Place</h1>
		<table class="table" id="cpList">
			<tr style="width: 100%;">
				<td align="center">
					번호
				</td>
				<td align="center">
					이름
				</td>
				<td align="center">
					분류
				</td>
				<td align="center">
					주소
				</td>
				<td align="center">
					상세 주소
				</td>
				<td align="center">
					요청
				</td>
				<td align="center">
					요청 일자
				</td>
				<td align="center">
					처리 상태
				</td>
				<td align="center">
					수정
				</td>
				<td align="center">
					삭제
				</td>
			</tr>
			<c:if test="${empty place }">
				<tr>
					<td colspan="10">
						건의한 플레이스 내역이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty place }">
				<c:forEach var="list" items="${place }">
					<tr>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_num }</a>
						</td>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }</a>
						</td>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_cate }</a>
						</td>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_addr }</a>
						</td>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_addrd }</a>
						</td>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_crud }</a>
						</td>
						<td align="center">
							<a href="${path }/place/tempDetailView.do?temp_num=${list.temp_num }&place_num=${list.place_num}">${list.reg_date }</a>
						</td>
						<td align="center">
							<c:if test="${list.del=='n' }">
								처리 중
							</c:if>
							<c:if test="${list.del=='y' }">
								승인 완료
							</c:if>
							<c:if test="${list.del=='d' }">
								승인 거부
							</c:if>
							<c:if test="${list.del=='c' }">
								건의 취소
							</c:if>
						</td>
						<td align="center">
						<c:if test="${list.del == 'n' }">
							<button class="btn btn-success btn-sm" onclick="updateSuggestion('${list.temp_num}')">수정</button>
						</c:if>	
						</td>
						<td align="center">
						<c:if test="${list.del == 'n' }">
							<button class="btn btn-warning btn-sm" onclick="del('${list.temp_num}', '${list.m_num }', '${list.del }')">취소</button>
						</c:if>	
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>