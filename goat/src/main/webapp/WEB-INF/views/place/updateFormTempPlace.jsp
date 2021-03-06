<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="../tool.jsp"%>
<%@	include file="../tool3.jsp"%>
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
<link rel="stylesheet" href="${path }/resources/css/styles.css" />
<style type="text/css">
	#imgpreview { float: left; }
	.bgcolor{	
	  color: #fff;
	  background-color: #64a19d;
		border-radius: 5px;
	}	
	#mainNav {position: fixed;}
	td { border-bottom: 1px solid white; height: 40px;}
	.btn1 {
	  color: #fff;
	  background-color: #64a19d;
	  border-color: #64a19d;
	}
	.btn1:hover {
		background-color: white;
		color: black;
	}
</style>
<script>
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<script type="text/javascript">
	//????????? ????????????
	$(function() {
	    $("#temp_photo").on('change', function(){
	        readURL(this);
	    });
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	       var reader = new FileReader();
	       reader.onload = function (e) {
	          $('#imgpreview').attr('src', e.target.result);
	       }
	       reader.readAsDataURL(input.files[0]);
	    }
	}
	function Chk() {
		
		if(${empty id}){
			alert("????????? ??? ???????????????");
			return false;
		}else if(frm.lat.value == ''){
			alert("???????????? ????????? ???????????????");
			return false;
		}else if(frm.lng.value == ''){
			alert("???????????? ????????? ???????????????");
			return false;
		}else{
			var con = confirm("?????????????????????????");
			if(con){
				
			}else{
				return false;
			}
		}
	}
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
<script type="text/javascript">
	$(function() {
		$.post('/goat/member/chkAlert.do', "m_num=${m_num}", function(alert) {
			console.log(alert);
		});
	});
