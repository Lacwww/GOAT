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
	#key { transform: rotate(-42deg); }
	img { cursor: pointer; }
</style>
</head>
<body>
<div>
	<div style="display: flex; height: 100px; align-items: center; float: right; margin-right: 100px;">
		<c:if test="${empty id && empty admin}">
			<img id="key" title="login" style = "margin: 20px;" src="/goat/resources/images/key.png"
				onclick="location.href='/goat/member/loginForm.do'" width="50px" height="50px"/>
		</c:if>
		<c:if test="${not empty id || not empty admin}">
			<p style="margin: 20px;">
				<img title="MyPage" style = "border-radius:50%;" src="/goat/resources/m_photo/${img }"
					onclick="location.href='/goat/member/myPage.do'" width="70px" height="70px" />
			</p>
			<p style="margin: 20px;">
				<img title="logout" src="/goat/resources/images/unlock.png" width="30px" height="30px"
					onclick="location.href='/goat/member/logout.do'"/>
			</p>
		</c:if>
	</div>
	<div class="container" align="center" style="height: 100%;">
		<div align="center" style="display: flex; justify-content: center; height: 90%; align-items: center; width: 100%;">
			<h3 onclick="location.href='home.do'">
				<img alt="" src="${path }/resources/images/car1.png" width="40px" height="40px">
				Go On A Trip
				<img alt="" src="${path }/resources/images/car2.png" width="40px" height="40px">
			</h3>
		</div>
	</div>
</div>
</body>
</html>
