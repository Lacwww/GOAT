<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#cpList { margin: 0px; }
	#cpList tr { width: 100%; }
</style>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">Create Place</h2>
		<table class="table table-striped" id="cpList">
			<tr style="width: 100%;">
				<td align="center">
					번호
				</td>
				<td align="center">
					이름
				</td>
				<td align="center">
					제목
				</td>
				<td align="center">
					작성일
				</td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">
						작성한 고객문의 내역이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="list" items="${list }">
					<tr onclick="location.href='${path}/cs/csView.do?cs_num=${list.cs_num }'">
						<td align="center">
							${list.cs_num }
						</td>
						<td align="center">
							${list.m_name }
						</td>
						<td align="center">
							${list.cs_title }
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