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
			if("${prevUrl}" == "joinForm.do") {
				location.href="main.do"
			} else {
				location.href="${prevUrl}";
			}
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("암호를 확인하세요");
			history.back();
		</script>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("없는 아이디입니다");
			history.back();
		</script>
	</c:if>
</body>
</html>