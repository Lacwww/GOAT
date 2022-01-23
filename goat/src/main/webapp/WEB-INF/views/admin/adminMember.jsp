<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	color: rgb(64, 123, 37);
}
</style>
</head>
<body>
	<div style="padding-top: 5%; padding-left: 20%; width: 80%">
		<br>
		<br>
		<div style="width: 100%;">
			<h2 style="display: inline;">
				<a href="adminMember.do">회원 목록</a>
			</h2>
			<button class="btn pull-right" style="height: 30px;"
				onclick="location.href='admin.do'">돌아가기</button>
		</div>
		<br>
		<br>
		<div style="padding-top: 5%;">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>등록일</th>
						<th>관리자</th>
						<th>탈퇴여부</th>
						<th>탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${list }">
						<tr>
							<td>${member.m_num }</td>
							<td>${member.m_id }</td>
							<td>${member.m_name }</td>
							<td>${member.m_nick }</td>
							<td>${member.m_email }</td>
							<td>${member.reg_date }</td>
							<th>${member.admin }
							<td>${member.del }</td>
							<td><button class="btn btn-danger"
									onclick="location.href='adminMemberDelete.do?m_id=${member.m_id }&pageNum=${pageNum }'">탈퇴</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		<br>
		<div align="center" style="clear: both;">
			<ul class="pagination">
				<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${startPage > pagePerBlock }">
					<li><a href="adminMember.do?pageNum=1"> <span
							class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="adminMember.do?pageNum=${startPage-1}"> <span
							class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==i }">
						<li class="active"><a href="adminMember.do?pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage!=i }">
						<li><a href="adminMember.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
				<c:if test="${endPage < totalPage }">
					<li><a href="adminMember.do?pageNum=${endPage+1}"> <span
							class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminMember.do?pageNum=${totalPage}"> <span
							class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>