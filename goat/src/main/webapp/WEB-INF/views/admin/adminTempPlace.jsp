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
		<h2>플레이스 등록 요청 목록</h2>
		<div>
			<table>
				<tr>
					<th>번호</th>
					<th>플레이스명</th>
					<th>카테고리</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>요청일</th>
					<th>요청유형</th>
					<th>상세보기</th>
				</tr>
				<c:forEach var="temp" items="${list }">
					<tr>
						<td>${temp.temp_num }</td>
						<td>${temp.temp_name }</td>
						<td>${temp.temp_cate }</td>
						<td>${temp.temp_addr }</td>
						<td>${temp.temp_addrd }</td>
						<td>${temp.reg_date }</td>
						<td>${temp.temp_crud }</td>
						<td>상세보기</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div align="center" style="clear: both;">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${startPage > pagePerBlock }">
					<li><a href="adminPlace.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="adminPlace.do?pageNum=${startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==i }">
						<li class="active"><a href="adminPlace.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage!=i }">
						<li><a href="adminPlace.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${endPage < totalPage }">
					<li><a href="adminPlace.do?pageNum=${endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminPlace.do?pageNum=${totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>