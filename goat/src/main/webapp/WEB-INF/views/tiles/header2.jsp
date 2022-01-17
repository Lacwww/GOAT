<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	padding-top: 100px;
}

.navbar {
	background-color: white;
	font-size: 2rem;
}

element.style {
	align-content: center;
}
li a {
	color: green;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/goat/main/home.do"><img
					src="/goat/resources/kwon_image/bmw.jpg" width="100px"
					height="70px"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" style="margin-left: 5%; margin-right: 5%;"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"
					style="display: flex; align-content: center; flex-wrap: wrap; overflow: auto; width: 45%; height: 100px; text-align: center;">
					<li class="active" style="width: 20%"><a
						href="/goat/schedule/selectArea.do">Schedule <span
							class="sr-only">(current)</span>
					</a></li>
					<li style="width: 20%"><a href="/goat/place/placeList.do">Place</a></li>
					<li style="width: 20%"><a href="/goat/cs/csList.do">Service</a></li>
					<li style="width: 20%"><a href="/goat/notice/noticeList.do">Notice</a></li>
					<li style="width: 20%"><a href="/goat/trip/tripList.do">Trip</a></li>

				</ul>


				<ul class="nav navbar-nav"
					style="display: flex; align-content: center; flex-wrap: wrap; overflow: auto; width: 20%; height: 100px; text-align: center;
							margin-left: 25%;">
					<c:if test="${empty id && empty admin }">
						<li style="width: 50%"><a href="/goat/member/loginForm.do">Login</a></li>
						<li style="width: 50%"><a href="/goat/member/joinForm.do">Join</a></li>
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li style="width: 50%"><a href="/goat/member/logout.do">Logout</a></li>
						<li style="width: 50%"><a href="/goat/admin/admin.do">AdminPage</a></li>
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<c:if
							test="${requestScope['javax.servlet.forward.request_uri'] == '/goat/member/myPage.do'||
								requestScope['javax.servlet.forward.request_uri'] == '/goat/member/updateForm.do'}">
							<li style="width: 50%"><a href="/goat/member/logout.do">Logout</a></li>
							<li style="width: 50%"><a href="/goat/member/myPage.do">MyPage</a></li>
						</c:if>
						<c:if
							test="${requestScope['javax.servlet.forward.request_uri'] != '/goat/member/myPage.do'&&
								requestScope['javax.servlet.forward.request_uri'] != '/goat/member/updateForm.do'}">
							<li style="width: 50%"><a href="/goat/member/logout.do">Logout</a></li>
							<li style="width: 50%"><a href="/goat/member/myPage.do"><img title="MyPage"
									style="border-radius: 50%;"
									src="${path }/resources/m_photo/${m_img }" width="70px"
									height="70px" /></a></li>
						</c:if>
					</c:if>

				</ul>
				<ul class="nav navbar-nav navbar-right"
					style="display: flex; align-content: center; flex-wrap: wrap; overflow: auto; width: 5%; height: 100px; text-align: center;">
					<c:if test="${empty alert}">
						<li><a href="#"><img
								src="/goat/resources/images/notice.png" title="notice"
								width="40px" height="40px"></a></li>
					</c:if>
					<c:if test="${not empty alert }">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="menu" aria-haspopup="true"
							aria-expanded="false"><img data-toggle="dropdown" alt=""
								src="/goat/resources/images/notice2.png" title="notice"
								width="40px" height="40px"><span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="list" items="${alert }">
									<c:if
										test="${not empty list.sch_name||empty list.temp_num||empty list.cs_num}">
										<li role="presentation"><a role="menuitem" href="#">${id }님의
												${list.sch_name }이 </a></li>
									</c:if>
									<c:if
										test="${not empty list.temp_num||empty list.sch_name||empty list.cs_num}">
										<li role="presentation"><a role="menuitem" href="#">${id }님의
												${list.temp_name }에 대한 ${list.crud } 요청이 <c:if
													test="${list.del == 'y' }">
													승인 완료되었습니다
												</c:if> <c:if test="${list.del == 'd' }">
													승인 거절되었습니다
												</c:if>
										</a></li>
									</c:if>
									<c:if
										test="${not empty list.cs_num||empty list.sch_name||empty list.temp_num}">
										<li role="presentation"><a role="menuitem" href="#">${id }님의
												${list.cs_title }에 답변이 달렸습니다 </a></li>
									</c:if>
								</c:forEach>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
</body>
</html>