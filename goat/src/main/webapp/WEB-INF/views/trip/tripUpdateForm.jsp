<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.17.1/full/ckeditor.js"></script>
<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body>
	<div align="center">
		<h3>여행이야기 수정</h3><hr>
		<form action="tripUpdate.do?" method="post" name="frm">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="t_num" value="${trip.t_num}">
			
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="t_title" required="required"
						autofocus="autofocus" value="${trip.t_title }"></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td><c:if test="${not empty id && empty admin}">${member.m_name }</c:if>
						<c:if test="${not empty admin && empty id}">${adminInfo.m_name }</c:if></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
					<textarea class="form-control" name="t_content" id="t_content">${trip.t_content }</textarea>
					<script type="text/javascript">
 						CKEDITOR.replace('t_content'
 							, {filebrowserUploadUrl:'imageUpload.do'
                			, height: 500, width: 1000
                		 });
					</script>
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