<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div id="sch1">
		${sch.sch_name }<p>
		<img alt="calendar" src="${path }/resources/images/calendar.png"
					 style="width: 60px; height: 70px; padding-bottom : 5px;">${sch.s_date } ~ ${sch.e_date }
	</div>
	<div id="sch2" style="height: 70%; width: 100%;">
			<c:forEach var="days" begin="1" end="${days }">
				<div style="height: auto; width: 100%; height: 25%;">
					<div class="day" style="float: left; width:10%; height:100%; display: flex; align-items: center;">
						<span>Day${days }</span>
					</div>
					<div>
						<c:forEach var="scd" items="${list }">
							<div class="place">
								 <c:if test="${scd.day==days }">
									<div>
										${scd.place_name }<p>
										<button value="상세경로">상세경로</button>
									</div>
							 	</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
	</div>
</div>
</body>
</html>