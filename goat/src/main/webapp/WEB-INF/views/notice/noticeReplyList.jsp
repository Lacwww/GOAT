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
	
	function rr(nor_num, no_num) {
		var nor_content = frm2.nor_content.value;
		if(frm2.nor_content.value == "") {
			alert("댓글을 입력해주세요");
			frm2.nor_content.focus();
			return false;
		}

		$.post('rInsert.do?nor_num='+nor_num+"&no_num="+no_num+"&nor_content="+nor_content, function(data) {
			alert("대댓글이 작성 되었습니다");	
			$('#nrListDisp').html(data);
			frm2.nor_content.value="";  // 작성했던 댓글 지우기
		});
	}
	function rpInsert(nor_num, no_num) {
		if (${empty id && empty admin}) {
			alert("댓글은 로그인후 작성할 수 있습니다.");
			location.href="${path}/member/loginForm.do";		
		}
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 때는 jquery val()
//		td등 일반 태그에 있는 데이터를 읽을때는 jquery에서는 text()로 읽는다
		$('.reply_'+nor_num).html("<form action='' id='frm2' name='frm2'>"+
			"<input type='hidden' name='nor_num' value='"+nor_num+"'>"+
			"<table> &nbsp;&nbsp;&nbsp;"+
			"<tr><td><textarea rows='3' cols='100' name='nor_content'></textarea> &nbsp;&nbsp;"+ 
			"<input type='button' onclick='rr("+nor_num+","+no_num+")' value='등록'>"+
			"<input type='button' onclick='lst("+no_num+")' value='취소'></td></tr></table>");
	}
</script>
</head><body>
<div>
	<c:if test="${empty nrList }">댓글 업졍~</c:if>
	<c:if test="${not empty nrList}">
		<h3 class="text-primary">댓 글 목 록</h3>
	
		<c:forEach var="nr" items="${nrList }">
			<c:if test="${nr.del == 'y' }">
				<tr><td colspan="2">삭제된 댓글입니다.</td></tr>
			</c:if>

			<c:if test="${nr.del != 'y' }">
				<div style="float: left;">
				<c:if test="${nr.nor_re_level > 0 }">
					<!-- 답변글 레벨당 10px들여 쓰기 -->
					<img alt="" src="${path}/resources/csImages/level.gif"
						width="${nr.nor_re_level * 25 }">
					<img alt="" src="${path}/resources/csImages/reply.png"
						height="20" width="20">
					</c:if>
				</div>
			<table style="width:50%; float: inherit;">
					
				<tr><td>${nr.m_name }</td>
					<td><fmt:formatDate value="${nr.reg_date }" pattern="yyyy/MM/dd HH:mm:ss"/></td></tr>
				<tr><td style="white-space:pre; overflow:auto;" id="td_${nr.nor_num }">${nr.nor_content }</td>
				
				<td id="btn_${nr.nor_num }">
					<c:if test="${m_num == nr.m_num || not empty admin}">
						<input type="button" value="답글쓰기" onclick="rpInsert(${nr.nor_num},${nr.no_num})">
						<input type="button" value="수정" onclick="rUpdate(${nr.nor_num},${nr.no_num})">
						<input type="button" value="삭제" onclick="rDelete(${nr.nor_num},${nr.no_num})">
						<tr><td colspan="2" class="reply_${nr.nor_num }" style="height:0px; border-bottom: 1px dashed;"></td></tr>
					</c:if>
					<c:if test="${m_num != nr.m_num && empty admin}">
						<input type="button" value="답글쓰기" onclick="rpInsert(${nr.nor_num},${nr.no_num})">
						<tr><td colspan="2" class="reply_${nr.nor_num }" style="height:0px; border-bottom: 1px dashed;"></td></tr>
					</c:if>
				</td><tr>
				</table>
			</c:if>
		</c:forEach>
	</c:if>
</div>
</body>
</html>