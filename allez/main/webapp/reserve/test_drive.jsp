<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- include --%>
<%@ include file="../dbConn.jsp"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 예약 신청</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
crossorigin="anonymous">
<!-- 네이버 지도 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a0qmzngqte&submodules=geocoder"></script>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 캘린더 -->
<link rel="stylesheet" href="../resources/js/index.global.js" />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script>
/*********************** 캘린더 ***********************/
document.addEventListener('DOMContentLoaded', function() {
	/* 오늘 날짜 */
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	if(month<10) month = "0"+month;
	
	var date = today.getDate();
	var thisDay = year+"-"+month+"-"+date;
	
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth', //월캘린더
    	locale:'ko', //한국어
    	/*** 캘린더 헤더 ***/
    	headerToolbar:{
    		left:'prev',
    		center:'title',
    		right:'next'
    	},
    	/*** 일정 등록 ***/
    	events: [
    		{	
    			groupId:'am',
    			startRecur: thisDay,
    			endRecur:'2023-12-31',
    			daysOfWeek: [ 1,2,3,4,5 ],
    			startTime: '10:30:00',
    		    endTime: '12:00:00'
    		    
   	    	},
   	    	{	
   	    		groupId:'pm',
   	    		startRecur: thisDay,
    			endRecur:'2023-12-31',
    			daysOfWeek: [ 1,2,3,4,5 ],
    			startTime: '16:30:00',
    		    endTime: '18:00:00'
   	    	}
    	]
    	
    	
    });
    
    calendar.render();
});
</script>
<style>
	body{
		overflow-x:hidden;
	}
	.jumbotron{
    	background-color : #fff;
    }
    
    /* 캐로셀 */
    .card-header{
    	background-color: #323232;
	}
	.card-header .btn-link{
		color:white;
	}
	.card-header .btn.focus, .card-header .btn:focus{
		box-shadow : none;
	}
	
	/* 지도 */
	#map{
		width:100%;
		height:745px;
	}
	
	/* 캘린더 */
	#calendar{
		width: 100%;
		height: 700px;	
	}
	
	.fc .fc-button-primary{
		background-color: #323232;
	}
	.fc .fc-col-header-cell-cushion, .fc .fc-daygrid-day-number{
		color:black;
	}
	.fc-day-sat .fc-daygrid-day-top a{
		color:blue;
	}
	.fc-day-sun .fc-daygrid-day-top a{
		color:red;
	}
	.fc-daygrid-event-dot{
		border:none;
	}
	.fc-event-time{
		color:#323232;
	}
	.fc .fc-daygrid-day.fc-day-today{
		background-color: #EEEEEE;
	}
	.fc-daygrid-dot-event:hover{
		background-color: #323232;
	}
	.fc-daygrid-dot-event:hover .fc-event-time{
		color:white;
	}
	.fc-event{
		cursor: pointer;
	}

	@media screen and (max-width: 992px) {
		.cs_fixed{
			position:static !important;
		}
	}
	@media screen and (max-width: 610px) {
		#map{
			height: 500px;	
		}
		.fc-event-time{
			font-size:12px;
		}
	}
	@media screen and (max-width: 550px) {
		
		.fc-event-time{
			font-size:10px;
		}
	}
	
	
</style>
<% 
	String sessionId = (String)session.getAttribute("sessionId");
	String result = (String)request.getAttribute("result");
	String model = request.getParameter("model");
