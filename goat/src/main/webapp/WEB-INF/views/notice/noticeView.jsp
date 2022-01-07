<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 고객문의 삭제
	function delCs() {
		var con = confirm("고객문의 삭제하시겠습니까?");
		if(con) {
			location.href="noticeDelete.do?no_num=${notice.no_num}&pageNum=${pageNum}";
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h2 class="text-primary">공지 사항 상세 조회</h2>
		<table>
			<tr>
				<th>제목</th>
				<td>${notice.no_title}</td>
				<th>작성자</th>
				<td>${notice.m_nick}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${notice.no_view}</td>
				<th>작성일</th>
				<td>${notice.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto;">${notice.no_content}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
				<c:if test="${not empty admin}">
					<a href="noticeInsertForm.do?no_num=${notice.no_num}&pageNum=${pageNum }" class="btn btn-success">수정</a>
					<input type="button" onclick="delCs()" class="btn btn-danger" value="삭제">
				</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>