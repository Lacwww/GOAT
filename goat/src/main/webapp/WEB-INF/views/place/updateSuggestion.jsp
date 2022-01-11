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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("장소 건의 수정에 성공하였습니다");
		location.href="/goat/member/createPlaceList.do?m_num=${m_num}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("장소 건의 수정에 실패하였습니다\n건의 수정에 계속 실패하실 경우 고객문의로 문의 바랍니다");
		location.href="/goat/cs/csList.do";
	</script>
</c:if>
</body>
</html>