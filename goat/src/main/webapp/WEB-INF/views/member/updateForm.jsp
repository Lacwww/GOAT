<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOAT</title>
<style type="text/css">
	#chooseFile { display: none; }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	/* 수정 */
	$(function() {
		$('.data').attr('disabled', true);
		$('#success').hide();
		$('#cancel').hide();
		$('#update').click(function() {
			$('.data').attr('disabled', false);
			$('#success').show();
			$('#cancel').show();
			$('#update').hide();
			$('#back').hide();
			if (!frm.m_nick.value) {
				alert("닉네임을 입력하세요");
				frm.m_nick.focus();
				return false;
			}
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
			$.post('chkUpdateNick.do', "m_nick=" + frm.m_nick.value + "&m_id=${member.m_id }", function(data) {
				 if(data == 1) {
	                $('#nickChk_result').html("현재 닉네임입니다");
	                $('#nickChk_result').css("color","blue");
	                frm.nickchk.value="chk";
	             } else if(data == 0) {
	                $('#nickChk_result').html("사용 가능한 닉네임입니다");
	                $('#nickChk_result').css("color","blue");
	                frm.nickchk.value="chk";
	             } else {
	            	 $('#nickChk_result').html("사용 중인 닉네임입니다");
	                 $('#nickChk_result').css("color","red");
	                 frm.nickchk.value="unChk";
	             }
			});
			var getEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			//이메일 유효성 검사 
			if(!getEmail.test($("#m_email").val())) { 
				alert("이메일 형식에 맞게 입력하세요");
				$("#m_email").focus(); 
				return false; 
			}
			if (!frm.m_email.value) {
				alert("이메일을 입력하세요");
				frm.m_email.focus();
				return false;
			}

			// 변수 id에 입력한 id를 담아서 post방식으로 confirmId.sun을 실행하고, 그 결과를 받아서
			// id가 err_id인 곳에 html 형식으로 보여줘라
			$.post('chkUpdateEmail.do', "m_email=" + frm.m_email.value + "&m_id=${member.m_id }", function(data) {
	 		 	if(data == 1) {
	                $('#emailChk_result').html("현재 이메일입니다");
	                $('#emailChk_result').css("color","blue");
	                frm.emailchk.value="chk";
	            } else if(data == 0) {
	            	$('#emailChk_result').html("사용 가능한 이메일입니다");
	             	$('#emailChk_result').css("color","blue");
	             	frm.emailchk.value="chk";
	            } else {
	 				$('#emailChk_result').html("사용 중인 이메일입니다");
	             	$('#emailChk_result').css("color","red");
	             	frm.emailchk.value="unChk";
	            }
			});
			$('#nickChk_result').show();
			$('#emailChk_result').show();
		});
		$('#cancel').click(function() {
			$('.data').attr('disabled', true);
			$('#success').hide();
			$('#cancel').hide();
			$('#update').show();
			$('#back').show();
			$('#nickChk_result').hide();
			$('#emailChk_result').hide();
		});
	});
	
	
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
		if (frm.m_pass.value != frm.m_pass2.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.m_pass2.focus();
			frm.m_pass2.value = "";
			return false;
		}
		if (frm.nickchk.value == "unChk") {
	   	 	alert("닉네임 중복체크를 해주세요.");
	    	return false;
		}
		if (frm.emailchk.value == "unChk") {
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
	
	/* 비밀번호 일치 여부 검사 */
	function passChk() {
		if (frm.m_pass.value != '' && frm.m_pass2.value != '') {
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
	
	/* 닉네임 중복체크 & 닉네임 유효성 검사 */
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
			$.post('chkUpdateNick.do', "m_nick=" + frm.m_nick.value + "&m_id=${member.m_id }", function(data) {
				 if(data == 1) {
	                $('#nickChk_result').html("현재 닉네임입니다");
	                $('#nickChk_result').css("color","blue");
	                frm.nickchk.value="chk";
	             } else if(data == 0) {
	                $('#nickChk_result').html("사용 가능한 닉네임입니다");
	                $('#nickChk_result').css("color","blue");
	                frm.nickchk.value="chk";
	             } else {
	            	 $('#nickChk_result').html("사용 중인 닉네임입니다");
	                 $('#nickChk_result').css("color","red");
	                 frm.nickchk.value="unChk";
	             }
			});
        }
	}
	
	/* 이메일 중복체크 & 이메일 유효성 검사 */
	function emailChk() {
		if(window.event.keyCode != 9 || window.event.keyCode != 8 || window.event.keyCode != 116 || window.event.ctrlKey&&(window.event.keyCode != 82)) {
			// 변수 id에 입력한 id를 담아서 post방식으로 confirmId.sun을 실행하고, 그 결과를 받아서
			// id가 err_id인 곳에 html 형식으로 보여줘라
			$.post('chkUpdateEmail.do', "m_email=" + frm.m_email.value + "&m_id=${member.m_id }", function(data) {
	 		 	if(data == 1) {
	                $('#emailChk_result').html("현재 이메일입니다");
	                $('#emailChk_result').css("color","blue");
	                frm.emailchk.value="chk";
	            } else if(data == 0) {
	            	$('#emailChk_result').html("사용 가능한 이메일입니다");
	             	$('#emailChk_result').css("color","blue");
	             	frm.emailchk.value="chk";
	            } else {
	 				$('#emailChk_result').html("사용 중인 이메일입니다");
	             	$('#emailChk_result').css("color","red");
	             	frm.emailchk.value="unChk";
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
	$(function() {
		
	});
</script>
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
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<style type="text/css">
	.data { width: 30%; height: 35px; margin: 10px; font-size: 15px; }
</style>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#page-top">G.O.A.T LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive" style="display: flex !important;">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Trip</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/member/logout.do">Logout</a></li>
					<li class="nav-item"><a id="active" class="nav-link" href="/goat/member/myPage.do"><img
							title="MyPage" style="border-radius: 50%;"
							src="/goat/resources/m_photo/${m_img }" width="70px"
							height="70px" /></a></li>
					<c:if test="${not empty id && empty admin }">
					<li class="nav-item">
						<ul class="dropdown">
							<c:if test="${empty alert}">
								<img src="/goat/resources/images/notice.png" title="notice" width="40px" height="40px">
							</c:if>
							<c:if test="${not empty alert }">
								<img data-toggle="dropdown" alt="" src="/goat/resources/images/notice2.png"
									title="notice" width="40px" height="40px">
								<ul class="dropdown-menu" role="menu" style="margin-top: 20px;">
									<c:forEach var="list" items="${alert }">
										<c:if test="${list.sch_num!=0 && list.day >= 0 && list.day < 8 && list.cs_num==0 && list.temp_num==0 && list.t_num==0}">
											<c:if test="${list.day == 0 }">
												<li role="presentation">
													<a role="menuitem" href="/member/alertSch.do?ale_num${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } 출발일입니다.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="/member/alertSch.do?ale_num${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }이 ${list.day}일 남았습니다.</a>
												</li>
											</c:if>
										</c:if>
										<c:if test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }에 대한 ${list.temp_crud } 요청이 
													<c:if test="${list.del == 'y' }">
														승인 완료되었습니다
													</c:if>
													<c:if test="${list.del == 'd' }">
														승인 거절되었습니다
													</c:if>
												</a>
											</li>
										</c:if>
										<c:if test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }에 답변이 달렸습니다 </a>
											</li>
										</c:if>
										<c:if test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
											<li role="presentation">
												<c:if test="${list.t_like==1 && list.t_reply==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 좋아요를 눌렀습니다 </a>
												</c:if>
												<c:if test="${list.t_reply==1 && list.t_like==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }에 댓글이 달렸습니다 </a>
												</c:if>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" align="center" style="width: 100%; height: 100%; display: flex; flex-direction: column; justify-content: center; padding-top: 150px;">
		<h1 style="margin-bottom: 50px;">Update</h1>
		<label for="chooseFile">
			<img alt="" src="${path }/resources/m_photo/${member.m_photo }" id="preview"
				style = "border-radius:50%;" width="200px;" height="200px;">
		</label>
		<h2>${member.m_id }</h2>
		<div>
			<form action="update.do" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
				<input type="hidden" name="nickchk" value="unChk">
			    <input type="hidden" name="emailchk" value="unChk">
			    <input type="hidden" name="m_id" value="${member.m_id }">
				<div>
					<input type="password" name="m_pass" class="data" placeholder="Password" required="required">
				</div>
				<div>
					<input type="password" name="m_pass2" class="data" placeholder="Password Confirm" required="required"  onkeyup="passChk()">
					<div id="same"></div>
				</div>
				<div>
					<input type="text" name="m_nick" class="data" value="${member.m_nick }" placeholder="Nickname" required="required" onkeyup="nickChk()">
<!-- 					<input type="button" class="data btn btn-info btn-sm" onclick="nickChk()" value="중복체크"> -->
					<div id="nickChk_result" class="err"></div>
				</div>
				<div>
					<input type="email" name="m_email" class="data" value="${member.m_email }" id="m_email" placeholder="Email" required="required" onkeyup="emailChk()">
					<div id="emailChk_result" class="err"></div>
				</div>
				<div>
					<input type="text" name="m_name" class="data" value="${member.m_name }" placeholder="Name" required="required">
				</div>
				<div>
					<input type="tel" name="m_tel" class="data" value="${member.m_tel }" pattern="010-\d{3,4}-\d{4}" title="010-0000-0000"
						placeholder="Tel" required="required">
				</div>
				<div>
					<input type="date" name="m_birth" id="birth" class="data" value="${member.m_birth }" placeholder="Birth" required="required">
				</div>
				<div>
					<input type="text" name="m_addr" class="data" value="${member.m_addr }" id="address_kakao" placeholder="Address" required="required" readonly="readonly">
				</div>
				<div>
					<input type="text" name="m_addrd" class="data" value="${member.m_addrd }" placeholder="Address Detail" required="required">
				</div>
				<div>
					<input type="file" name="file" id="chooseFile" class="data">
				</div>
				<div style="font-size: 15px;">
					<input type="button" value="수정" class="btn btn-info" id="update">
					<input type="button" value="취소" class="btn btn-warning" id="back" onclick="history.back()">
					<input type="submit" value="완료" class="btn btn-info" id="success">
					<input type="reset" value="취소" class="btn btn-warning" id="cancel">
				</div>
			</form>
		</div>
	</div>
</body>
</html>