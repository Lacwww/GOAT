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
		var n = parseInt($num});
		var cn = parseInt(frm.confirmNum.value);
		if(n != cn) {
			alert("인증번호가 일치하지 않습니다. 메일을 다시 확인해주세요.");
			$('#confirmNum').val("");
			$('#confirmNum').focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center" style="height: 100%;">
 		<div style="background: gray; width: 300px; height: 100px;">LOGO</div>
	 	<c:if test="${result == 1 }">
			<div align="center">
				<form action="updatePassForm.do" method="post" name="frm" onsubmit="return chk()">
				 	<input type="hidden" name="m_id" value="${member.m_id}">
					<div class="divtext" align="center"> <!-- 인증번호 -->
						<input type="text" name="confirmNum" placeholder="인증번호를 입력해주세요" required="required" autofocus="autofocus">
					</div>
					<div class="divtext" align="center"> <!-- 인증번호 입력 -->
			            <input type="submit" value="Find Pass" class="btn btn-success">
			        </div>
        		</form>
			</div>
			<div class="divtext" align="center" style="margin-top: 20px;">
				<a href="findIdForm.do">아이디 찾기</a> | <a href="loginForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>
			</div>
		</c:if>
		<c:if test="${result == -1 }">
			<div align="center">
				<h2>등록된 정보가 없습니다</h2>
			</div>
			<div class="divtext" align="center" style="margin-top: 20px;">
	           	<a href="findPassForm.do">다시 찾기</a> | <a href="findIdForm.do">아이디 찾기</a> | <a href="joinForm.do">회원가입</a>
	       	</div>
		</c:if>
	</div>
</body>
</html>