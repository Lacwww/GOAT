<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body>
	<div align="center">
		<h3>공지사항 수정</h3><hr>
		<form action="noticeUpdate.do?" method="post" name="frm">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="no_num" value="${notice.no_num}">
			
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="no_title" required="required"
						autofocus="autofocus" value="${notice.no_title }"></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${adminInfo.m_name }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
					<textarea rows="10" cols="80" name="no_content"
							required="required" id="no_content">${notice.no_content }</textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>