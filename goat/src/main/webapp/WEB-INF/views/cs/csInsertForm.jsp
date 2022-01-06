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
		<form action="csInsert.do?cs_num=${cs_num}" method="post" name="frm">
			<input type="hidden" name="cs_num" value="${cs_num }"> 
			<input type="hidden" name="pageNum" value="${pageNum}"> 
			<input type="hidden" name="cs_ref" value="${ref}"> 
			<input type="hidden" name="cs_re_level" value="${re_level}"> 
			<input type="hidden" name="cs_re_step" value="${re_step}">
		<c:if test="${not empty id}">
			<input type="hidden" name="m_num" value="${member.m_num }">
		</c:if>
		<c:if test="${not empty admin}">
			<input type="hidden" name="m_num" value="${adminInfo.m_num }">
		</c:if>		
			
			<table>
				<c:if test="${cs_num == 0 }">
					<tr>
						<th>제목</th>
						<td><input type="text" name="cs_title" required="required"
							autofocus="autofocus"></td>
					</tr>
				</c:if>
				<c:if test="${cs_num != 0 }">
						<tr>
							<th>제목</th>
							<td><input type="text" name="cs_title" required="required"
								autofocus="autofocus" value="답변등록 ) "></td>
						</tr>
				</c:if>
				<tr>
					<th>작성자</th>
					<td><c:if test="${not empty id}">${member.m_name }</c:if>
						<c:if test="${not empty admin}">${adminInfo.m_nick }</c:if></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
					<c:if test="${empty content }">
					<textarea rows="10" cols="80" name="cs_content"
							required="required" id="cs_content"></textarea></c:if>
					<c:if test="${not empty content }">
					<textarea rows="10" cols="80" name="cs_content"
							required="required" id="cs_content">${content }
							&#10;----------------------------------&#10;😃답변내용😃&#10;</textarea>
					</c:if>		
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="문의하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>