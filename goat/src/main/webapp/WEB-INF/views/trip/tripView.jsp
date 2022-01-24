<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	
	// 여행이야기 삭제
	function delTrip() {
		var con = confirm("등록한 여행이야기를 삭제하시겠습니까?");
		if(con) {
			location.href="tripDelete.do?t_num=${trip.t_num}&pageNum=${pageNum}";
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
		$('#trListDisp').load('tripReplyList.do?t_num=${trip.t_num}');
		$('#trInsert').click(function() {
			if(frm1.tre_content.value == "") {
				alert("댓글을 입력해주세요");
				frm1.tre_content.focus();
				return false;
			}
			// serialize() form의 모든값을 받을 수 있음
			var sendData = $('#frm1').serialize();
			$.post('trInsert.do?tre_num=0',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#trListDisp').html(data);
				frm1.tre_content.value="";  // 작성했던 댓글 지우기
			});
		});
	});
 	
  	function tripLike(t_num) {
		if(${empty id && empty admin}){
			alert("로그인 후 이용가능합니다");
			location.href="${path}/member/loginForm.do";
			return false;
		}
		if(${not empty admin}) {
			alert("관리자는 공감 버튼이 막혀있습니다.");
			return false;
		}
		
		$.post("tripLike.do", "t_num="+t_num, function(data) {
			var likeYesOrNo = '${tripLikeImgSrc}'; //현재 사용자가 공감이 되어있는지 아닌지 확인
            if(likeYesOrNo.indexOf('full') == -1){
               var cnt = 0; // 공감 안했던거면 0으로 보내고
            }else{
               var cnt = 1; // 공감을 했으면 1로 보내고
            }
            var tripLikeImgSrc = data;
            if(tripLikeImgSrc.indexOf('full') == -1 && cnt == 0){ // full이라는 글씨가 있으면, full이라는 글자의 인덱스를 반환하기 때문에
                                           // 0포함  0보다 큰 수가 나옴
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt});
               var del = '${tripLikeCnt}';
            }else if(tripLikeImgSrc.indexOf('full') > -1 && cnt == 0){
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt + 1});
            }else if(tripLikeImgSrc.indexOf('full') == -1 && cnt == 1){              
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt -1});
               var del = '${tripLikeCnt - 1}';
            }else if(tripLikeImgSrc.indexOf('full') > -1 && cnt == 1){
               $('#likeSpan').empty();
               $('#likeSpan').append(" : " + ${tripLikeCnt});
            }
            if(del == 0){
               $('#likeSpan').empty();
            }
            $(".tlChk").attr("src", tripLikeImgSrc);
		});
	}; 
</script>
</head>
<body>
	<div align="center">
		<h2 class="text-primary">여행 이야기 조회</h2>
		<table>
			<tr>
				<th>제목</th>
				<td>${trip.t_title}</td>
				<th>작성자</th>
				<td>${trip.m_name}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${trip.t_view}</td>
				<th>작성일</th>
				<td>${trip.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="white-space:pre; overflow:auto;">${trip.t_content}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<c:if test="${empty keyword }">
					<c:if test="${prevUrl == 'member' }">
						<a href="${path }/member/tripList.do?m_num=${m_num }" class="btn btn-info">게시글 목록</a>
					</c:if>
					<c:if test="${prevUrl != 'member' }">
						<a href="tripList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
					</c:if>
				</c:if>
				<c:if test="${not empty keyword }">
					<c:if test="${prevUrl == 'member' }">
						<a href="${path }/member/tripList.do?m_num=${m_num }" class="btn btn-info">게시글 목록</a>
					</c:if>
					<c:if test="${prevUrl != 'member' }">
						<a href="tripSearch.do?pageNum=${pageNum }&search=${search}&keyword=${keyword}" class="btn btn-info">게시글 목록</a>
					</c:if>
				</c:if>
					
				<c:if test="${m_num == trip.m_num || not empty admin}">
					<a href="tripUpdateForm.do?t_num=${trip.t_num}&pageNum=${pageNum }" class="btn btn-success">수정</a>
					<input type="button" onclick="delTrip()" class="btn btn-danger" value="삭제">
				</c:if>
				</td>
			</tr>
		</table>
	</div>
	<!-- 좋아요(추천수) -->
	<div style="text-align: center; margin: 20px;">
		<img style="border-radius:10px; width: 40px;" class="tlChk" 
			onclick="tripLike(${trip.t_num})" src="${tripLikeImgSrc}">
		<c:if test="${tripLikeCnt == 0}">
			<span style="font-size: 20px;">공감</span><span id="likeSpan"></span>
		</c:if>
		<c:if test="${tripLikeCnt != 0}">
			<span style="font-size: 20px;">공감</span><span id="likeSpan">:${tripLikeCnt}</span>
		</c:if>
	</div>
	
	<div id="trListDisp"></div>
	<!-- submit할 때 action이 없는 경우에는 자신(여기서는 view)를 한번 더 실행한다 -->
	<div>
		<form action="" id="frm1" name="frm1">
			<input type="hidden" name="t_num" value="${trip.t_num }">
		<table class="table table-hover">
		<!-- 회원 게시판의 경우에는 회원이름 또는 회원별명 또는 회원 id -->
			<tr><th>댓글</th><td><textarea rows="3" cols="100" name="tre_content"></textarea></td>
				<td><input type="button" value="댓글입력" onclick="sessionChk()" id="trInsert"></td></tr>
		</table>	
		</form>
	</div>
	
</body>
</html>