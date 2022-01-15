<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td {height: 30px; font-size: 15px;}
	.bgcolor{	
		background-color: rgb(64,123,37);
		color: white; 
		border-radius: 5px;
	}	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function prevDelete(prev_num,place_num) {
		var sendData = 'prev_num='+prev_num+'&place_num='+place_num;
		$.post('deletePrev.do', sendData, function(data) {
			alert("댓글이 삭제 되었습니다");
			$('#prevListDisp').html(data);
		});
	}
	function prevUpdate(prev_num, place_num) {
//		댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//		input, textarea에 있는 데이터를 읽을 떄는 jquery val()
//		td등 일반태그에 있는 데이터를 읽을 때는 jquery에서는 text()로 읽는다
		var txt = $('#td_'+prev_num).text();
		var titletxt = $('#title_'+prev_num).text();
//		클릭한 위치에 있는 댓글을 읽어서 수정할 수있도록 textarea에 넣기		
		$('#td_'+prev_num).html("<textarea rows='3' cols='30' id='rt_"+prev_num+"'>" +
				txt+"</textarea>");
//      현재의 버튼을 수정하고 난 후에 확인, 취소로 변경	
		$('#btn_'+prev_num).html("<input type='button' onclick='up("+prev_num+","+place_num+")'"+
			" class='btn btn-sm btn-danger' value='확인'> "+
			"<input type='button' onclick='lst("+place_num+")' " +
			" class='btn btn-sm btn-info' value='취소'>");
		$('#score_'+prev_num).html('<div id="str'+prev_num+'"></div>'+
				 '<label for="star11'+prev_num+'" class="star1 star_empty" id="st1'+prev_num+'" onclick="star2(1,'+prev_num+')"></label>'+
				 '<label for="star22'+prev_num+'" class="star1 star_empty" id="st2'+prev_num+'" onclick="star2(2,'+prev_num+')"></label>'+
				 '<label for="star33'+prev_num+'" class="star1 star_empty" id="st3'+prev_num+'" onclick="star2(3,'+prev_num+')"></label>'+
				 '<label for="star44'+prev_num+'" class="star1 star_empty" id="st4'+prev_num+'" onclick="star2(4,'+prev_num+')"></label>'+
				 '<label for="star55'+prev_num+'" class="star1 star_empty" id="st5'+prev_num+'" onclick="star2(5,'+prev_num+')"></label>'+
				 '<input type="radio" name="score" id="star11'+prev_num+'" class="radio" value="1">'+
				 '<input type="radio" name="score" id="star22'+prev_num+'" class="radio" value="2">'+
				 '<input type="radio" name="score" id="star33'+prev_num+'" class="radio" value="3">'+
				 '<input type="radio" name="score" id="star44'+prev_num+'" class="radio" value="4">'+
				 '<input type="radio" name="score" id="star55'+prev_num+'" class="radio" value="5">'
		);
		$('#title_'+prev_num).html('<input type="text" id="title1_'+prev_num+'" value="'+titletxt+'">');
	}
	function lst(place_num) {
		$('#prevListDisp').load('prevList.do?place_num='+place_num);
	}
	var score = 0;
	function up(prev_num, place_num) {
		if(score == 0){
			alert("평점을 선택해주세요");
			return false;
		}else{
			var sendData = "prev_content="+$('#rt_'+prev_num).val()+
							"&prev_title="+$('#title1_'+prev_num).val()+
							"&score="+$('#str'+prev_num).val()+
							"&prev_num="+prev_num+"&place_num="+place_num;
				$.post("updatePrev.do", sendData, function(data) {
				alert("댓글 수정 되었습니다");
				$('#prevListDisp').html(data);
			});
		}

	}
	function star2(num,prev_num) {
		score = 1;
		$('#str'+prev_num).val("");
		$('#str'+prev_num).val(num);
		for(var i = 1; i <=5; i++){
			$('#st'+i+prev_num).removeClass('on');		
		}
		for(var i = 1; i <= num; i++){
			$('#st'+i+prev_num).addClass('on');		
		} 
	}
</script>
</head>
<body>
<c:if test="${not empty list }">
	<h3 class="text-primary">장소 평가</h3>
<c:forEach var="prev" items="${list }">
	<c:if test="${prev.del == 'y' }">
<!-- 		<table style=" width: 75%;" class="under"> -->
<!-- 			<tr><th>삭제된 평가입니다.</th></tr> -->
<!-- 		</table> -->
	</c:if>
	<c:if test="${prev.del != 'y' }">
		<table style=" width: 80%; margin-bottom: 10px;">
			<tr align="center"><td style="width: 5%;" class="bgcolor">제목</td><td style="border-bottom: 1px solid black;" id="title_${prev.prev_num }">${prev.prev_title }</td>
				<td style="width: 5%;" class="bgcolor">작성자</td><td style="border-bottom: 1px solid black;">${prev.name }</td>
				<td style="width: 5%;" class="bgcolor">작성일</td><td style="border-bottom: 1px solid black;">
				<fmt:formatDate value="${prev.reg_date }" pattern="yyyy년 MM월 dd일"/>
				</td>
				<td style="width: 15%;"></td>
				</tr>	
		</table>
		<table style="width: 95%;  margin-top: 0px;">
			<tr><td style="width: 8%; border-bottom: 1px solid black;" id="score_${prev.prev_num }">
					<c:forEach begin="1" end="${prev.score }">
						<label class="star2 star_empty on"></label>
					</c:forEach>
					<c:forEach begin="${prev.score }" end="4">
						<label class="star2 star_empty"></label>
					</c:forEach>
				</td><td colspan="5" id="td_${prev.prev_num }" style="width:30%; border-bottom: 1px solid black;"><pre>${prev.prev_content }</pre></td>
				<td id="btn_${prev.prev_num }">
				<c:if test="${prev.m_num == m_num }">
				<div>
					<input type="button" class="btn btn-primary" value="수정" onclick="prevUpdate(${prev.prev_num}, ${prev.place_num })">
					<input type="button" class="btn btn-danger" value="삭제" onclick="prevDelete(${prev.prev_num}, ${prev.place_num })">
				</div> 
				</c:if>
				</td></tr>
		</table>
	</c:if>	
</c:forEach>	
</c:if>
</body>
</html>