<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode= 2;
			return false;
		}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){
			return false;
			}
		}
	document.onkeydown = noEvent;
</script>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("장소 등록 성공");
		location.href="/goat/admin/adminPlace.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("장소 등록 실패");
		location.href="/goat/admin/adminPlace.do"";
	</script>
</c:if>
</body>
</html>