<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("여행이야기 수정 성공");
		location.href="tripView.do?t_num=${t_num}&pageNum=${pageNum}";
		
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("수정 실패");
		history.back();
	</script>
</c:if>
</body>
</html>