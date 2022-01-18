<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#scList { margin: 0px; }
	#scList tr { width: 100%; }
</style>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">Schedule List</h2>
		<table class="table table-striped" id="scList">
			<tr style="width: 100%;">
				<td align="center">
					번호
				</td>
				<td align="center">
					제목
				</td>
				<td align="center">
					시작일자
				</td>
				<td align="center">
					종료일자
				</td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">
						작성한 스케줄 내역이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="list" items="${list }">
					<tr onclick="location.href='${path}/schedule/schView.do?sch_num=${list.sch_num }'">
						<td align="center">
							${list.sch_num }
						</td>
						<td align="center">
							${list.sch_name }
						</td>
						<td align="center">
							${list.s_date }
						</td>
						<td align="center">
							${list.e_date }
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>