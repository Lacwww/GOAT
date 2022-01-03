<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#sch {margin-bottom: 80px;}
	.area {float: left;}
	.desc {
        padding: 30px;
        font-size: 50px;
        font-weight: bold;
        text-align: center;
        background-color: #ffffff;
        opacity: 0.5;
      }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2 id="sch">스케줄 생성</h2>
	<h3 class="text-primary" style="margin-bottom: 40px;">어디로 가볼까요?</h3>
<form action="selectArea.do" method="get" name="frm">
	<input type="text" name="keyword" id="keyword" placeholder="지역을 검색해주세요" value="${keyword }"
		style="width: 45%; height: 5%; font-size: 30px;">
	<button type="submit" class="btn btn-light">검색</button>
</form>
<div class="container" align="center">
		<div class="area">
			<div class="areaPhoto">
				<img alt="서울" src="${path}/resources/areaImages/서울.jpg">
			</div>
			<div class="desc">
				서울특별시
			</div>
		</div>
</div>
</div>
</body>
</html>