<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<h2>여행 일정이 수정되었습니다</h2>	
	</div>
	<form action="schView.do" method="post">
		<input type="hidden" name="sch_num" value="${sch_num }">
		<div>
   			<input type="button" value="메인페이지" onclick="location.href='${path}/main/home.do'">
			<input type="submit" name="chkSch" value="스케줄 확인">
			<input type="button" name="SchList" value="스케줄 목록" onclick="location.href='${path}/member/scheduleList.do?m_num=${m_num }'">
		</div>
	</form>
</div>
</body>
</html>