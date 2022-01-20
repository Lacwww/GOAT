<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#table { margin: 30px; }
	#table td { width: 11.1%; height: 70px; font-size: 15px; cursor: pointer; }
</style>
<script type="text/javascript">
	$(function() {
		$.post('/goat/member/chkAlert.do', "m_num=${m_num}", function(alert) {
			console.log(alert);
		});
	});
</script>
</head>
<body>
	<div class="container" align="center" style="display: flex; justify-content: center; width: 100%;">
		<table style="width: 100%;" id="table">
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
								 src="/goat/resources/m_photo/${m_img }" width="70px" height="70px"/>
						</td>
					</c:if>
				</c:if>
				<c:if test="${not empty id && empty admin }">
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
										<c:if test="${list.sch_num!=0 && list.day < 8 && list.cs_num==0 && list.temp_num==0 && list.t_num==0}">
											<li role="presentation">
												<a role="menuitem" href="#">${list.sch_name }이 ${list.day}일 남았습니다.</a>
											</li>
										</c:if>
										<c:if test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }에 대한 ${list.temp_crud } 요청이 
													<c:if test="${list.del == 'y' }">
														승인 완료되었습니다
													</c:if>
													<c:if test="${list.del == 'd' }">
														승인 거절되었습니다
													</c:if>
												</a>
											</li>
										</c:if>
										<c:if test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }에 답변이 달렸습니다 </a>
											</li>
										</c:if>
										<c:if test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
											<li role="presentation">
												<c:if test="${list.t_like==1 }">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 좋아요를 눌렀습니다 </a>
												</c:if>
												<c:if test="${list.t_reply==1 }">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 댓글이 달렸습니다 </a>
												</c:if>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</div>
					</td>
				</c:if>
			</tr>
		</table>
	</div>
</body>
</html>