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
<c:if test="${result >0 }">
	<script type="text/javascript">
		alert("여행 일정이 삭제되었습니다");
		location.href = '${path}/member/scheduleList.do?m_num=${m_num}';
	</script>
</c:if>
<c:if test="${result >0 }"> 
	<script type="text/javascript">
		alert("스케줄 삭제에 실패하였습니다");
		history.back();
	</script>
</c:if>
</body>
</html>