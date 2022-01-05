<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center" style="height: 100%;">
	<div style="display: flex; height: 100px; align-items: center; float: right;">
		<c:if test="${empty id && empty admin}">
			<button style="height: 30px; width: 60px; margin-top: 20px;" class="btn btn-info" onclick="location.href='/goat/member/loginForm.do'">
				Login
			</button>
		</c:if>
		<c:if test="${not empty id || empty admin}">
			<a href="/goat/member/mypage.do">
				<img style = "border-radius:50%; float: right; margin: 20px;" src="/goat/resources/m_photo/${img }"  width="70px" height="70px" />
			</a>
			<button style="height: 50px; width: 100px; margin: 20px;" class="btn btn-info" onclick="location.href='/goat/member/logout.do'">
				Logout
			</button>
		</c:if>
	</div>
	<div align="center" style="display: flex; justify-content: center; height: 100%; align-items: center;">
		<button style="height: 40px;" class="btn btn-success" onclick="location.href='home.do'">
			Go On A Trip
		</button> 
	</div>
</div>
</body>
</html>