</script>
</head>
<body>
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav" style="margin-bottom: 0px;">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/goat/main/home.do#page-top">G.O.A.T</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/goat/main/home.do#map">Map</a></li>
					<li class="nav-item"><a id="active" class="nav-link active" href="/goat/place/placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/schedule/selectArea.do">Schedule</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/cs/csList.do">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/notice/noticeList.do">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/goat/trip/tripList.do">Trip</a></li>
					<c:if test="${empty id && empty admin }">
						<li class="nav-item"><a class="nav-link" href="/goat/member/loginForm.do">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="/goat/member/joinForm.do">Join</a></li>	
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
													<a role="menuitem" href="${path }/member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name } ??????????????????.</a>
												</li>
											</c:if>
											<c:if test="${list.day != 0 }">
												<li role="presentation">
													<a role="menuitem" href="${path }//member/alertSch.do?ale_num=${list.ale_num }&sch_num=${list.sch_num}">${list.sch_name }??? ${list.day}??? ???????????????.</a>
												</li>
											</c:if>
										</c:if>
										<c:if test="${list.temp_num!=0 && list.t_num==0 && list.sch_num==0 && list.cs_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertTp.do?ale_num=${list.ale_num}&temp_num=${list.temp_num }&place_num=${list.place_num}">${list.temp_name }??? ?????? ${list.temp_crud } ????????? 
													<c:if test="${list.del == 'y' }">
														?????? ?????????????????????
													</c:if>
													<c:if test="${list.del == 'd' }">
														?????? ?????????????????????
													</c:if>
												</a>
											</li>
										</c:if>
										<c:if test="${list.cs_num!=0 && list.temp_num==0 && list.t_num==0 && list.sch_num==0}">
											<li role="presentation">
												<a role="menuitem" href="${path }/member/alertCs.do?ale_num=${list.ale_num}&cs_num=${list.cs_num}">${list.cs_title }??? ????????? ??????????????? </a>
											</li>
										</c:if>
										<c:if test="${list.t_num!=0 && list.cs_num==0 && list.temp_num==0 && list.sch_num==0}">
											<li role="presentation">
												<c:if test="${list.t_like==1 && list.t_reply==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }??? ???????????? ??????????????? </a>
												</c:if>
												<c:if test="${list.t_reply==1 && list.t_like==0}">
													<a role="menuitem" href="${path }/member/alertTr.do?ale_num=${list.ale_num}&t_num=${list.t_num}">${list.t_title }??? ????????? ??????????????? </a>
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
<div align="center"><h2 class="text-primary" style="color: green; margin-top: 10%;"><b>?????? ?????? ??????</b></h2></div>
<br>
<div style="width: 100%;">
<div align="center" class="container" style="width: 85%;">
	<div style="display: flex; justify-content: center;">
		<div><img id="imgpreview" style="width:450px; height: 400px;" src="${place.place_photo }"> </div>
		<div id="map" style="width:450px; height: 400px;"></div>
	</div>	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6793d5f5043220bc08d64cb771c6c5b9&libraries=services"></script>
		<script>
			// ????????? ???????????? ???????????? ????????? ??????????????? ?????????
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // ????????? ????????? div 
			    mapOption = {
			        center: new kakao.maps.LatLng(${place.lat}, ${place.lng}), // ????????? ????????????
			        level: 3 // ????????? ?????? ??????
			    };  
			
			// ????????? ???????????????    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var markerPosition  = new kakao.maps.LatLng(${place.lat}, ${place.lng});
		    
			var marker = new kakao.maps.Marker({ // ????????? ????????? ????????? ???????????????
			    position: markerPosition
			});
			
			marker.setMap(map);
			
			function PS() {
				var place = frm.mapSearch.value;
				// ?????? ?????? ????????? ???????????????
				var ps = new kakao.maps.services.Places(); 
			
				// ???????????? ????????? ???????????????
				ps.keywordSearch(place, placesSearchCB); 
			
				// ????????? ?????? ?????? ??? ???????????? ???????????? ?????????
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
			
				        // ????????? ?????? ????????? ???????????? ?????? ????????? ?????????????????????
				        // LatLngBounds ????????? ????????? ???????????????
				        var bounds = new kakao.maps.LatLngBounds();
			
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
			
				        // ????????? ?????? ????????? ???????????? ?????? ????????? ??????????????????
				        map.setBounds(bounds);
				    } 
				}
				// ????????? ????????? ???????????? ???????????????
				function displayMarker(place) {}	
			}
			//??????-?????? ?????? ????????? ???????????????
			var geocoder = new kakao.maps.services.Geocoder();
			
			var infowindow = new kakao.maps.InfoWindow({zindex:1}); // ????????? ????????? ?????? ????????? ????????? ????????????????????????
			  
				
			// ?????? ?????? ??????????????? ????????? ???????????? ?????? ?????? ????????? ???????????????
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			
			// ????????? ???????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????? ???????????? ???????????????
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>??????????????? : ' + result[0].road_address.address_name + '</div>' : '';
			            detailAddr += '<div>?????? ?????? : ' + result[0].address.address_name + '</div>';
			            
			            var content = '<div class="bAddr">' +detailAddr +  '</div>';
			            
			            // ????????? ????????? ????????? ??????????????? 
			            marker.setPosition(mouseEvent.latLng);
			            marker.setMap(map);
			            
			            // ?????????????????? ????????? ????????? ?????? ?????? ??????????????? ???????????????
