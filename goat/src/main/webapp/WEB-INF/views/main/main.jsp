<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h3 { margin: 10px; }
	h3:hover { cursor: pointer; }
</style>
</head>
<body>
<div class="container" align="center" style="height: 100%;">
	<div style="display: flex; height: 100px; align-items: center; float: right;">
		<c:if test="${empty id && empty admin}">
			<button style="height: 50px; width: 100px; margin: 20px;" class="btn btn-success" onclick="location.href='/goat/member/loginForm.do'">
				Login
			</button>
		</c:if>
		<c:if test="${not empty id || not empty admin}">
			<a href="/goat/member/myPage.do">
				<img title="MyPage" style = "border-radius:50%; float: right; margin: 20px;" src="/goat/resources/m_photo/${img }"  width="70px" height="70px" />
			</a>
			<button style="height: 50px; width: 100px; margin: 20px;" class="btn btn-success" onclick="location.href='/goat/member/logout.do'">
				Logout
			</button>
		</c:if>
	</div>
	<div align="center" style="display: flex; justify-content: center; height: 100%; align-items: center;">
		<h3 onclick="location.href='home.do'">
			<img alt="" src="${path }/resources/images/car1.png" width="40px" height="40px">
			Go On A Trip
			<img alt="" src="${path }/resources/images/car2.png" width="40px" height="40px">
		</h3>
	</div>
</div>
</body>
</html>
