<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOAT</title>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div class="container" style="height: 100%;">
		<div><tiles:insertAttribute name="header"></tiles:insertAttribute></div>
		<div><tiles:insertAttribute name="body"></tiles:insertAttribute></div>
		<div><tiles:insertAttribute name="footer"></tiles:insertAttribute></div>
	</div>
</body>
</html>