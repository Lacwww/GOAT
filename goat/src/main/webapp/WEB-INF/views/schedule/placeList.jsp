<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	div #p_list {overflow : auto; float: right; width: 30%; height: 20%;}
	.p_image { width: 100px; height: 140px; width: 100%;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="p_container" id="p_list">
	<c:forEach var="p" items="${plist }">
		 <div>
		 	<img alt="" src="${p.place_photo }" class="p_image">
		 </div>
	</c:forEach>
</div>
</body>
</html>