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
	<div class="container" align="center">
		<h2>Join Us</h2>
		<div id="thumbnails"></div>
		<form action="login.do">
			<div>
				<input type="text" name="m_id" placeholder="ID" required="required" autofocus="autofocus">
			</div>
			<div>
				<input type="text" name="m_pass" placeholder="Password" required="required">
			</div>
			<div>
				<input type="text" name="m_pass2" placeholder="Password Confirm" required="required">
			</div>
			<div>
				<input type="email" name="m_email" placeholder="Email" required="required">
			</div>
			<div>
				<input type="text" name="m_name" placeholder="Name" required="required">
			</div>
			<div>
				<input type="tel" name="m_tel" placeholder="Tel" required="required">
			</div>
			<div>
				<input type="date" name="m_birth" placeholder="Birth" required="required">
			</div>
			<div>
				<input type="text" name="m_addr" placeholder="Address" required="required">
			</div>
			<div>
				<input type="text" name="m_addrd" placeholder="Address Detail" required="required">
			</div>
			<div>
				<input type="file" name="file" required="required">
			</div>
			<div>
				<input type="submit" value="확인">
			</div>
		</form>
	</div>
</body>
</html>