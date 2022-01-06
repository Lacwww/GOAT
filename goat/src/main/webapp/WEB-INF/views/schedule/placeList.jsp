<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function pick(num) {
		var src = $('#p_image'+num).attr("src");
		var name = $('#p_name'+num).text();
		var addr = $('#p_addr'+num).text();
		var tag = $('#p_tag'+num).text();
		$('#Ppick>tbody').append("<tr id='tr"+num+"'><td><span onclick='del("+num+")' class='glyphicon glyphicon-remove'></span>"+
			"<img alt='' src='"+src+"' id='p_image' style='align : center;'></td><td>"
				+name+"</td><td>"+addr+"</td><td>"+tag+"</td></tr>");
		$('#pList'+num).hide();
	}
 	function del(num) {
 		var msg = confirm("플레이스를 삭제하시겠습니까?");
 		if(msg) {
			$('#tr'+num).remove();
			$('#pList'+num).show();
 		}
	}
</script>
<style type="text/css">
	div #p_list {overflow : auto; float: right; width: 30%; height: 100%; top: 20px;}
	.p_image { width: 100%; height: 100%;}
	#pimage { width: 160px; height: 140px; float: left;}
	#plist { margin: 10px;} 
	#p_image{ width: 150px; height: 150px;}
</style> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<input type="hidden" name="place_area" value="${place.place_area }">
<div class="p_container" id="p_list" style="margin-top: 20px;">
	<c:if test="${empty plist }">
		<div id="pList">
			플레이스 데이터를 준비중입니다.
		</div>
	</c:if>
	<c:if test="${not empty plist }">
		<c:forEach var="p" items="${plist }">
			 <div id="pList${p.place_num }">
			 	<div id="pimage">
			 		<img alt="" src="${p.place_photo }" class="p_image" id="p_image${p.place_num }">
			 	</div>
			 	<div id="pdesc" style="height: 140px;">
			 	 	<span style="font-weight: bold;" id="p_name${p.place_num }">${p.place_name }</span>
			 	 		<span class="glyphicon glyphicon-plus" id="icon" onclick="pick(${p.place_num})"></span> <br>
			 	 	<span>주소</span><br><span class="p_addr" id="p_addr${p.place_num }">${p.place_addr }</span><br>
			 	 	<span>테마</span><br><span class="p_tag" id="p_tag${p.place_num }">${p.place_tag }</span>
			 	 	<hr>
			 	 </div>
			 </div>
		</c:forEach>
	</c:if>
</div>
</body>
</html>