<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th, td { border: 1px solid black;}
</style>
<script type="text/javascript">
	function prevDelete(prev_num,place_num) {
		var sendData = 'prev_num='+prev_num+'&place_num='+place_num;
		$.post('deletePrev.do', sendData, function(data) {
			alert("댓글이 삭제 되었습니다");
			$('#prevListDisp').html(data);
		});
	}
</script>
</head>
<body>
<c:if test="${not empty list }">
	<h3 class="text-primary">댓글</h3>
<table class="table table-striped">
<c:forEach var="prev" items="${list }">
	<c:if test="${prev.del == 'y' }">
		<div>삭제된 댓글입니다</div>
	</c:if>
	<c:if test="${prev.del != 'y' }">
		<table>
			<tr><th>제목</th><td>${prev.prev_title }</td>
				<th>작성자</th><td>${prev.m_num }</td>
				<th>평점</th><td>${prev.score }</td>
				<th>작성일</th><td>${prev.reg_date }</td></tr>
			<tr><th>내용</th><td colspan="6"><pre>${prev.prev_content }</pre></td>
				<td>
				
				<input type="button" value="수정" onclick="prevUpdate(${prev.prev_num}, ${prev.place_num })">
				<input type="button" value="삭제" onclick="prevDelete(${prev.prev_num}, ${prev.place_num })"> 
				
				</td></tr>
		</table>
	</c:if>	
</c:forEach>
</table>	
</c:if>
</body>
</html>