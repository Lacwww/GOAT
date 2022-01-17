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
	<div>
		<h2 style="color: rgb(64,123,37);">스케쥴 목록</h2>
		<br><br>
		<div>
			<table>
				<tr>
					<th>번호</th>
					<th>스케쥴명</th>
					<th>출발일</th>
					<th>도착일</th>
					<th>회원명</th>
				</tr>
				<c:forEach var="schedule" items="${list }">
					<tr>
						<td>${schedule.sch_num }</td>
						<td>${schedule.sch_name }</td>
						<td>${schedule.s_date }</td>
						<td>${schedule.e_date }</td>
						<td>${schedule.m_name }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br><br>
		<div align="center" style="clear: both;">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${startPage > pagePerBlock }">
					<li><a
						href="adminSchedule.do?pageNum=1">
							<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a
						href="adminSchedule.do?pageNum=${startPage-1}">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==i }">
						<li class="active"><a
							href="adminSchedule.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage!=i }">
						<li><a
							href="adminSchedule.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${endPage < totalPage }">
					<li><a
						href="adminSchedule.do?pageNum=${endPage+1}">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a
						href="adminSchedule.do?pageNum=${totalPage}">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>