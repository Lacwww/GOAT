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
.hotTrip {
	text-align: center;
	border: 1px solid black;
	margin: 15px;
	padding : 15px;
}
.hotTrip img {
	margin-bottom: 10px;
}
.hotLikeContainer {
	display: flex;
	margin : 0px auto;
	justify-content: center;
}
</style>
</head>
<body>
	<div align="center">
		<h2>여행 게시판</h2>
		<h4>좋아요 HOT 게시물<small>&nbsp;(*공감수 많은순)</small></h4>
		<div>
			<c:if test="${empty hotLike }">
				<i>공감수 집계중입니다.</i>
			</c:if>
			<c:if test="${not empty hotLike }">
				<div class="hotLikeContainer">
				<c:forEach var="hl" items="${hotLike }">
				<c:set var="i" value="${i+1}"></c:set>
					<div class="hotTrip">
						<img style="border-radius:10px; width: 140px; height: 140px;"
							onclick="location.href='tripView.do?t_num=${hl.t_num }&pageNum=${pb.currentPage }'" src="/goat/resources/tripPhoto/${i}.png">
						<div>제목 :  ${hl.t_title }</div>
						<div>작성자 : ${hl.m_name }</div>
					</div>
				</c:forEach>
				</div>
			</c:if>
		</div>
		
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
					<td colspan="5">등록된 여행이야기가 없습니다.</td>
				</tr>
			</c:if>
		</thead>
		<tbody>
			<c:if test="${not empty list}">
				<c:forEach var="trip2" items="${list }">
					<tr><td class="td1">${no}<c:set var="no" value="${no - 1}"></c:set></td>
						<c:if test="${trip2.del != 'y' }">
							<td class="td2"><a href="tripView.do?t_num=${trip2.t_num}&pageNum=${pb.currentPage}">${trip2.t_title}</a></td>
							<td class="td3">${trip2.m_name }</td>
							<td class="td4">${trip2.t_view }</td>
							<td class="td5">${trip2.reg_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="tripList.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="tripList.do?pageNum=${pb.startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage==i }">
						<li class="active"><a href="tripList.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage!=i }">
						<li><a href="tripList.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="tripList.do?pageNum=${pb.endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="tripList.do?pageNum=${pb.totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		
		<div>

		<form method="post" action="tripSearch.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="form-selectcate">
				<c:forTokens var="sh" items="t_title,t_content,subcon" delims="," varStatus="i">
					<c:if test="${sh==trip.search }">
						<option value="${sh}" selected="selected">${title[i.index]}</option>
					</c:if>
					<c:if test="${sh!=trip.search }">
						<option value="${sh}">${title[i.index]}</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" class="form-controllogin" value="${trip.keyword }" />
			<input type="submit" value="검색" class="btn btn-primary mar"/> 
		</form>
		</div>

		<div align="center">
			<c:if test="${not empty admin || not empty id }">
				<input type="button" value="게시글 입력" onclick="location.href='tripInsertForm.do?pageNum=1'">
			</c:if>
		</div>
	</div>
</body>
</html>