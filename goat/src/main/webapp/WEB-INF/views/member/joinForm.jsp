<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>GOAT</title>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${path }/resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	// 카카오 지도 API
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=m_addrd]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	/* 비밀번호 일치 여부 & 중복체크 여부 검사 */
	function chk() {
		var getEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(frm.m_pass.value != frm.m_pass2.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.m_pass2.focus();
			frm.m_pass2.value = "";
			return false;
		}
		if(frm.idchk.value == "unChk") {
	  		alert("아이디 중복체크를 해주세요.");
	   	 	return false;
		}	
		if(frm.nickchk.value == "unChk") {
	   	 	alert("닉네임 중복체크를 해주세요.");
	    	return false;
		}
		if(frm.emailchk.value == "unChk") {
	   	 	alert("이메일 중복체크를 해주세요.");
	    	return false;
		}
		//닉네임 유효성 검사
		if (!frm.m_nick.value) {
			alert("닉네임을 입력하세요");
			frm.m_nick.focus();
			return false;
		}
		//이메일 유효성 검사 
		if (!frm.m_email.value) {
			alert("이메일을 입력하세요");
			frm.m_email.focus();
			return false;
		}
		if(!getEmail.test($("#m_email").val())) { 
			alert("이메일 형식에 맞게 입력하세요");
			$("#m_email").focus(); 
			return false; 
		}
	}
	
	/* 아이디 중복체크 $ 유효성 검사 */
	function idChk() {
		var getCheck= RegExp(/^[a-zA-Z0-9]{0,20}$/);
		if(window.event.keyCode != 9 || window.event.keyCode != 8 || window.event.keyCode != 116 || window.event.ctrlKey&&(window.event.keyCode != 82)) {
			//아이디 유효성검사
			if(!getCheck.test($("#m_id").val())){ 
				alert("아이디는 영문자와 숫자만 입력 가능합니다"); 
				$("#m_id").val(""); 
				$("#m_id").focus(); 
				return false; 
			}
			if (!frm.m_id.value) {
				alert("아이디를 입력하세요");
				frm.m_id.focus();
				return false;
			}
			if (frm.m_id.value.match(/admin/gi)||frm.m_id.value.match(/master/gi)) {
				alert("아이디에 admin 또는 master 단어를 포함할 수 없습니다");
				frm.m_id.value = "";
				frm.m_id.focus();
				$('#idChk_result').html("");
				frm.idchk.value == "unChk";
				return false;
			}
			// id 중복체크 ajax
			$.post('chkId.do', "m_id=" + frm.m_id.value, function(data) {
	 		 	if(data == 1) {
	                $('#idChk_result').html("사용 중인 아이디입니다");
	                $('#idChk_result').css("color","red");
	                frm.idchk.value="unChk";
	             }
	 		 	else {
	 				$('#idChk_result').html("사용 가능한 아이디입니다");
	             	$('#idChk_result').css("color","blue");
	             	frm.idchk.value="chk";
	            }
			});
		}
	}
	
	/* 비밀번호 일치 여부 검사 */
	function passChk() {
		if(window.event.keyCode != 9 || window.event.keyCode != 8 || window.event.keyCode != 116 || window.event.ctrlKey&&(window.event.keyCode != 82)) {
			if (frm.m_pass.value == frm.m_pass2.value) {
				document.getElementById('same').innerHTML = '비밀번호 일치';
				document.getElementById('same').style.color = 'blue';
			} else {
				document.getElementById('same').innerHTML = '비밀번호 불일치';
				document.getElementById('same').style.color = 'red';
			}
		} else {
			document.getElementById('same').innerHTML = '';
		}
	}
	
	/* 닉네임 중복체크 */
	function nickChk() {
		if(window.event.keyCode != 9 || window.event.keyCode != 8 || window.event.keyCode != 116 || window.event.ctrlKey&&(window.event.keyCode != 82)) {
			if (frm.m_nick.value.match(/관리자/gi)||frm.m_nick.value.match(/admin/gi)||frm.m_nick.value.match(/master/gi)) {
				alert("닉네임에 관리자,admin,master 단어를 포함할 수 없습니다");
				frm.m_nick.value = "";
				frm.m_nick.focus();
				$('nickChk_result').html("");
				frm.nickchk.value == "unChk";
				return false;
			}
			// 변수 id에 입력한 id를 담아서 post방식으로 confirmNick.sun을 실행하고, 그 결과를 받아서
			// id가 err_nick인 곳에 html 형식으로 보여줘라
			$.post('chkNick.do', "m_nick=" + frm.m_nick.value, function(data) {
				 if(data == 1) {
	                $('#nickChk_result').html("사용 중인 닉네임입니다");
	                $('#nickChk_result').css("color","red");
	                frm.nickchk.value="unChk";
	             }
	             else {
	                $('#nickChk_result').html("사용 가능한 닉네임입니다");
	                $('#nickChk_result').css("color","blue");
	                frm.nickchk.value="chk";
	             }
			});
		}
	}
	
	/* 이메일 중복체크 & 이메일 유효성 검사 */
	function emailChk() {
		if(window.event.keyCode != 9 || window.event.keyCode != 8 || window.event.keyCode != 116 || window.event.ctrlKey&&(window.event.keyCode != 82)) {
			// 변수 id에 입력한 id를 담아서 post방식으로 confirmId.sun을 실행하고, 그 결과를 받아서
			// id가 err_id인 곳에 html 형식으로 보여줘라
			$.post('chkEmail.do', "m_email=" + frm.m_email.value, function(data) {
	 		 	if(data == 1) {
	                $('#emailChk_result').html("사용 중인 이메일입니다");
	                $('#emailChk_result').css("color","red");
	                frm.emailchk.value="unChk";
	             }
	 		 	else {
	 				$('#emailChk_result').html("사용 가능한 이메일입니다");
	             	$('#emailChk_result').css("color","blue");
	             	frm.emailchk.value="chk";
				}
			});
		}
	}
	
