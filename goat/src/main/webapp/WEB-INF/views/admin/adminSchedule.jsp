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
		<h2>스케쥴 목록</h2>
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
		<div>
			<!-- 이전 -->
			<c:if test="${startPage > pagePerBlock }">
				<button class="btn btn-secondary"
					onclick="location.href='adminSchedule.do?pageNum=1'">처음으로</button>
			</c:if>
			<c:if test="${pageNum > 1}">
				<button class="btn btn-primary"
					onclick="location.href='adminSchedule.do?pageNum=${currentPage-1}'">이전</button>
			</c:if>
			<!-- 페이지 -->
			<c:if test="${endPage == 0}">
				<button class="btn btn-secondary" disabled="disabled">1</button>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage== i}">
					<button class="btn btn-secondary"
						onclick="location.href='adminSchedule.do?pageNum=${i}'"
						disabled="disabled">${i}</button>
				</c:if>
				<c:if test="${currentPage!= i }">
					<button class="btn btn-secondary"
						onclick="location.href='adminSchedule.do?pageNum=${i}'">${i}</button>
				</c:if>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${currentPage < totalPage}">
				<button class="btn btn-primary"
					onclick="location.href='adminSchedule.do?pageNum=${currentPage + 1}'">다음</button>
			</c:if>
			<!-- 보여줄 것이 남아있다 -->
			<c:if test="${endPage < totalPage }">
				<button class="btn btn-primary"
					onclick="location.href='adminSchedule.do?pageNum=${endPage+1}'">다음
					목록</button>
			</c:if>
		</div>
	</div>
</body>
</html>