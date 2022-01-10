<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	var websocket; // 전역변수, 여러 function에사용
	var nickname;  // 별명
	$(function() {
		$('#enterBtn').click(function() {		connect();		});
		$('#exitBtn').click(function() {		disconnect();	});
		$('#sendBtn').click(function() {		send();		});
		// keypress 키보드를 눌렀을 때
		$('#message').keypress(function() {
			// 누른 key ascii값       IE이면 ?  IE의 key값        IE아닌 키값  
			var keycode = event.keyCode?event.keyCode:event.which;
			if (keycode== 13) {  // ascii값으로 13은 enter
				send();
			}
		});
	});
	function connect() {
		// 서버와 연결                               server ip             servlet-context에 등록된 이름
		websocket = new WebSocket("ws://172.30.1.47:8080/goat/admin/echo.do");
		websocket.onopen = Open;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	function disconnect() {
		websocket.close();
	}
	function send() {
		var msg = $('#message').val();  // 메세지에 입력한 글 읽기
		websocket.send(nickname+" => "+msg); // 메세지를 별명과 함께 보내기
		$('#message').val("");   // 메세지에 입력한 글 지우기
	}
	function Open() {
		nickname = $('#nickname').val(); // 별명 가져오기
	//  appendMessage(nickname+"님이 입장하였습니다");
		websocket.send(nickname+"님이 입장하였습니다");
	}
	function onClose() {
	//	appendMessage(nickname+"님이 퇴장하였습니다");
		websocket.send(nickname+"님이 퇴장하였습니다");
	}
	function onMessage(event) {
		var msg = event.data;  // 메세지는 event의 data속성에 값으로 들어온다
		appendMessage(msg);
	}
	function appendMessage(msg) {
		$('#chatMessage').append(msg+"<br>"); // 메세지 붙이고 줄바꿈
		var objDiv = document.getElementById("chatMessage");
	// 채팅창에 글이 꽉차면 최신글을 하단에 보이게. 이게 없으면 scroll bar를 움직여야 최신글이 보인다
		objDiv.scrollTop = objDiv.scrollHeight;
	}
</script>
</head>
<body>
<div class="container">
<table class="table table-hover">
	<tr><td width="20%">별명</td><td><input type="text" id="nickname">
		<input type="button" id="enterBtn" value="입장" class="btn btn-info btn-sm">
		<input type="button" id="exitBtn" value="퇴장" class="btn btn-sm btn-warning">
		</td></tr>
	<tr><td>메세지</td><td><input type="text" id="message">
		<input type="button" id="sendBtn" value="전송" class="btn btn-sm btn-success">
	</td></tr>
	<tr><td>대화명역</td><td><div id="chatMessage"></div></td></tr>
</table>
</div>
</body>
</html>