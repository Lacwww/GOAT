<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( "#table" ).sortable({
    	items: $('.target')
    });
  } );
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="table">
  <tr class="target"><td>첫 번째 아이템</td></tr>
  <tr class="target"><td>두 번째 아이템</td></tr>
  <tr class="target"><td>세 번째 아이템</td></tr>
  <tr class="target"><td>네 번째 아이템</td></tr>
</table>
</body>
</html>