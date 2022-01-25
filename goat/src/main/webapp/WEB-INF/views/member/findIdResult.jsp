<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOAT</title>
</head>
<body>
	<div class="container" align="center" style="height: 50%;">
		<div align="center" style="height: 100%; display: flex; justify-content:center; align-items: center;">
			<div>
				<h2 style="margin-bottom: 30px;">Find ID</h2>
		 		<div style="background: gray; width: 300px; height: 100px;">LOGO</div>
			 	<c:if test="${result == 1 }">
					<div align="center">
						<h2>
							<span style="color:blue; font-style:italic;">${member.m_name }</span>님의 아이디는 
							<span style="color:blue; font-style:italic;">${member.m_id }</span> 입니다.
						</h2>
					</div>
					<div class="divtext" align="center" style="margin-top: 20px;">
						<a href="findPassForm.do">비밀번호 찾기</a> | <a href="loginForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>
					</div>
				</c:if>
				<c:if test="${result == -1 }">
					<div align="center">
						<h2>등록된 정보가 없습니다</h2>
					</div>
					<div class="divtext" align="center" style="margin-top: 20px;">
			           	<a href="findIdForm.do">아이디 찾기</a> | <a href="loginForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>
			       	</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>