%>
<script>
	function checkForm(){
		if(${sessionId == null}){
			alert("로그인해주세요.");
			location.href="../member/LoginMember.jsp";
			return false;
		}
		
		if(document.reservation.car_name.value == null || document.reservation.car_name.value == "") {
			alert("시승 모델을 선택하세요");
			return false;
		}
		if(document.reservation.place.value == null || document.reservation.place.value == ""){
			alert("시승 장소를 선택하세요.");
			return false;
		}
		if(document.reservation.drive_date.value == null || document.reservation.drive_date.value == "" || document.reservation.drive_time.value == null || document.reservation.drive_time.value == "") {
			alert("시승 일정을 선택하세요");
			return false;
		}
		
		
		document.reservation.submit();
	}
	
	if(${result == "fail"}){
		alert("이미 예약된 날짜입니다. 다른 일정을 선택해주세요.");
		
	} else if(${result == "success"}){
		alert("시승 예약 되었습니다. 마이페이지에서 예약 내역을 확인해주세요.");
	}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
		<h1 class="display-4">시승 예약</h1>
	    <hr class="mt-5">
	    <p class=""><small>시승 일정을 예약하세요.</small></p>
	</div>
  
	<div class="row mb-5 pb-5">
		<div class="col-lg-8">
			<div class="accordion mx-2" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left blink" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								1. 시승 모델
							</button>
						</h2>
					</div>
					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
							<div class="row">
								<div class="col-12" id="mNav">
								
									<a class="ml-2 btn btn-outline-danger blink" href='<c:url value="/reserve/processTDmodel.jsp?models=ev"/>' role="button">수소/전기차</a>
									<a class="btn btn-outline-warning blink" href='<c:url value="/reserve/processTDmodel.jsp?models=sedan"/>' role="button">승용차</a>
									<a class="btn btn-outline-success blink" href='<c:url value="/reserve/processTDmodel.jsp?models=suv"/>' role="button">SUV</a>
									<a class="btn btn-outline-primary blink" href='<c:url value="/reserve/processTDmodel.jsp?models=truck"/>' role="button">트럭</a>
								</div>
							</div> <!-- row -->	
							<div class="row">
								<%
								request.setCharacterEncoding("utf-8");
								
								String sql = "select * from car where carModel = ?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, model);
				
								rs = pstmt.executeQuery();
				
								while (rs.next()) {
								%>
								<div class="col-md-6 col-lg-4">
									<div class="thumbnail parent">
										<img src='../resources/images/<%=model%>/<%=rs.getString("car_image")%>'
											alt="" class="img-fluid carImage">
										<div class="caption text-center py-3">
											<button class="carName btn btn-outline-info blink" ><%=rs.getString("carname")%></button>
										</div>
									</div>
								</div>
								<%
								}
								if (pstmt != null)
								pstmt.close();
								if (conn != null)
								conn.close();
								if (rs != null)
								rs.close();
								%>
							</div> <%-- row --%>
							
							
						</div>
					</div>
				</div>
		
				<div class="card btnMap_open">
					<div class="card-header" id="headingTwo">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left collapsed blink" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								2. 시승 장소
							</button>
						</h2>
					</div>
					<div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionExample">
						<div class="card-body">
							<div class="row">
								<div class="col-xl-8 mb-2">
									<div id="map"></div>	
								</div>	
								<div class="col-xl-4">
									<div class="row">
										<div class="col-12">
											<div class="card blink">
												<div class="card-body">
											        <h5 class="card-title p_gn">현대자동차 강남시승센터</h5>
											        <small>02-544-5421</small>
											    	<p class="card-text">서울특별시 강남구 영동대로 302</p>
											    	<button id="gangnam" class="btn btn-block btn-primary ">선택</button>
												</div>
											</div>
											<div class="card my-2 blink">
												<div class="card-body">
											        <h5 class="card-title p_ys">현대 드라이빙라운지 용산</h5>
											        <small>02-466-5421</small>
											    	<p class="card-text">서울특별시 용산구 한강로동 316-1</p>
											    	<button id="yongsan" class="btn btn-block btn-primary ">선택</button>
												</div>
											</div>
											<div class="card blink">
												<div class="card-body">
											        <h5 class="card-title p_sc">현대 드라이빙라운지 서초</h5>
											        <small>02-3665-5421</small>
											    	<p class="card-text">서울특별시 서초구 서초동 1583-8</p>
											    	<button id="seocho" class="btn btn-block btn-primary ">선택</button>
												</div>
											</div>
											<div class="card mt-2 blink">
												<div class="card-body">
											        <h5 class="card-title p_sw">현대 드라이빙라운지 수원</h5>
											        <small>031-575-5421</small>
											    	<p class="card-text">경기도 수원시 팔달구 경수대로 500</p>
											    	<button id="suwon" class="btn btn-block btn-primary ">선택</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="card">
					<div class="card-header" id="headingThree">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left collapsed blink" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								3. 시승 일정
							</button>
						</h2>
					</div>
					<div id="collapseThree" class="collapse show" aria-labelledby="headingThree" data-parent="#accordionExample">
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									 <div id="calendar" ></div>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<div class="col-lg-4 cs_fixed">
			<div class="card mx-2 ">
				<h5 class="card-header text-white py-3">예약 정보</h5>
				<img src="" class="reserveImg card-img-top img-fluid">
				<div class="card-body">
					<form action="../reserve.cal" name="reservation" method="post">
						<table class="table table-hover">
							  <tr>
						      	  <th scope="row">시승 차량</th>
							      <td class="reserveCarName"></td>
							  </tr>
							  <tr>
						      	  <th scope="row">시승 장소</th>
							      <td class="reservePlace"></td>
							  </tr>
							  <tr>
						      	  <th scope="row">시승 일정</th>
							      <td class="reserveDate"></td>
							  </tr>
						</table>
						<div class="float-right">
							<input type="hidden" id="carName" name="car_name" value=""/>
							<input type="hidden" id="place" name="place" value=""/>
							<input type="hidden" id="drive_date" name="drive_date" value=""/>
							<input type="hidden" id="drive_time" name="drive_time" value=""/>
							<input type="hidden" name="id" value="<%=sessionId %>"/>
							<input type="hidden" id="image_url" name="image_url" value=""/>
							
							<button type="button" class="blink btn_cancel btn btn-danger mr-1">취소</button>
							<button type="button" class="blink btn btn-primary" onclick="checkForm()">신청</button>
						</div>
			    	</form>
			  	</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	
		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>	
