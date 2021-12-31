<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.password.value = "";
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h3>고객문의</h3>
		<form action="csInsert.do" method="post" name="frm"
			onsubmit="return chk()">
			<input type="hidden" name="num" value="${num }"> <input
					type="hidden" name="pageNum" value="${pageNum}"> <input
					type="hidden" name="ref" value="${ref}"> <input
					type="hidden" name="re_level" value="${re_level}"> <input
					type="hidden" name="re_step" value="${re_step}">
			<table>
				<c:if test="${num == 0 }">
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" required="required"
							autofocus="autofocus"></td>
					</tr>
				</c:if>
				<c:if test="${num != 0 }">
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" required="required"
							autofocus="autofocus" value="답변 ) "></td>
					</tr>
				</c:if>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" required="required"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" cols="40" name="content"
							required="required"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="문의하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>