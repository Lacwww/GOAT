<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${path }/resources/css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${path }/resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	
	function rDelete(tre_num, t_num) {
		var sendData = 'tre_num='+tre_num+'&t_num='+t_num;
		$.post('rDelete.do', sendData, function(data) {
			alert("댓글이 삭제되었습니다");
			$('#trListDisp').html(data);
		});
	}
	function rUpdate(tre_num, t_num) {
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 때는 jquery val()
//		td등 일반 태그에 있는 데이터를 읽을때는 jquery에서는 text()로 읽는다
		var txt = $('#td_'+tre_num).text();
// 		클릭한 위치에 있는 댓글을 읽어서 수정할 수 있도록 textarea에 넣기
		$('#td_'+tre_num).html("<textarea rows='3' cols='100' id='rt_"+tre_num+"'>" + 
				txt + "</textarea>");
//		현재의 버튼을 수정하고 난 후에 확인, 취소로 변경
		$('#btn_'+tre_num).html("<input type='button' onclick='up("+t_num+","+tre_num+")'"+
				" value='확인'> "+
				"<input type='button' onclick='lst("+t_num+")' "+
				" value='취소'>");
	}
	function lst(t_num) {
		$('#trListDisp').load('tripReplyList.do?t_num='+t_num);
	}
	function up(t_num, tre_num) {
		var sendData = "tre_content="+$('#rt_'+tre_num).val()+"&t_num="+t_num+"&tre_num="+tre_num;
		$.post("rUpdate.do", sendData, function(data) {
			alert("댓글이 수정되었습니다.");
			$('#trListDisp').html(data);
		});
	}
	
	function rr(tre_num, t_num) {
		var tre_content = frm2.tre_content.value;
		if(frm2.tre_content.value == "") {
			alert("댓글을 입력해주세요");
			frm2.tre_content.focus();
			return false;
		}

		$.post('trInsert.do?tre_num='+tre_num+"&t_num="+t_num+"&tre_content="+tre_content, function(data) {
			alert("대댓글이 작성 되었습니다");	
			$('#trListDisp').html(data);
			frm2.tre_content.value="";  // 작성했던 댓글 지우기
		});
	}
	function rpInsert(tre_num, t_num) {
		if (${empty id && empty admin}) {
			alert("댓글은 로그인후 작성할 수 있습니다.");
			location.href="${path}/member/loginForm.do";		
		}
		$("#frm2").remove();
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 때는 jquery val()
//		td등 일반 태그에 있는 데이터를 읽을때는 jquery에서는 text()로 읽는다
		$('.reply_'+tre_num).html("<form action='' id='frm2' name='frm2'>"+
			"<input type='hidden' name='tre_num' value='"+tre_num+"'>"+
			"<table> &nbsp;&nbsp;&nbsp;"+
			"<tr><td><textarea rows='3' cols='100' name='tre_content'></textarea> &nbsp;&nbsp;"+ 
			"<input type='button' onclick='rr("+tre_num+","+t_num+")' value='등록'>"+
			"<input type='button' onclick='lst("+t_num+")' value='취소'></td></tr></table>");
	}
</script>
</head><body>
<div>
	<c:if test="${empty trList }">댓글이 없습니다. 여러분의 소중한 댓글을 입력해주세요</c:if>
	<c:if test="${not empty trList}">
		<h3 class="text-primary">댓 글 목 록</h3>
	
		<c:forEach var="tr" items="${trList }">
			<c:if test="${tr.del == 'y' }">
				<tr><td colspan="2">삭제된 댓글입니다.</td></tr>
			</c:if>

			<c:if test="${tr.del != 'y' }">
			
				<div style="float: left;">
				<c:if test="${tr.tre_re_level > 0 }">
					<!-- 답변글 레벨당 10px들여 쓰기 -->
					<img alt="" src="${path}/resources/csImages/level.gif"
						width="${tr.tre_re_level * 25 }">
					<img alt="" src="${path}/resources/csImages/reply.png"
						height="20" width="20">
					</c:if>
				</div>
			<table style="width:50%; float: inherit;">
					
				<tr><td>${tr.m_name }</td>
					<td><fmt:formatDate value="${tr.reg_date }" pattern="yyyy/MM/dd HH:mm:ss"/></td></tr>
				<tr><td style="white-space:pre; overflow:auto;" id="td_${tr.tre_num }">${tr.tre_content }</td>
				
				<td id="btn_${tr.tre_num }">
					<c:if test="${m_num == tr.m_num }">
						<input type="button" value="답글쓰기" onclick="rpInsert(${tr.tre_num},${tr.t_num})">
						<input type="button" value="수정" onclick="rUpdate(${tr.tre_num},${tr.t_num})">
						<input type="button" value="삭제" onclick="rDelete(${tr.tre_num},${tr.t_num})">
						<tr><td colspan="2" class="reply_${tr.tre_num }" style="height:0px; border-bottom: 1px dashed;"></td></tr>
					</c:if>
					<c:if test="${m_num != tr.m_num }">
						<input type="button" value="답글쓰기" onclick="rpInsert(${tr.tre_num},${tr.t_num})">
						<tr><td colspan="2" class="reply_${tr.tre_num }" style="height:0px; border-bottom: 1px dashed;"></td></tr>
					</c:if>
				</td><tr>
				</table>

			</c:if>
		</c:forEach>
	</c:if>
</div>
</body>
</html>