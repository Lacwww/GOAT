<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
			if (frm.m_pass.value != frm.m_pass2.value) {
				alert("암호와 암호 확인이 다릅니다");
				frm.m_pass2.focus();
				frm.m_pass2.value = "";
				return false;
			}
		}
</script>
</head>
<body>
	<div class="container" align="center" style="height: 50%;">
		<div align="center" style="height: 100%; display: flex; justify-content:center; align-items: center;">
			<div>
				<h2 style="margin-bottom: 30px;">Update Password</h2>
		 		<div style="background: gray; width: 300px; height: 100px;">LOGO</div>
				<div align="center">
					<form action="updatePassResult.do" method="post" name="frm" onsubmit="return chk()">
						<input type="hidden" name="m_id" value="${member.m_id }">
						<div class="divtext" align="center">
							<input type="password" name="m_pass" required="required" autofocus="autofocus" placeholder="New Password">
						</div>
						<div class="divtext" align="center">
				            <input type="password" name="m_pass2"required="required" placeholder="New Password Confirm">
				        </div>
						<div class="divtext" align="center">
				            <input type="submit" value="Find Pass" class="btn btn-success">
				        </div>
		       		</form>
				</div>
				<div class="divtext" align="center" style="margin-top: 20px;">
					<a href="findIdForm.do">아이디 찾기</a> | <a href="loginForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>