// 			            infowindow.setContent(content);
// 			            infowindow.open(map, marker);
			            
			
			            frm.lat.value ='';
			            frm.lng.value ='';
			            frm.temp_addr.value ='';
			            frm.temp_addrd.value ='';
			
			            frm.temp_addr.value = result[0].address.address_name;
			            if(result[0].road_address){
			            	frm.temp_addrd.value = result[0].road_address.address_name;	
			            }else{
			            	frm.temp_addrd.value = '????????????';
			            }
			            frm.lat.value = mouseEvent.latLng.getLat();
			            frm.lng.value = mouseEvent.latLng.getLng();
			            
			        }   
			    });
			});
			
			// ?????? ????????? ?????? ????????? ???????????? ??? ?????? ?????? ????????? ?????? ?????? ????????? ??????????????? ???????????? ???????????????
			kakao.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});
			
			function searchAddrFromCoords(coords, callback) {
			    // ????????? ?????? ????????? ???????????????
			    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
			}
			
			function searchDetailAddrFromCoords(coords, callback) {
			    // ????????? ?????? ?????? ????????? ???????????????
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
			
			// ?????? ??????????????? ?????? ??????????????? ?????? ??????????????? ???????????? ???????????????
			function displayCenterInfo(result, status) {
			  
			}
			</script>
		<form action="updateTempPlace.do" name="frm" onsubmit="return Chk()" method="post" enctype="multipart/form-data">			
			<input type="hidden" name="place_num" value="${place.place_num }">
			<input type="hidden" name="lat" value="${place.lat }">
			<input type="hidden" name="lng" value="${place.lng }">
			<div align="center" style="width: 77%; margin-left: 8%;">
			<table style="width: 90%; margin-top: 10px;">
				<tr><td style="width: 25%; margin-left: 3%;">
					<input type="file" name="file" class="form-control" id="temp_photo"></td>
					<td class="bgcolor" align="center" style="width: 10%;">?????? ??????</td>
					<td style="width: 34%;">
					<input type="text" class="form-control" style="width: 60%; display: inline;margin-left:5px; margin-right: 5px;" name="mapSearch">
					<input type="button" class="btn btn1" style="width: 16%; height: 40px;" onclick="PS()" value="??????"></td></tr>
			</table>
			<br>
			<table style="width: 75%;">
				<tr><td class="bgcolor" align="center" style="width: 18%;">?????? ??????  </td>
					<td style="width: 53%;">
						<input type="text" class="form-control" style="width: 50%; margin-left: 10px;" name="temp_name" autofocus="autofocus" required="required"
											value="${place.place_name }"></td></tr>
				<tr><td class="bgcolor" align="center">???????????? </td><td>
						<select name="temp_cate"  class="form-control" style="text-align:center; width: 18%; margin-left: 10px;">
							<c:if test="${place.place_cate == '?????????' }">
								<option value="?????????" selected="selected">?????????</option>
								<option value="??????">??????</option>
								<option value="?????????">?????????</option>
							</c:if>
							<c:if test="${place.place_cate == '??????' }">
								<option value="?????????">?????????</option>
								<option value="??????" selected="selected">??????</option>
								<option value="?????????">?????????</option>
							</c:if>
							<c:if test="${place.place_cate == '?????????' }">
								<option value="?????????">?????????</option>
								<option value="??????">??????</option>
								<option value="?????????" selected="selected">?????????</option>
							</c:if>
						</select></td>
				</tr>
				<tr><td class="bgcolor" align="center">??????</td>
					<td><input type="text" name="temp_tag" class="form-control" style="width: 70%; margin-left: 10px;" size="40" required="required" value="${place.place_tag }"></td></tr>
				<tr><td class="bgcolor" align="center">?????? ??????</td>
					<td><input type="text" name="temp_addr" class="form-control" style="width: 70%; margin-left: 10px;" size="40" required="required" value="${place.place_addr }"></td></tr>
				<tr><td class="bgcolor" align="center">????????? ??????</td>
					<td><input type="text" name="temp_addrd" class="form-control" style="width: 70%; margin-left: 10px;"  size="40" value="${place.place_addrd }"></td></tr>
				<tr><td class="bgcolor" align="center">?????? ??????</td>
				<td><textarea rows="5" cols="50" style="margin-left: 10px;" class="form-control" name="temp_content" required="required">${place.place_content }</textarea></td></tr>
				<tr><td class="bgcolor" align="center">?????? ??????</td>
				<td><textarea rows="5" cols="50" style="margin-left: 10px;" class="form-control" name="temp_explanation" required="required"></textarea></td></tr>
				<tr><td colspan="3" align="center">
					<input type="submit" style="margin-top: 5px;" class="btn btn1" value="????????????">
					<input type="button" style="margin-top: 5px;" class="btn btn-danger" onclick="history.back()" value="??????">
				</td></tr>
			</table>
			</div>
			
		</form>
	</div>
</div>
</body>
</html>