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
	display: block;
	text-align: center;
}

.pagination>li>a {
	float: none;
}

a {
	color: rgb(64, 123, 37);
}
.search {
	float: right;
}
</style>
<script type="text/javascript">
	var url="adminPlace.do?pageNum=1";
	function opn(place_num) {
		 window.open('/goat/place/prevDetailView.do?place_num='+place_num,"","");
	}
	function searchFunc() {

		var search = document.getElementById('search').value;
		location.href= url + "&search=" + search+"&cate=${cate}";
	}
	function onChange(cate) {
		url = cate;
		location.href=url;
	}
	
</script>
</head>
<body>
	<br><br>
	<div style="width:100%;">
		<h2 style="display: inline;">
			<a href="adminPlace.do?pageNum=1">플레이스 목록</a>
		</h2>
		<button class="btn pull-right" style="height: 30px;" onclick="location.href='admin.do'">돌아가기</button>
	</div>
	<br>
	<br>
	<div style="clear: both;">
		<select name="카테고리명" onchange="onChange(this.value)">
			<c:if test="${empty cate}">
				<option value="">선택하세요</option>
			</c:if>
			<c:if test="${not empty cate }">
				<option value="">${cate }</option>
			</c:if>
			<option value="adminPlace.do?pageNum=1">전체</option>
			<c:forEach var="cate" items="${cateList }">
				<option value="adminPlace.do?pageNum=1&cate=${cate.place_cate }">${cate.place_cate }</option>
			</c:forEach>
		</select>
		<button onclick="location.href='../place/adminInsertPlaceForm.do'">장소등록</button>
		<form class="search">
			<table>
				<tr>
					<td><input type="text" placeholder="카페, 갈치, 전복..."
						id="search" maxlength="100"></td>
					<td><input type="button" value="검색" onclick="searchFunc()" class="btn btn-success"></td>
			</table>
		</form>
		


		<br> <br>
		<div style="width: 100%;" class="div1">
			<table class="table table-hover table-striped">
				<!-- <table class="table table-hover table-striped"> -->
				<thead>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 15%">플레이스명</th>
						<th style="width: 10%">카테고리</th>
						<th style="width: 25%">주소</th>
						<th style="width: 25%">상세주소</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="place" items="${list }">
						<tr style="cursor: pointer;" onclick="opn(${place.place_num})">
							<td style="width: 5%;" class="align-middle">${place.place_num }</td>
							<td style="width: 15%" class="align-middle">${place.place_name }</td>
							<td style="width: 10%" class="align-middle">${place.place_cate }</td>
							<td class="align-middle">${place.place_addr }</td>
							<td class="align-middle">${place.place_addrd }</td>
							<td class="align-middle">${place.reg_date }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br> <br>
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