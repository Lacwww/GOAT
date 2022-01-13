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
	td { width: 11.1%; height: 70px; font-size: 15px; cursor: pointer; }
</style>
</head>
<body>
	<div class="container" align="center" style="display: flex; justify-content: center; width: 100%;">
		<table style="width: 100%;">
			<tr>
				<td style="border-left: 2px solid; border-right: 2px solid;" align="center" 
					onclick="location.href='/goat/main/home.do'">
					Logo
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/schedule/selectArea.do'">
					Schedule
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/place/placeList.do'">
					Place
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/cs/csList.do'">
					Service
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/notice/noticeList.do'">
					Notice
				</td>
				<td style="border-right: 2px solid;" align="center"
					onclick="location.href='/goat/trip/tripList.do'">
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
					<c:if test="${requestScope['javax.servlet.forward.request_uri'] == '/goat/member/myPage.do'||
						requestScope['javax.servlet.forward.request_uri'] == '/goat/member/updateForm.do'}">
						<td style="border-right: 2px solid;" align="center"
							onclick="location.href='/goat/member/logout.do'">
							Logout
						</td>
						<td style="border-right: 2px solid;" align="center"
							onclick="location.href='/goat/member/myPage.do'">
							MyPage
						</td>
					</c:if>
					<c:if test="${requestScope['javax.servlet.forward.request_uri'] != '/goat/member/myPage.do'&&
						requestScope['javax.servlet.forward.request_uri'] != '/goat/member/updateForm.do'}">
						<td style="border-right: 2px solid;" align="center"
							onclick="location.href='/goat/member/logout.do'">
							Logout
						</td>
						<td style="border-right: 2px solid;" align="center"
							onclick="location.href='/goat/member/myPage.do'">
							<img title="MyPage" style = "border-radius:50%;"
								 src="${m_img }" width="70px" height="70px"/>
						</td>
					</c:if>
				</c:if>
				<td style="border-right: 2px solid;" align="center">
					<div class="dropdown">
						<c:if test="${empty alert}">
							<img src="/goat/resources/images/notice.png" title="notice" width="40px" height="40px">
						</c:if>
						<c:if test="${not empty alert }">
							<img data-toggle="dropdown" alt="" src="/goat/resources/images/notice2.png"
								title="notice" width="40px" height="40px">
							<ul class="dropdown-menu" role="menu" style="margin-top: 20px;">
								<c:forEach var="list" items="${alert }">
									<c:if test="${not empty list.sch_name||empty list.temp_num||empty list.cs_num}">
										<li role="presentation">
											<a role="menuitem" href="#">${id }님의 ${list.sch_name }이 </a>
										</li>
									</c:if>
									<c:if test="${not empty list.temp_num||empty list.sch_name||empty list.cs_num}">
										<li role="presentation">
											<a role="menuitem" href="#">${id }님의 ${list.temp_name }에 대한 ${list.crud } 요청이 
												<c:if test="${list.del == 'y' }">
													승인 완료되었습니다
												</c:if>
												<c:if test="${list.del == 'd' }">
													승인 거절되었습니다
												</c:if>
											</a>
										</li>
									</c:if>
									<c:if test="${not empty list.cs_num||empty list.sch_name||empty list.temp_num}">
										<li role="presentation">
											<a role="menuitem" href="#">${id }님의 ${list.cs_title }에 답변이 달렸습니다 </a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>