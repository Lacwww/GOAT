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
		<h2 class="text-primary">게시글 상세 조회</h2>
		<table>
			<tr>
				<th>제목</th>
				<td>${cs.cs_title}</td>
				<th>작성자</th>
				<td>${member.m_name}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${cs.cs_view}</td>
				<th>작성일</th>
				<td>${cs.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto;">${cs.cs_content}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<a href="csList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a> 
					<a href="csInsertForm.do?cs_num=${cs.cs_num}&pageNum=${pageNum }" class="btn btn-success">답변등록</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>