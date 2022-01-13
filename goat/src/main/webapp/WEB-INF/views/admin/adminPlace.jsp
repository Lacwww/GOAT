<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pagination {
	justify-content: center;
}
</style>
<script type="text/javascript">
	function opn(place_num) {
		 window.open('/goat/place/prevDetailView.do?place_num='+place_num,"","");
	}
</script>
</head>
<body>
	<div>
		<h2>플레이스 목록</h2>
		<div>
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>플레이스명</th>
						<th>카테고리</th>
						<th class="w-30">주소</th>
						<th class="w-30">상세주소</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="place" items="${list }">
						<tr onclick="opn(${place.place_num})">
							<td class="align-middle">${place.place_num }</td>
							<td class="align-middle">${place.place_name }</td>
							<td class="align-middle">${place.place_cate }</td>
							<td class="align-middle">${place.place_addr }</td>
							<td class="align-middle">${place.place_addrd }</td>
							<td class="align-middle">${place.reg_date }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="clear: both;">
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