// 	프로필 이미지 미리보기
	var sel_flie;
	var img;
	$(function() {
		img = $('#preview').attr('src');
		$('#chooseFile').on('change', handleImgFileSelect);
		$('#cancel').click(function() {
			$('#preview').attr('src', img);
		});
	});
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if(!f.type.match('image.*')) {
				alert('이미지 파일만 등록 가능합니다');
				return;	
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr("src", e.target.result);
				}
			reader.readAsDataURL(f);
		});
	}
	
// 	뒤로가기 방지
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
	
	// 최대 날짜 제한
	$(function() {
		var date = new Date();
		var year = date.getFullYear() - 15;
		var month = date.getMonth() + 1;
		var day = date.getDate();
		if(month < 10){
			month = "0"+month;
		}
		if(day < 10){
			day = "0"+day;	
		}
		maxYear = year+'-'+month+'-'+day;
		document.getElementById("birth").setAttribute("max", maxYear);
	});
</script>
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
<style type="text/css">
	#chooseFile { display: none; }
	.data { width: 30%; height: 35px; margin: 10px; font-size: 15px; } }
</style>
<script type="text/javascript">
	$(function() {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
	})
	$(window).scroll(function(event) {
		$('#mainNav').addClass('navbar-shrink')
		$('#active').addClass('active')
	});
</script>
</head>
<body id="page-top">
<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Trip</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a id="active" class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
					</c:if>
					<c:if test="${not empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/myPage.do"><img
								title="MyPage" style="border-radius: 50%;"
								src="/goat/resources/m_photo/${m_img }" width="70px"
								height="70px" /></a></li>						
					</c:if>
					<c:if test="${empty id && not empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/admin/admin.do">AdminPage</a></li>						
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<section class="about-section text-center"
		style="background: linear-gradient(to bottom, rgba(21, 125, 138, 1) 0%, rgba(255, 255, 255, 1) 90%); height: 100%; margin-top: 104px;">
			<div class="container" align="center" style="margin-top: 70px;">
		<div class="container" align="center" style="width: 100%; height: 100%; display: flex; flex-direction: column; justify-content: center;">
			<div>
				<h2 style="margin-bottom: 50px;">Join</h2>
				<label for="chooseFile">
					<img alt="" src="${path }/resources/m_photo/goat6.png" id="preview"
						style = "border-radius:50%; border: 1px solid black;" width="200px;" height="200px;">
					<p style="margin: 0px;">프로필 수정</p>
				</label>
				<div id="thumbnails"></div>
				<form action="${path }/member/join.do" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
					<input type="hidden" name="idchk" value="unChk">
			    	<input type="hidden" name="nickchk" value="unChk">
			    	<input type="hidden" name="emailchk" value="unChk">
					<div>
						<input class="data" type="text" name="m_id" id="m_id" placeholder="ID" required="required" autofocus="autofocus" onkeyup="idChk()">
						<div id="idChk_result" class="err"></div>
					</div>
					<div>
						<input class="data" type="password" name="m_pass" placeholder="Password" required="required">
					</div>
					<div>
						<input class="data" type="password" name="m_pass2" placeholder="Password Confirm" required="required" onkeyup="passChk()">
						<div id="same"></div>
					</div>
					<div>
						<input class="data" type="text" name="m_nick" placeholder="Nickname" required="required" onkeyup="nickChk()">
						<div id="nickChk_result" class="err"></div>
					</div>
					<div>
						<input class="data" type="email" name="m_email" id="m_email" placeholder="Email" required="required" onkeypress="emailChk()">
						<div id="emailChk_result" class="err"></div>
					</div>
					<div>
						<input class="data" type="text" name="m_name" placeholder="Name" required="required">
					</div>
					<div>
						<input class="data" type="tel" name="m_tel" pattern="010-\d{3,4}-\d{4}" title="010-0000-0000"
							placeholder="Tel" required="required">
					</div>
					<div>
						<input class="data" type="date" name="m_birth" id="birth" placeholder="Birth" required="required" max="">
					</div>
					<div>
						<input class="data" type="text" name="m_addr" id="address_kakao" placeholder="Address" required="required" readonly="readonly">
					</div>
					<div>
						<input class="data" type="text" name="m_addrd" placeholder="Address Detail" required="required">
					</div>
					<div>
					<input type="file" name="file" id="chooseFile">
				</div>
					<div style="font-size: 15px;">
						<input type="submit" value="확인" class="btn btn-success">
						<input type="button" value="취소" onclick="history.back()" class="btn btn-warning">
					</div>
				</form>
			</div>
		</div>
	</div>
	</section>
</body>
</html>