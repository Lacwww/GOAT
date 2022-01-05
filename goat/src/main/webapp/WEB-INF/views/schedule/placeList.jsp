<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	div #p_list {overflow : auto; float: right; width: 30%; height: 100%; top: 20px;}
	.p_image { width: 100%; height: 100%;}
	#pimage { width: 160px; height: 140px; float: left;}
	#plist { margin: 10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="p_container" id="p_list" style="margin-top: 20px;">
	<!-- 플레이스 검색 -->
	<form action="placeList.do" method="get" name="frm">
		<select>
			<option>장소명</option>
			<option>테마</option>
		</select>
		<input type="text" name="keyword" id="keyword"
			placeholder="검색어를 입력해주세요" value="${keyword }">
		<button type="submit" class="btn btn-light">검색</button>
	</form>
	
	<c:if test="${empty plist }">
		<div id="pList">
			플레이스 데이터를 준비중입니다.
		</div>
	</c:if>
	
	<c:if test="${not empty plist }">
		<c:forEach var="p" items="${plist }">
			 <div id="pList">
			 	<div id="pimage">
			 		<img alt="" src="${p.place_photo }" class="p_image">
			 	</div>
			 	<div id="pdesc" style="height: 140px;" onclick="">
			 	 	<span style="font-weight: bold;">${p.place_name }</span><br>
			 	 	<span>주소</span><br>${p.place_addr }<br>
			 	 	<span>테마</span><br>${p.place_tag }
			 	 	<hr>
			 	 </div>
			 </div>
		</c:forEach>
	</c:if>
</div>
</body>
</html>