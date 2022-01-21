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
		<h2 style="margin-bottom: 50px;">Customer Service</h2>
		<table class="table table-striped" id="csList">
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
					<c:if test="${list.del != 'y' }">
						<tr onclick="location.href='${path}/cs/csView.do?cs_num=${list.cs_num }'" title="${list.cs_content }">
							<td align="center">
								${no }
								<c:set var="no" value="${no - 1}"></c:set>
							</td>
							<td align="center">
								${list.m_name }
							</td>
							<td>
								<c:if test="${list.cs_re_level > 0 }">
									<!-- 답변글 레벨당 10px들여 쓰기 -->
									<img alt="" src="${path}/resources/csImages/level.gif"
										height="5" width="${cs2.cs_re_level * 10 }">
									<img alt="" src="${path}/resources/csImages/reply.png"
										height="12" width="15">
								</c:if>${list.cs_title}
							</td>
							<td align="center">
								${list.reg_date }
							</td>
						</tr>
					</c:if>
					<c:if test="${list.del == 'y' }">
						<tr>
							<td colspan="4">관리자에 의해 삭제된 게시글입니다.</td>
						</tr>
					</c:if>					
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>