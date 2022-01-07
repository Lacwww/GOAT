<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function k1(place_num) {
		 window.open('../place/prevDetailView.do?place_num='+place_num,"","");
	}
</script>
</head>
<body>
	<div>
		<h2>플레이스 목록</h2>
		<div>
			<table>
				<tr>
					<th>번호</th>
					<th>플레이스명</th>
					<th>카테고리</th>
					<th>주소</th>
					<th>등록일</th>

				</tr>
				<c:forEach var="place" items="${list }">
					<tr>
						<td>${place.place_num }</td>
						<td><span onclick="k1(${place.place_num})">${place.place_name }</span></td>
						<td>${place.place_cate }</td>
						<td>${place.place_addr }</td>
						<td>${place.reg_date }</td>

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