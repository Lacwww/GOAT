<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 고객문의 삭제
	function delCs() {
		var con = confirm("고객문의 삭제하시겠습니까?");
		if(con) {
			location.href="noticeDelete.do?no_num=${notice.no_num}&pageNum=${pageNum}";
		}
	}
	
	function sessionChk() {
		if (${empty id && empty admin}) {
			alert("비회원은 댓글쓰기 권한이 없습니다.");
			location.href="${path}/member/loginForm.do";		
		}
	}
	
	$(function() {
		// 현재 게시글에 해당하는 댓글을 가져와서 보여줘라
		$('#nrListDisp').load('${path}/notice/noticeReplyList.do?no_num=${notice.no_num}');
		$('#rInsert').click(function() {
			// serialize() form의 모든값을 받을 수 있음
			var sendData = $('#frm1').serialize();
			$.post('${path}/rInsert',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#nrListDisp').html(data);
				frm1.nor_content.value="";  // 작성했던 댓글 지우기
			});
		});
	});
</script>
</head>
<body>
	<div align="center">
		<h2 class="text-primary">공지 사항 상세 조회</h2>
		<table>
			<tr>
				<th>제목</th>
				<td>${notice.no_title}</td>
				<th>작성자</th>
				<td>${notice.m_nick}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${notice.no_view}</td>
				<th>작성일</th>
				<td>${notice.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto;">${notice.no_content}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
				<c:if test="${not empty admin}">
					<a href="noticeUpdateForm.do?no_num=${notice.no_num}&pageNum=${pageNum }" class="btn btn-success">수정</a>
					<input type="button" onclick="delCs()" class="btn btn-danger" value="삭제">
				</c:if>
				</td>
			</tr>
		</table>
		<div id="nrListDisp"></div>
		<!-- submit할 때 action이 없는 경우에는 자신(여기서는 view)를 한번 더 실행한다 -->
		<form action="" id="frm1" name="frm1">
			<input type="hidden" name="no_num" value="${notice.no_num }">
		<table class="table table-hover">
		<!-- 회원 게시판의 경우에는 회원이름 또는 회원별명 또는 회원 id -->
			<tr><th>댓글</th><td><textarea rows="3" cols="100" name="nor_content"></textarea></td>
				<td><input type="button" value="댓글입력" onclick="sessionChk()" id="rInsert"></td></tr>
		</table>	
		</form>
	</div>
</body>
</html>