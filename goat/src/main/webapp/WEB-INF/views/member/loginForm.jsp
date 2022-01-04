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
	<div class="container" align="center" style="height: 100%;">
	 	<form action="login.do" method="post">
	 		<div style="background: gray; width: 300px; height: 100px;">LOGO</div>
	 		<div align="center">
	 			<input type="text" name="m_id" placeholder="ID" required="required" autofocus="autofocus">
	 		</div>
	 		<div align="center">
	 			<input type="password" name="m_pass" placeholder="Password" required="required">
	 		</div>
	 		<div align="center">
	 			<input type="submit" value="Login" class="btn btn-success">
	 		</div>
	 		<div align="center" class="divtext">
           		 <a href="findIdForm.do">아이디 찾기</a> | <a href="findPassForm.do">비밀번호 찾기</a> | <a href="joinForm.do">회원가입</a>
        	</div>
	 	</form>
	</div>
</body>
</html>