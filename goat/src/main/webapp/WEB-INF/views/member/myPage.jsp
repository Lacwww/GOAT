<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration: underline; color: #2F9D27; }
	a:active { text-decoration: none; }
	a:hover { text-decoration: none; color: #FFCD12; }
	a:visited { text-decoration: none; }
	#myPage td { width: 11.1%; height: 70px; font-size: 15px; cursor: pointer; }
</style>
<script type="text/javascript">
	/* 삭제 */
	function del(m_id) {
		var con = confirm("정말로 탈퇴하시겠습니까?");
		if (con) {
			location.href="delete.do?m_id=" + m_id;
		} else {
			alert("탈퇴가 취소되었습니다");
			return;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">My Page</h2>
			<img alt="" src="${path }/resources/m_photo/${member.m_photo }" id="preview"
				style = "border-radius:50%;" width="200px;" height="200px;">
		<h3>${member.m_id }</h3>
		<div style="width: 50%;">
			<table id="myPage">
				<tr>
					<td align="center">
						<a href="createPlaceList.do?m_num=${member.m_num }">Create Place</a>
					</td>
					<td align="center">
						<a href="bookmarkList.do?m_num=${member.m_num }">Bookmark Place</a>
					</td>
					<td align="center">
						<a href="myCsList.do?m_num=${member.m_num }">Customer Service</a>
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href="scheduleList.do?m_num=${member.m_num }">Schedule List</a>
					</td>
					<td align="center">
						<a href="tripList.do?m_num${member.m_num }">Trip History</a>
					</td>
					<td align="center">
						<a href="updateForm.do?m_id=${member.m_id }">Member Update</a>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="Delete" class="btn btn-warning" onclick="del('${member.m_id}')">
					</td>
			</table>
		</div>
	</div>
</body>
</html>