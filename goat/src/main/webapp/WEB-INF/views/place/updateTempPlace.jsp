<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<div align="center">
		<h3>플레이스 수정 건의가 완료되었습니다</h3>
		<h3>건의 내용은 마이페이지에서 확인 가능합니다</h3>
		<button style="background-color: green; color:white;" onclick="location.href='${path}/member/myPage.do'">마이페이지</button>
		<button class="btn btn-warning" onclick="location.href='${path}/main/main.do'">메인</button>
		<button class="btn btn-primary" onclick="location.href='placeList.do'">플레이스</button>
	</div>	
</c:if>
<c:if test="${result == 0 }">
	<div align="center">
		<h3>플레이스 수정 건의에 실패하셨습니다</h3>
		<h4>플레이스 수정 건의에 자꾸 실패하실 경우 고객문의로 문의 바랍니다</h4>
		<button class="btn btn-danger" onclick="location.href='${path}/cs/csList.do'">고객문의</button>
		<button style="background-color: green; color:white;" onclick="location.href='updateFormTempPlace.do?place_num=${place_num}'">이전 플레이스 수정</button>
		<button class="btn btn-warning" onclick="location.href='${path}/main/main.do'">메인</button>
		<button class="btn btn-primary" onclick="location.href='placeList.do'">플레이스</button>
	</div>		
</c:if>
</body>
</html>