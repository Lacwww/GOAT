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
	border: 1px solid black;
}
</style>
</head>
<body>
	<div align="center">
		<h2>여행게시판</h2>
		<h4>추천수 HOT 게시물</h4>
		<span class="hotTrip">1
		<%-- 	<img style="border-radius:10px; width: 40px;"
				onclick="location.href='tripView.do?t_num=0&pageNum=${pageNum }'" src=""> --%></span>
		<span class="hotTrip">2</span>
		<span class="hotTrip">3</span>
		
		<c:forTokens var="sh" items="t_title,t_content,subcon" delims="," varStatus="i">
			<c:if test="${!title[0] }">
				<h4>"${title[i.index] }"에 "${keyword }" 단어가 포함된 결과</h4>
			</c:if>
		</c:forTokens>
		<table>
			<tr>
				<th class="tl">번호</th>
				<th class="tl">제목</th>
				<th class="tl">작성자</th>
				<th class="tl">조회수</th>
				<th class="tl">작성일</th>
			</tr>
			<c:if test="${empty searchList}">
				<tr>
					<td colspan="5">검색과 맞는 결과가 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty searchList}">
				<c:forEach var="trip2" items="${searchList }">
					<c:if test="${trip2.del != 'y' }">
						<tr>
							<td class="td1">${no}<c:set var="no" value="${no - 1}"></c:set></td>
							<td class="td2">
								<a href="tripView.do?t_num=${trip2.t_num}&pageNum=${pb.currentPage}">${trip2.t_title}</a>
							</td>
							<td class="td3">${trip2.m_name }</td>
							<td class="td4">${trip2.t_view }</td>
							<td class="td5">${trip2.reg_date }</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
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