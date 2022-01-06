<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.divtext>a {text-decoration: none; }
	.divtext>a:hover{color: #2F9D27; }
</style>
</head>
<body>
	<div class="container" align="center" style="height: 50%;">
		<div align="center" style="height: 100%; display: flex; justify-content:center; align-items: center;">
			<div>
				<h2 style="margin-bottom: 30px;">Find Password</h2>
			 	<form action="findPassResult.do?" method="post">
			 		<div style="background: gray; width: 300px; height: 100px;">LOGO</div>
			 		<div align="center">
			 			<input type="text" name="m_id" placeholder="ID" required="required" autofocus="autofocus">
			 		</div>
			 		<div align="center">
			 			<input type="email" name="m_email" placeholder="Email" required="required">
			 		</div>
			 		<div align="center">
			 			<input type="submit" value="Find Password" class="btn btn-success">
			 		</div>
			 		<div align="center" class="divtext">
		           		 <a href="findIdForm.do">아이디 찾기</a> | <a href="loginForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>
		        	</div>
			 	</form>
			 </div>
		</div>
	</div>
</body>
</html>