<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tool.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#chooseFile { display: none; }
</style>
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
		});
		$('#cancel').click(function() {
			$('.data').attr('disabled', true);
			$('#success').hide();
			$('#cancel').hide();
			$('#update').show();
			$('#back').show();
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
	}
	
	/* 이메일 중복체크 & 이메일 유효성 검사 */
	function emailChk() {
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
</script>
</head>
<body>
	<div class="container" align="center" style="width: 100%;">
		<h2 style="margin-bottom: 50px;">Update</h2>
		<label for="chooseFile">
			<img alt="" src="${path }/resources/m_photo/${member.m_photo }" id="preview"
				style = "border-radius:50%;" width="200px;" height="200px;">
		</label>
		<h3>${member.m_id }</h3>
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
					<input type="text" name="m_nick" class="data" value="${member.m_nick }" placeholder="Nickname" required="required">
					<input type="button" class="data btn btn-info btn-sm" onclick="nickChk()" value="중복체크">
					<div id="nickChk_result" class="err"></div>
				</div>
				<div>
					<input type="email" name="m_email" class="data" value="${member.m_email }" id="m_email" placeholder="Email" required="required">
					<input type="button" class="data btn btn-info btn-sm" onclick="emailChk()" value="중복체크">
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
					<input type="text" name="m_addr" class="data" value="${member.m_addr }" id="address_kakao" placeholder="Address" required="required">
				</div>
				<div>
					<input type="text" name="m_addrd" class="data" value="${member.m_addrd }" placeholder="Address Detail" required="required">
				</div>
				<div>
					<input type="file" name="file" id="chooseFile" class="data">
				</div>
				<div>
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