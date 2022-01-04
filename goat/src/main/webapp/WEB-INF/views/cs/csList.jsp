<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.tl { border-bottom: 1px solid black;}
</style>
</head>
<body>
	<div align="center">
		<h2>고객문의</h2>
		<table>
			<tr>
				<th class="tl">번호</th>
				<th class="tl">제목</th>
				<th class="tl">작성자</th>
				<th class="tl">조회수</th>
				<th class="tl">작성일</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">처리할 고객문의가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="cs2" items="${list }">
					<tr>
						<td>${cs2.cs_num}<c:set var="no" value="${no - 1}"></c:set>
							<%-- ${board.num } --%></td>

							<td title="${cs2.cs_title }">
							<c:if test="${cs2.cs_re_level > 0 }">
									<!-- 답변글 레벨당 10px들여 쓰기 -->
									<img alt="" src="resources/images/level.gif" height="5"
										width="${cs2.cs_re_level * 10 }">
									<img alt="" src="resources/images/re.gif">
								</c:if> <a
								href="csView.do?cs_num=${cs2.cs_num}&pageNum=${pb.currentPage}"
								class="btn btn-info btn-sm">${cs2.cs_title}</a> <!-- 조회수가 50이 넘으면 hot표시 -->
								<c:if test="${cs2.cs_view > 50}">
									<img alt="" src="resources/images/hot.gif">
								</c:if></td>
							<td>${member.m_name }</td>
							<td>${cs2.cs_view }</td>
							<td>${cs2.reg_date }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a
						href="csList.do?pageNum=1">
							<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a
						href="csList.do?pageNum=${pb.startPage-1}">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage==i }">
						<li class="active"><a
							href="csList.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage!=i }">
						<li><a
							href="csList.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a
						href="csList.do?pageNum=${pb.endPage+1}">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a
						href="csList.do?pageNum=${pb.totalPage}">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<div align="center">
			<a href="csInsertForm.do?cs_num=0&pageNum=1" class="btn btn-success">게시글
				입력</a>
		</div>
	</div>
</body>
</html>