<script>
$(function(){
	/*********************** 스크롤 픽스 ***********************/
	$(window).scroll(function() {  
		var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
		
    	if (position >= 0 && position < 1500){
			$('.cs_fixed').css({"position":"fixed","right":"0px","bottom":"0px"});
		
		}else if(position > 1500 && position <= 3000){
			$('.cs_fixed').css({"bottom":"390px"});
		
		}else{
			$('.cs_fixed').css({"position":"static"});	
		}
		
    });
	
	
	/*********************** 예약정보 취소 버튼 ***********************/
	var btn_cancel = $(".btn_cancel");
	btn_cancel.click(function(){
		location.reload();
	})
	
	
	
	
	/*********************** 사용자가 선택한 시승 모델 저장 ***********************/
	var btn_carName = $(".carName");	
	
	btn_carName.click(function(){
		var carName = $(this).text(); 
		var carImageUrl = $(this).closest(".parent").children(".carImage").attr("src");
		var reserveImg = $(".reserveImg");
		var reserveCarName = $(".reserveCarName");
		
		$("#carName").val(carName); //차이름 저장
		var url = carImageUrl.substr(3);
		$("#image_url").val(url); //이미지경로 저장
		
		reserveImg.attr("src", carImageUrl);
		reserveCarName.text(carName);
	})
	
	
	
	
	/*********************** 선택 버튼 클릭시 지도 이동 및 value값 저장 ***********************/
	var yongsan = new naver.maps.LatLng(37.5296669, 126.9673521),
		gangnam = new naver.maps.LatLng(37.5014242, 127.0678011),
		seocho = new naver.maps.LatLng(37.485387, 127.0111175),
		suwon = new naver.maps.LatLng(37.2704131, 127.0286223);
	
	var reservePlace = $(".reservePlace");
	
	$("#yongsan").on("click", function(e){
		e.preventDefault();
	    map.setCenter(yongsan);
	    
	    var place = $(".p_ys").text()
	    
	    $("#place").val(place);
	    
	    reservePlace.text(place);
	});
	
	$("#gangnam").on("click", function(e){
		e.preventDefault();
	    map.setCenter(gangnam);
	    
		var place = $(".p_gn").text()
	    
	    $("#place").val(place);
	    
	    reservePlace.text(place);
	});
	
	$("#seocho").on("click", function(e){
		e.preventDefault();
	    map.setCenter(seocho);
	    
		var place = $(".p_sc").text()
	    
	    $("#place").val(place);
	    
	    reservePlace.text(place);
	});
	
	$("#suwon").on("click", function(e){
		e.preventDefault();
	    map.setCenter(suwon);
	    
		var place = $(".p_sw").text()
	    
	    $("#place").val(place);
	    
	    reservePlace.text(place);
	});
	
	
	
	/************************* 일정 저장 ****************************/
    var btn_time = $(".fc-event");
	
    btn_time.addClass("blink");
	
	btn_time.click(function(){
		var time = $(this).text();
		var day = $(this).closest(".fc-daygrid-day-frame").children(".fc-daygrid-day-top").text();
		
		var reserveDate = $(".reserveDate");
		reserveDate.text("2023년 8월 "+day+" "+time);
		
		var reserveDay = "2023년 8월 "+day;
		
		$("#drive_date").val(reserveDay);
		$("#drive_time").val(time);
	})
	
	
	
	
	/*********************** 네이버 맵 ***********************/
	var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.521494, 127.034459), //지도 시작 지점
        zoom: 15
    });	
	
	var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
	areaArr.push(
			 {location : '현대 드라이빙라운지 서초' , lat : '37.485387' , lng : ' 127.0111175', address: '서울특별시 서초구 서초동 1583-8'},  
			 {location : '현대자동차 강남시승센터' , lat : '37.5014242' , lng : ' 127.0678011', address: '서울특별시 강남구 영동대로 302'},  
			 {location : '현대 드라이빙라운지 수원' , lat : '37.2704131' , lng : ' 127.0286223', address: '경기도 수원시 팔달구 경수대로 500'},  
			 {location : '현대 드라이빙라운지 용산' , lat : '37.5296669' , lng : '126.9673521', address: '서울특별시 용산구 한강로동 316-1'}
	);
	

	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	
	
	//지도 우측 컨트롤 속성
    var mapOptions = {
		mapTypeControl: true,
		mapTypeControlOptions: {
		    style: naver.maps.MapTypeControlStyle.BUTTON,
		    position: naver.maps.Position.TOP_RIGHT
		},
		zoomControl: true,
		zoomControlOptions: {
		    style: naver.maps.ZoomControlStyle.SMALL,
		    position: naver.maps.Position.TOP_RIGHT
		},
		scaleControl: true,
		scaleControlOptions: {
		    position: naver.maps.Position.RIGHT_BOTTOM
		}
    };

    var map = new naver.maps.Map(document.getElementById('map'), mapOptions); 
    
	for (var i = 0; i < areaArr.length; i++) {
		// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창 채우기

	    var marker = new naver.maps.Marker({
	        map: map,
	        title: areaArr[i].location, // 지역구 이름 
	        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
	    });
	    
	    /* 정보창 */
		 var infoWindow = new naver.maps.InfoWindow({
		     content: '<div style="width:280px;text-align:center;padding:10px;"><b>' 
		     + areaArr[i].location + 
		     '</b><br><p class="mt-2 adr">' + areaArr[i].address + '</p></div>'
		 }); // 클릭했을 때 띄워줄 정보 HTML 작성
		 
		 markers.push(marker); // 생성한 마커를 배열에 담는다.
		 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}
    
	
	
	/*********************** 사용자가 선택한 장소 ***********************/
    function getClickHandler(seq) {
		
        return function(e) {  // 마커를 클릭하는 부분
            var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

            if (infoWindow.getMap()) {
                infoWindow.close();
            } else {
                infoWindow.open(map, marker); // 보이기
            }
   		}
   	}
    
    for (var i=0, ii=markers.length; i<ii; i++) {
    	console.log(markers[i] , getClickHandler(i));
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
    }
    
});
	
	
	
	
	
</script>
</body>
</html>