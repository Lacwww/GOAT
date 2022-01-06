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
	<script type="text/javascript">
		alert("로그아웃 되었습니다");
		if("${prevUrl}" == "/goat/main/main.do") {
			location.href="/goat/main/main.do"
		} else {
			location.href="/goat/main/home.do"
		}
	</script>
</body>
</html>