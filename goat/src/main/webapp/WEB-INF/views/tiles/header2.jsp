<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.navbar{
	height: 100px;
	background-color: rgb(64,123,37);
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-fixed-top">
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
					src="/goat/resources/kwon_image/bmw.jpg" width="150px" height="110"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/goat/schedule/selectArea.do">Schedule
							<span class="sr-only">(current)</span>
					</a></li>
					<li><a href="/goat/place/placeList.do">Place</a></li>
					<li><a href="/goat/cs/csList.do">Service</a></li>
					<li><a href="/goat/notice/noticeList.do">Notice</a></li>
					<li><a href="/goat/trip/tripList.do">Trip</a></li>

				</ul>


				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty id && empty admin }">
						<li><a href="/goat/member/loginForm.do">Login</a></li>
						<li><a href="/goat/member/joinForm.do">Join</a></li>
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li><a href="/goat/member/logout.do">Logout</a></li>
						<li><a href="/goat/admin/admin.do">AdminPage</a></li>
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<c:if
							test="${requestScope['javax.servlet.forward.request_uri'] == '/goat/member/myPage.do'||
								requestScope['javax.servlet.forward.request_uri'] == '/goat/member/updateForm.do'}">
							<li><a href="/goat/member/logout.do">Logout</a></li>
							<li><a href="/goat/member/myPage.do">MyPage</a></li>
						</c:if>
						<c:if
							test="${requestScope['javax.servlet.forward.request_uri'] != '/goat/member/myPage.do'&&
								requestScope['javax.servlet.forward.request_uri'] != '/goat/member/updateForm.do'}">
							<li><a href="/goat/member/logout.do">Logout</a></li>
							<li><a href="/goat/member/myPage.do"><img title="MyPage"
									style="border-radius: 50%;"
									src="${path }/resources/m_photo/${m_img }" width="70px"
									height="70px" /></a></li>
						</c:if>
					</c:if>
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
	</nav>
</body>
</html>