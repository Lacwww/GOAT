<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h3>고객문의 등록</h3>
		<form action="csInsert.do" method="post" name="frm">
			<input type="hidden" name="num" value="${num }"> 
			<input type="hidden" name="pageNum" value="${pageNum}"> 
			<input type="hidden" name="ref" value="${ref}"> 
			<input type="hidden" name="re_level" value="${re_level}"> 
			<input type="hidden" name="re_step" value="${re_step}">
			<input type="hidden" name="m_name" value="${member.m_name }">
			<input type="hidden" name="m_num" value="${member.m_num }">
			
			<table>
				<c:if test="${num == 0 }">
					<tr>
						<th>제목</th>
						<td><input type="text" name="cs_title" required="required"
							autofocus="autofocus"></td>
					</tr>
				</c:if>
				<c:if test="${num != 0 }">
					<tr>
						<th>제목</th>
						<td><input type="text" name="cs_title" required="required"
							autofocus="autofocus" value="답변글 ) "></td>
					</tr>
				</c:if>
				<tr>
					<th>작성자</th>
					<td>${member.m_name }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="80" name="cs_content"
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