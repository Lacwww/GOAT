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
	function rUpdate(bno, rno) {
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 때는 jquery val()
//		td등 일반 태그에 있는 데이터를 읽을때는 jquery에서는 text()로 읽는다
		var txt = $('#td_'+rno).text();
// 		클릭한 위치에 있는 댓글을 읽어서 수정할 수 있도록 textarea에 넣기
		$('#td_'+rno).html("<textarea rows='3' cols='30' id='rt_"+rno+"'>" + 
				txt + "</textarea>");
//		현재의 버튼을 수정하고 난 후에 확인, 취소로 변경
		$('#btn_'+rno).html("<input type='button' onclick='up("+bno+","+rno+")'"+
				" class='btn btn-sm btn-danger' value='확인'> "+
				"<input type='button' onclick='lst("+bno+")' "+
				" class='btn btn-sm btn-info' value='취소'>");
	}
	function lst(bno) {
		$('#rbdListDisp').load('${path}/replyList/bno/'+bno);
	}
	function up(bno, rno) {
		var sendData = "replytext="+$('#rt_'+rno).val()+"&bno="+bno+"&rno="+rno;
		$.post("${path}/rUpdate", sendData, function(data) {
			alert("댓글 수정 완료!");
			$('#rbdListDisp').html(data);
		});
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
				<tr><td>${nr.m_name }</td></tr>
				<tr><td>${nr.reg_date }</td></tr>
				<tr><td style="white-space:pre; overflow:auto;" colspan="2" id="td_${nr.nor_num }">${nr.nor_content }</td></tr>
				
				<c:if test="${m_num == nr.m_num }">
					<td><input type="button" value="수정" onclick="rUpdate(${nr.nor_num},${nr.no_num})">
						<input type="button" value="삭제" onclick="rDelete(${nr.nor_num},${nr.no_num})"></td>
				</c:if>
				<c:if test="${m_num != nr.m_num }"><td></td></c:if>
			</c:if>
		</c:forEach>
	</table>
	</c:if>
</div>
</body>
</html>