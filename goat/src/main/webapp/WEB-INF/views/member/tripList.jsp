<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#csList { margin: 0px; }
	#csList tr { width: 100%; }
</style>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">Trip History</h2>
		<table class="table table-striped" id="csList">
			<tr style="width: 100%;">
				<td align="center">
					번호
				</td>
				<td align="center">
					제목
				</td>
				<td align="center">
					조회수
				</td>
				<td align="center">
					작성일
				</td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">
						작성한 여행 글이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="list" items="${list }">
					<tr onclick="location.href='${path}/trip/tripView.do?t_num=${list.t_num }'" title="${list.t_content }">
						<td align="center">
							${list.t_num }
						</td>
						<td align="center">
							${list.t_title }
						</td>
						<td align="center">
							${list.t_view }
						</td>
						<td align="center">
							${list.reg_date }
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>