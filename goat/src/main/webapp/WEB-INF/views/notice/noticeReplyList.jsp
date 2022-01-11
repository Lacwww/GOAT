<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	
	function rDelete(nor_num, no_num) {
		var sendData = 'nor_num='+nor_num+'&no_num='+no_num;
		$.post('rDelete.do', sendData, function(data) {
			alert("댓글이 삭제되었습니다");
			$('#nrListDisp').html(data);
		});
	}
	function rUpdate(nor_num, no_num) {
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 때는 jquery val()
//		td등 일반 태그에 있는 데이터를 읽을때는 jquery에서는 text()로 읽는다
		var txt = $('#td_'+nor_num).text();
// 		클릭한 위치에 있는 댓글을 읽어서 수정할 수 있도록 textarea에 넣기
		$('#td_'+nor_num).html("<textarea rows='3' cols='100' id='rt_"+nor_num+"'>" + 
				txt + "</textarea>");
//		현재의 버튼을 수정하고 난 후에 확인, 취소로 변경
		$('#btn_'+nor_num).html("<input type='button' onclick='up("+no_num+","+nor_num+")'"+
				" value='확인'> "+
				"<input type='button' onclick='lst("+no_num+")' "+
				" value='취소'>");
	}
	function lst(no_num) {
		$('#nrListDisp').load('noticeReplyList.do?no_num='+no_num);
	}
	function up(no_num, nor_num) {
		var sendData = "nor_content="+$('#rt_'+nor_num).val()+"&no_num="+no_num+"&nor_num="+nor_num;
		$.post("rUpdate.do", sendData, function(data) {
			alert("댓글이 수정되었습니다.");
			$('#nrListDisp').html(data);
		});
	}
	function rpInsert(nor_num, no_num) {
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 때는 jquery val()
//		td등 일반 태그에 있는 데이터를 읽을때는 jquery에서는 text()로 읽는다
		$('#aa').html("<tr><td>re댓글</td><td><textarea rows='3' cols='100' id='rt_"+nor_num+"'>" + 
			"</textarea></td> <td><input type='button' value='댓글'>"+
			"<input type='button' value='취소'></td></tr>");
//		현재의 버튼을 수정하고 난 후에 확인, 취소로 변경
		$('#b1').html("<input type='button' onclick='up("+no_num+","+nor_num+")'"+
				" value='등록'> "+
				"<input type='button' onclick='lst("+no_num+")' "+
				" value='취소'>");
	}
</script>
</head><body>
<div>
	<c:if test="${empty nrList }">댓글 업졍~</c:if>
	<c:if test="${not empty nrList}">
		<h3 class="text-primary">댓 글 목 록</h3>
	<table style="border: 1px solid black;">
		<c:forEach var="nr" items="${nrList }">
			<c:if test="${nr.del == 'y' }">
				<tr><td colspan="2">삭제된 댓글입니다.</td></tr>
			</c:if>
			<c:if test="${nr.del != 'y' }">
				<tr><td>${nr.m_name }</td>
					<td><fmt:formatDate value="${nr.reg_date }" pattern="yyyy/MM/dd HH:mm:ss"/></td></tr>
				<tr><td style="white-space:pre; overflow:auto;" colspan="2" id="td_${nr.nor_num }">${nr.nor_content }</td></tr>
				
				<tr style="border-bottom: 1px dashed gray;"><td id="btn_${nr.nor_num }">
					<c:if test="${m_num == nr.m_num }">
						<input type="button" value="답글쓰기" onclick="rpInsert(${nr.nor_num},${nr.no_num})">
						<input type="button" value="수정" onclick="rUpdate(${nr.nor_num},${nr.no_num})">
						<input type="button" value="삭제" onclick="rDelete(${nr.nor_num},${nr.no_num})">
					</c:if>
					<c:if test="${m_num != nr.m_num }">
						<input type="button" value="답글쓰기" onclick="rpInsert(${nr.nor_num},${nr.no_num})"></c:if>
				</td>
				<td id="aa"></td></tr>
			</c:if>
		</c:forEach>
	</table>
	</c:if>
</div>
</body>
</html>