<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { margin: 30px; }
	td { width: 12.5%; height: 30px; font-size: 15px; cursor: pointer; }
</style>
</head>
<body>
	<div class="container" align="center">
		<table style="width: 100%">
			<tr>
				<td style="border-left: 2px solid; border-right: 2px solid;" align="center" 
					onclick="location.href='/goat/main/home.do'">
					Logo
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/main/home.do'">
					Schedule
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/place/placeList.do'">
					Place
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/cs/csList.do'">
					Board
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/main/home.do'">
					Trip
				</td>
				<c:if test="${empty id && empty admin }">
					<td style="border-right: 2px solid;" align="center"
						onclick="location.href='/goat/member/loginForm.do'">
						Login
					</td>
					<td style="border-right: 2px solid;" align="center"
						onclick="location.href='/goat/member/joinForm.do'">
						Join
					</td>
				</c:if>
				<c:if test="${empty id && not empty admin }">
					<td style="border-right: 2px solid;" align="center"
						onclick="location.href='/goat/member/logout.do'">
						Logout
					</td>
					<td style="border-right: 2px solid;" align="center"
						onclick="location.href='/goat/admin/admin.do'">
						Adminpage
					</td>
				</c:if>
				<c:if test="${not empty id && empty admin }">
					<td style="border-right: 2px solid;" align="center"
						onclick="location.href='/goat/member/logout.do'">
						Logout
					</td>
					<td style="border-right: 2px solid;" align="center"
						onclick="location.href='/goat/member/mypage.do'">
						Mypage
					</td>
				</c:if>
				<td style="border-right: 2px solid;" align="center">Weather</td>
			</tr>
		</table>
	</div>
</body>
</html>