<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#cpList { margin: 0px; }
	#cpList tr { width: 100%; }
</style>
<script type="text/javascript">
	/* 삭제 */
	function del(temp_num, m_num, del) {
		if (del == 'c') {
			alert("취소된 건의입니다");
			return;
		} else if (del == 'y') {
			alert("완료된 건의입니다");
			return;
		} else {
			var con = confirm("정말로 취소하시겠습니까?");
			if (con) {
				location.href="cpDelete.do?temp_num=" + temp_num + '&m_num=' + m_num;
			} else {
				alert("건의 취소가 취소되었습니다");
				return;
			}	
		}
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">Create Place</h2>
		<table class="table table-striped" id="cpList">
			<tr style="width: 100%;">
				<td align="center">
					번호
				</td>
				<td align="center">
					이름
				</td>
				<td align="center">
					분류
				</td>
				<td align="center">
					주소
				</td>
				<td align="center">
					상세 주소
				</td>
				<td align="center">
					요청
				</td>
				<td align="center">
					요청 일자
				</td>
				<td align="center">
					처리 상태
				</td>
				<td align="center">
					수정
				</td>
				<td align="center">
					삭제
				</td>
			</tr>
			<c:if test="${empty place }">
				<tr>
					<td colspan="10">
						건의한 플레이스 내역이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty place }">
				<c:forEach var="list" items="${place }">
					<tr>
						<td align="center">
							${list.temp_num }
						</td>
						<td align="center">
							${list.temp_name }
						</td>
						<td align="center">
							${list.temp_cate }
						</td>
						<td align="center">
							${list.temp_addr }
						</td>
						<td align="center">
							${list.temp_addrd }
						</td>
						<td align="center">
							${list.temp_crud }
						</td>
						<td align="center">
							${list.reg_date }
						</td>
						<td align="center">
							<c:if test="${list.del=='n' }">
								처리 중
							</c:if>
							<c:if test="${list.del=='y' }">
								승인 완료
							</c:if>
							<c:if test="${list.del=='d' }">
								승인 거부
							</c:if>
							<c:if test="${list.del=='c' }">
								건의 취소
							</c:if>
						</td>
						<td align="center">
							<button class="btn btn-success btn-sm" onclick="location.href=''">수정</button>
						</td>
						<td align="center">
							<button class="btn btn-warning btn-sm" onclick="del('${list.temp_num}', '${list.m_num }', '${list.del }')">취소</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>