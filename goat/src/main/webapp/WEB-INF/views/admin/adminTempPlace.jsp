<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.class
=
</style>
<script type="text/javascript">
	function opn(temp_num) {
		 window.open('/goat/place/tempDetailView.do?temp_num='+temp_num,"","");
	}
</script>
</head>
<body>
	<div>
		<h2 style="color: rgb(64,123,37);">플레이스 등록 요청 목록</h2>
		<br><br>
		<div>
			<table class="table">
				<colgroup>
					<col width="5%" />
					<col/>
					<col/>
					<col/>
					<col/>
					<col/>
					<col/>
				<thead>
					<tr>
						<th width="50">번호</th>
						<th>플레이스명</th>
						<th>카테고리</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>요청일</th>
						<th>요청유형</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="temp" items="${list }">
						<tr>
							<td>${temp.temp_num }</td>
							<td><span onclick="opn(${temp.temp_num})">${temp.temp_name }</span></td>
							<td>${temp.temp_cate }</td>
							<td>${temp.temp_addr }</td>
							<td>${temp.temp_addrd }</td>
							<td>${temp.reg_date }</td>
							<td>${temp.temp_crud }</td>
							<td>${temp.del }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br><br>
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