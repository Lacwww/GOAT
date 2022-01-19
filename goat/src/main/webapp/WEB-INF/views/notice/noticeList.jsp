<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tl {
	border-bottom: 1px solid black;
}

.td1, .td2, .td3, .td4, .td5 {
	height: 30px;
}
</style>
</head>
<body>
	<div align="center">
		<h2>공지사항</h2>
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th class="tl">번호</th>
					<th class="tl">제목</th>
					<th class="tl">작성자</th>
					<th class="tl">조회수</th>
					<th class="tl">작성일</th>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">공지사항이 없습니다.</td>
					</tr>
				</c:if>
			</thead>
			<tbody>
				<c:if test="${not empty list}">
					<c:forEach var="notice2" items="${list }">
						<c:if test="${notice2.del != 'y' }">
							<tr>
								<td class="td1">${no}<c:set var="no" value="${no - 1}"></c:set></td>
								<td class="td2"><a
									href="noticeView.do?no_num=${notice2.no_num}&pageNum=${pb.currentPage}">${notice2.no_title}</a></td>
								<td class="td3">${notice2.m_nick }</td>
								<td class="td4">${notice2.no_view }</td>
								<td class="td5">${notice2.reg_date }</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="noticeList.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="noticeList.do?pageNum=${pb.startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage==i }">
						<li class="active"><a href="noticeList.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage!=i }">
						<li><a href="noticeList.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="noticeList.do?pageNum=${pb.endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="noticeList.do?pageNum=${pb.totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<div align="center">
			<c:if test="${not empty admin }">
				<input type="button" value="게시글 입력"
					onclick="location.href='noticeInsertForm.do?pageNum=1'">
			</c:if>
		</div>
	</div>
</body>
</html>