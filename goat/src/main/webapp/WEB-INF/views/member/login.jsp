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
			if("${prevUrl}" == "/goat/member/joinForm.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/join.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/findIdForm.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/findIdResult.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/findPassForm.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/findPassResult.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/updatePassResult.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "/goat/member/delete.do") {
				location.href="/goat/main/home.do"
			} else if("${prevUrl}" == "") {
				location.href="/goat/main/home.do"
			}  else {
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