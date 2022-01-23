<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NaNumSquare@1.0/nanumsquare.css">
<style type="text/css">
h3 {
	margin: 10px;
}

h3:hover {
	cursor: pointer;
}

#key {
	transform: rotate(-42deg);
}

img {
	cursor: pointer;
}

body {
	font-family: 'NanumSquare', sans-serif;
}

.normal {
	font-weight: 400
}

.bold {
	font-weight: 700
}

.bolder {
	font-weight: 800;
	font-size: 12rem;
}

.light {
	font-weight: 300
}
#button {
	width: 280px;
	height: 70px;
	background-color: rgb(64,123,37);
	color: white;
}
#button:hover {
	background-color: rgb(114,201,75);
}
</style>
</head>
<body>
	<div
		style="display: flex; width: 90%; height: 10%; align-items: center; justify-content: flex-end;">
		<c:if test="${empty id && empty admin}">
			<img id="key" title="login" style="margin: 20px;"
				src="/goat/resources/images/key.png"
				onclick="location.href='/goat/member/loginForm.do'" width="50px"
				height="50px" />
		</c:if>
		<c:if test="${not empty id || not empty admin}">
			<p style="margin: 20px;">
				<img title="MyPage" style="border-radius: 50%;"
					src="/goat/resources/m_photo/${m_img }"
					onclick="location.href='/goat/member/myPage.do'" width="70px"
					height="70px" />
			</p>
			<p style="margin: 20px;">
				<img title="logout" src="/goat/resources/images/unlock.png"
					width="30px" height="30px"
					onclick="location.href='/goat/member/logout.do'" />
			</p>
		</c:if>
	</div>
	<div>
		<div class="container" align="center" style="height: 90%;">
			<div align="center"
				style="display: flex; justify-content: center; height: 90%; align-items: center; width: 100%; flex-direction: column;">
				<div>
					<h3 >여행 스케줄링 플래너 Going On A Trip</h3>
				</div>
				<div>
					<h1 class="bolder">G.O.A.T</h1>
				</div>
				<br><br>
				<button type="button" id="button" class="btn btn-lg" onclick="location.href='home.do#page-top'">들어가기</button>
			</div>
		</div>
	</div>
</body>
</html>
