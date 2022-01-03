<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<div align="center">
		<h2>고객문의</h2>
		<table>
			<tr>
				<th>번호1</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">처리할 고객문의가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="board2" items="${list }">
					<tr>
						<td>${no}<c:set var="no" value="${no - 1}"></c:set>
							<%-- ${board.num } --%></td>
						<c:if test="${board2.del=='y' }">
							<td colspan="4">삭제된 글입니다</td>
						</c:if>
						<c:if test="${board2.del!='y' }">
							<td title="${board2.content }"><c:if
									test="${board2.re_level > 0 }">
									<!-- 답변글 레벨당 10px들여 쓰기 -->
									<img alt="" src="resources/images/level.gif" height="5"
										width="${board2.re_level * 10 }">
									<img alt="" src="resources/images/re.gif">
								</c:if> <a
								href="view.do?num=${board2.num}&pageNum=${pb.currentPage}&keyword=${board.keyword}&search=${board.search}"
								class="btn btn-info btn-sm">${board2.subject}</a> <!-- 조회수가 50이 넘으면 hot표시 -->
								<c:if test="${board2.readcount > 50}">
									<img alt="" src="resources/images/hot.gif">
								</c:if></td>
							<td>${board2.writer }</td>
							<td>${board2.readcount }</td>
							<td>${board2.reg_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a
						href="list.do?pageNum=1&keyword=${board.keyword}&search=${board.search}">
							<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a
						href="list.do?pageNum=${pb.startPage-1}&keyword=${board.keyword}&search=${board.search}">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage==i }">
						<li class="active"><a
							href="list.do?pageNum=${i}&keyword=${board.keyword}&search=${board.search}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage!=i }">
						<li><a
							href="list.do?pageNum=${i}&keyword=${board.keyword}&search=${board.search}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a
						href="list.do?pageNum=${pb.endPage+1}&keyword=${board.keyword}&search=${board.search}">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a
						href="list.do?pageNum=${pb.totalPage}&keyword=${board.keyword}&search=${board.search}">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="list.do">
			<input type="hidden" name="pageNum" value="1">
			<!-- <select name="search">
		<option value="writer">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
	</select> -->
			<!--	varStatus의변수.count : 1부터
	        "         .index : 0부터 -->
			<select name="search">
				<c:forTokens var="sh" items="writer,subject,content,subcon"
					delims="," varStatus="i">
					<c:if test="${sh==board.search }">
						<option value="${sh}" selected="selected">${title[i.index]}</option>
					</c:if>
					<c:if test="${sh!=board.search }">
						<option value="${sh}">${title[i.index]}</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${board.keyword }">
			<input type="submit" value="확인">
		</form>
		<div align="center">
			<a href="csInsertForm.do?num=0&pageNum=1" class="btn btn-success">게시글
				입력</a>
		</div>
	</div>
</body>
</html>