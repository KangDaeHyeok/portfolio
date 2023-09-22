<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include -->
<%@ include file="../dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<link rel="stylesheet" href="../resources/css/list-groups.css">

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- check V -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

<!-- swap vert -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<title>견적 내기</title>
<style type="text/css">
/* 메인 스타일*/

body {
	overflow: hidden;
	box-sizing: border-box;
}

ul li, ol li {
	list-style: none;
}

.wh-100 {
	width: 100%;
	height: 100%;
}

.wh-98 {
	width: 98%;
	height: 98%;
}

#sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #000000;
	display: block;
	transition: 0.2s ease-in-out;
}

#sidenav a:hover, .offcanvas a:focus {
	color: #000;
}

.openmenu {
	top: 50%;
	right: 0;
	font-size: 30px;
	cursor: pointer;
	transition: 0.5s ease-in-out;
}

.openmenu:hover {
	color: rgb(0, 154, 200);
	transition: 0.5s ease-in-out;
}

.openmenu>i {
	font-size: 30px;
}

.openmenuUp {
	display: none;
}

.openmenuUp:hover {
	color: rgb(0, 154, 200);
	transition: 0.5s ease-in-out;
}

#main {
	transition: 0.5s ease-in-out;
}

#parent1 {
	position: fixed;
	bottom: 50px;
	left: 100px;
	z-index: 5;
}

#parent2 {
	position: fixed;
	z-index: 5;
	display: none;
}

.left-bottom {
	border: none;
	background-color: #fff !important;
	width: 45px;
	height: 45px;
	border-radius: 20px;
}

.cs_main {
	position: relative;
}

.cs_main .cs_main_top {
	position: absolute;
	top: 50px;
	left: 10px;
}

.imgbuild {
	position: relative;
	width: 100%;
	bottom: -140px;
}

.imgbuild-av {
	position: relative;
	width: 100%;
	bottom: -80px;
	right: 80px;
}

.p-25 {
	padding: 25px;
}

.up-down-auto {
	margin: auto 0 auto 0;
}

.btn {
	opacity: 0;
	display: none;
	padding-left: 5px;
}

.btn>label {
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.mt-30 {
	margin-top: 30px;
}

.m-1 {
	margin: 0.5%;
}

.fontWeigh-strong {
	font-size: 18px;
	font-weight: 600;
}

.fontWeigh-span {
	font-size: 18px;
	font-weight: 500;
}

.font-icon {
	font-size: 30px;
	font-weight: 400;
}

.img-set {
	/* margin-top: 15vw; */
	width: 1200px;
	height: 530px;
}

.img-fluid {
	/* max-width: 90% !important; */
	
}

.img-radius {
	border-radius: 50px;
	margin-right: 25px;
}

.options-container {
	padding: 0 5px;
}

.btn_white {
	position: relative;
	z-index: 1;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	padding: 0 18px;
	color: #05141f;
	background: #FFFFFF;
	text-align: center;
}

.btn_white:after {
	content: "";
	width: 0%;
	height: 100%;
	top: 0;
	position: absolute;
	left: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	z-index: -1;
}

.btn_white:hover {
	color: #000000;
}

.btn_white:hover:after {
	width: 100%;
	z-index: -1;
}

.btn_black {
	position: relative;
	z-index: 1;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	padding: 0 18px;
	color: #fff;
	background: #05141f;
	text-align: center;
}

.btn_black:after {
	content: "";
	width: 0%;
	height: 100%;
	top: 0;
	position: absolute;
	left: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	background: #F0F0F0;
	z-index: -1;
}

.btn_black:hover {
	color: #05141f;
}

.btn_black:hover:after {
	width: 100%;
	z-index: -1;
}

.display-inline {
	display: inline;
}

.ws-none {
	white-space: nowrap;
}

.ws-pre {
	white-space: pre;
}

.input-line-none {
	border: none;
	font-size: 28px;
	font-weight: 500;
	width: 180px;
	height: 70px;
}

.input-line-none:focus {
	outline: none;
}

.h-50p {
	height: 50px;
}

.color_list, .color_list2 {
	width: 100%;
	height: 40px;
	padding: 20px 0;
}

.color_list li, .color_list2 li {
	width: 50;
	HEIGHT: 50;
	position: RELATIVE;
	FLOAT: LEFT;
}

.color_list li img, .color_list2 li img {
	width: 38px;
	cursor: pointer;
	TOP: 0;
	MARGIN: 5px 10px;
}

.img_size {
	width: 100%;
	height: 170px;
	left: 0;
	top: 0;
}

.badge-size {
	width: 30px;
	height: 20px;
	position: relative;
	left: 15px;
	top: -160px;
}

.pb-2 {
	padding-bottom: 2%;
}

.h135 {
	height: 135px;
}

.bp15 {
	bottom: 15px;
	position: absolute;
}

.borderBlasck {
	border: 2px solid black;
	border-radius: 5px;
}

.check_circle1, .check_circle2, .check_circle3, .check_circle4,
	.check_circle5, .check_circle6, .check_circle7 {
	display: none;
}

.btn-black {
	background-color: #05141f;
	color: #F7F7F7;
	border-radius: 5px;
	border: solid black 1px;
	padding: 0 10px;
}

.btn-basic {
	background-color: #F7F7F7;
	color: #05141f;
	border-radius: 5px;
	border: solid black 1px;
	padding: 0 10px;
}


#sidenav::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  border-radius: 10px;
  background-color: #F5F5F5;
}

#sidenav::-webkit-scrollbar
{
  width: 12px;
  background-color: #F5F5F5;
}

#sidenav::-webkit-scrollbar-thumb
{
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
  background-color: #555;
}


/* 사이드바 스타일 */
#sidenav {
	height: 89%;
	position: fixed;
	z-index: 1;
	margin-top:100px;
	right: 0;
	overflow-x: hidden;
	bottom: 0px;
	transition: 0.5s ease-in-out;
	width: 530px;
	background-color: #fff;
	overflow-y: auto;
	
	/* 인터넷 익스플로러 */
	/*  -ms-overflow-style: none; */ 
	 /* 파이어폭스 */
    /* scrollbar-width: none; */ 
}
/* 크롬, 사파리, 오페라, 엣지 */
/*  #sidenav::-webkit-scrollbar {
    display: none; 
} */

#sidenav.on {
	width: 530px;
	right: -530px;
}

#main {
	margin-right: 300px;
}

#main.on {
	margin-right: 0px;
}

/*1)laptop컴퓨터용
		디바이스 장치가 최소 1200일 때=> 모니터 크기가 1200px이상일 때*/
@media screen and (max-width: 1780px) {
	.imgbuild {
		position: relative;
		width: 90%;
		left: -20px;
	}
	.imgbuild-av {
		position: relative;
		width: 100%;
		bottom: -80px;
		right: 100px;
	}
}

@media screen and (max-width: 1500px) {
	.imgbuild-av {
		position: relative;
		width: 100%;
		bottom: -80px;
		right: 120px;
	}
}

@media screen and (max-width: 1280px) {
	.imgbuild-av {
		position: relative;
		width: 95%;
		bottom: -100px;
		right: 100px;
	}
}

@media screen and (max-width: 1199px) {
	.imgbuild {
		position: relative;
		width: 90%;
		left: -50px;
		bottom: -250px;
	}
	.imgbuild-av {
		position: relative;
		width: 90%;
		bottom: -120px;
		right: 80px;
	}
}

@media screen and (max-width: 1100px) {
	.imgbuild {
		position: relative;
		width: 90%;
		left: -50px;
		bottom: -250px;
	}
	.imgbuild-av {
		position: relative;
		width: 85%;
		bottom: -160px;
		right: 80px;
	}
}

@media screen and (max-width: 992px) {
	.openmenu {
		display: none;
	}
	#parent2{
		display: block;
	}
	.openmenuUp {
		display: block;
		right: 20px;
	}
	.up-down-btn {
		position: fixed;
		background-color: #fff;
		width: 99.5%;
		z-index: 5;
		margin-top: -20px;
	}
	.imgbuild {
		position: relative;
		width: 100%;
		bottom: -100px;
		left: 0px;
	}
	.imgbuild-av {
		position: relative;
		width: 100%;
		bottom: -120px;
		right: 20px;
	}

	/* 사이드바 스타일 */
	#sidenav {
		height: 300px;
		position: fixed;
		z-index: 3;
		/* top: 56.5%; */
		overflow-x: hidden;
		transition: 0.5s ease-in-out;
		padding-top: 20px;
		width: 100%;
		background-color: #fff;
		overflow-y: scroll;
		right: 0;
	}
	#sidenav.up {
		height: 68.5%;
		bottom: 0;
		
	}

	#main {
		margin-right: 0;
		margin-top: 0;
	}
}

@media screen and (max-width: 810px) {
	.imgbuild {
		position: relative;
		width: 100%;
		bottom: -150px;
		left: 0px;
	}
	.imgbuild-av {
		position: relative;
		width: 100%;
		bottom: -160px;
		right: 20px;
	}
}

@media screen and (max-width: 550px) {
	.imgbuild {
		position: relative;
		width: 100%;
		bottom: -200px;
		left: 0px;
	}
	.imgbuild-av {
		position: relative;
		width: 100%;
		bottom: -220px;
		right: 20px;
	}
}

</style>

<%
String carname = request.getParameter("carname");

String sql = "select * from car where carname = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, carname);

rs = pstmt.executeQuery();
%>
</head>
<script>
	function TotalPrice() {
		var total = 0;
		var trim = 0;
		var won = "원";
		var option = 0;
		var check1 = $(".check_circle1");
		var check2 = $(".check_circle2");
		var check3 = $(".check_circle3");
		var check4 = $(".check_circle4");
		var check5 = $(".check_circle5");
		var check6 = $(".check_circle6");
		var check7 = $(".check_circle7");

		var trimname = "";
		var LGRadio = document.totalform.LGRadio;
		var trimName = document.totalform.trimName;

		var engine = document.totalform.filter_engine;
		var transmission = document.totalform.filter_transmission;

		for (i = 0; i < LGRadio.length; i++) {
			if (LGRadio[i].checked == true) {
				trim = eval(LGRadio[i].value);
				trimname = trimName[i].value;
			}
		}

		for (i = 0; i < engine.length; i++) {
			if (engine[i].checked == true) {

				var engineCkeck1 = $(".engine1");
				var engineCkeck2 = $(".engine2");

				if (i == 0) {
					engineCkeck1.addClass("btn-black");
					engineCkeck1.removeClass("btn-basic");
					engineCkeck2.addClass("btn-basic");
					engineCkeck2.removeClass("btn-black");
				} else if (i == 1) {
					engineCkeck2.addClass("btn-black");
					engineCkeck2.removeClass("btn-basic");
					engineCkeck1.addClass("btn-basic");
					engineCkeck1.removeClass("btn-black");
				}
			}
		}

		for (i = 0; i < transmission.length; i++) {
			if (transmission[i].checked == true) {

				var missionAt = $(".transmission1");
				var missionDct = $(".transmission2");

				if (i == 0) {
					missionAt.addClass("btn-black").removeClass("btn-basic");
					missionDct.addClass("btn-basic").removeClass("btn-black");

				} else if (i == 1) {
					missionDct.addClass("btn-black").removeClass("btn-basic");
					missionAt.addClass("btn-basic").removeClass("btn-black");
				}
			}
		}

		var HudPrice = document.totalform.HudPrice;
		var DriveWisePrice = document.totalform.DriveWisePrice;
		var SunRoopPrice = document.totalform.SunRoopPrice;
		var SmartConnectPrice = document.totalform.SmartConnectPrice;
		var ComfortPrice = document.totalform.ComfortPrice;
		var HarmanKardonPrice = document.totalform.HarmanKardonPrice;
		var HighTechPrice = document.totalform.HighTechPrice;

		var WheelPrice = document.totalform.WheelPrice;
		var AComfortPrice = document.totalform.AComfortPrice;
		var SheetPrice = document.totalform.SheetPrice;
		var ASunRoopPrice = document.totalform.ASunRoopPrice;
		var carname1 = $(".carnameNA");

		if (carname1.text() == "니로 EV") {
			if (HudPrice.checked == true) {
				check1.show();
				option = Number(option) + Number(HudPrice.value);
				check1.parent().parent().parent().addClass("borderBlasck");
			} else {
				check1.hide();
				check1.parent().parent().parent().removeClass("borderBlasck");
			}/* check1 */

			if (DriveWisePrice.checked == true) {
				check2.show();
				option = Number(option) + Number(DriveWisePrice.value);
				check2.parent().parent().parent().addClass("borderBlasck");
			} else {
				check2.hide();
				check2.parent().parent().parent().removeClass("borderBlasck");
			}/* check2 */

			if (SunRoopPrice.checked == true) {
				check3.show();
				option = Number(option) + Number(SunRoopPrice.value);
				check3.parent().parent().parent().addClass("borderBlasck");
			} else {
				check3.hide();
				check3.parent().parent().parent().removeClass("borderBlasck");
			}/* check3 */

			if (SmartConnectPrice.checked == true) {
				check4.show();
				option = Number(option) + Number(SmartConnectPrice.value);
				check4.parent().parent().parent().addClass("borderBlasck");
			} else {
				check4.hide();
				check4.parent().parent().parent().removeClass("borderBlasck");
			}/* check4 */

			if (ComfortPrice.checked == true) {
				check5.show();
				option = Number(option) + Number(ComfortPrice.value);
				check5.parent().parent().parent().addClass("borderBlasck");
			} else {
				check5.hide();
				check5.parent().parent().parent().removeClass("borderBlasck");
			}/* check5 */

			if (HarmanKardonPrice.checked == true) {
				check6.show();
				option = Number(option) + Number(HarmanKardonPrice.value);
				check6.parent().parent().parent().addClass("borderBlasck");
			} else {
				check6.hide();
				check6.parent().parent().parent().removeClass("borderBlasck");
			}/* check6 */

			if (HighTechPrice.checked == true) {
				check7.show();
				option = Number(option) + Number(HighTechPrice.value);
				check7.parent().parent().parent().addClass("borderBlasck");
			} else {
				check7.hide();
				check7.parent().parent().parent().removeClass("borderBlasck");
			}/* check7 */
		} else if (carname1.text() == "Avante") {
			if (WheelPrice.checked == true) {
				check1.show();
				option = Number(option) + Number(WheelPrice.value);
				check1.parent().parent().parent().addClass("borderBlasck");
			} else {
				check1.hide();
				check1.parent().parent().parent().removeClass("borderBlasck");
			}/* check1 */

			if (ASunRoopPrice.checked == true) {
				check2.show();
				option = Number(option) + Number(ASunRoopPrice.value);
				check2.parent().parent().parent().addClass("borderBlasck");
			} else {
				check2.hide();
				check2.parent().parent().parent().removeClass("borderBlasck");
			}/* check2 */

			if (SheetPrice.checked == true) {
				check3.show();
				option = Number(option) + Number(SheetPrice.value);
				check3.parent().parent().parent().addClass("borderBlasck");
			} else {
				check3.hide();
				check3.parent().parent().parent().removeClass("borderBlasck");
			}/* check3 */

			if (AComfortPrice.checked == true) {
				check4.show();
				option = Number(option) + Number(AComfortPrice.value);
				check4.parent().parent().parent().addClass("borderBlasck");
			} else {
				check4.hide();
				check4.parent().parent().parent().removeClass("borderBlasck");
			}/* check4 */
		}

		/* } */

		total = Number(trim) + Number(option);

		function Comma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			return num.toString().replace(regexp, ',');
		}

		var totalComma = Comma(total);

		document.totalPrice.price.value = totalComma + won;

		/* sidenav */
		var SNTrim = $(".sidenavTrim");
		var SNColor = $(".sidenavColor");
		var SNOption = $(".sidenavOption");

		/* button */
		var trim_Color = $(".GColor"); /* 1p */
		var color_trim = $(".BTrim"); /* 2p - 1 */
		var color_Option = $(".GOption"); /* 2p - 2 */
		var option_Color = $(".BColor"); /* 3p - 1 */

		trim_Color.click(function() {/* 컬러 선택 */
			SNColor.show();
			SNTrim.hide();
		})

		color_trim.click(function() { /* 트림 선택 */
			SNTrim.show();
			SNColor.hide();
		})

		color_Option.click(function() { /* 옵션 선택 */
			SNOption.show();
			SNColor.hide();
		})

		option_Color.click(function() { /* 컬러선택 */
			SNColor.show();
			SNOption.hide();
		})

	}/* function TotalPrice() */
</script>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />

	<div id="sidenav" class="md-sidenav">
		<div class="row up-down-btn">
			<div class="col-12" style="height: 50px">
				<div id="parent2" style="left: 48.5%;">
					<button id="sideUBtn" class="openmenuUp left-bottom blink"
						onfocus="blur()">
						<span class="material-symbols-outlined font-icon mx-auto">swap_vert</span>
					</button>
				</div>
			</div>
			<div id="parent1">
				<button id="sideBtn" class="openmenu left-bottom blink" onfocus="blur()">
					<span class="material-symbols-outlined font-icon">swap_horiz</span>
				</button>
			</div>
		</div>
		<form action="build_board.jsp" id="form1" name="totalform"
			method="post">
			<!-- sidenavTrim -->
			<div class="sidenavTrim t-1">
				<div class="p-25">
					<%-- <h1><%=carN%></h1> --%>
					<h1><%=carname%></h1>
					<hr class="mt-4 mb-4" />
					<h2>트림 선택</h2>

					<div class="position-relative">
						<label class="list-group-item py-3 pe-5" for="listGroupRadioGrid4">
							<br />
							<div class="row">
								<div class="title-container mr-5 ml-2 ">
									<div class="title">엔진</div>
								</div>
								<div class="options-container blink">

									<%
									if (carname.equals("니로 EV")) {
									%>
									<input type="radio"
										class="btn form-check-input position-absolute top-50 end-0 me-3 fs-5"
										id="filter_ev" name="filter_engine" value="EV 전기차" checked
										onclick='javascript:TotalPrice()' /> <label
										class="label-radio btn-black engine1" for="filter_ev">EV
										전기차</label>
									<%
									} else if (carname.equals("Avante")) {
									%>

									<input type="radio"
										class="form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
										id="filter_gasoline1" name="filter_engine" value="가솔린 1.6"
										checked onclick='javascript:TotalPrice()' /> <label
										class="label-radio btn-black engine1" for="filter_gasoline1">가솔린
										1.6</label> <input type="radio"
										class="form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
										id="filter_gasoline2" name="filter_engine" value="가솔린 1.6 터보"
										onclick='javascript:TotalPrice()' /> <label
										class="label-radio btn-basic engine2" for="filter_gasoline2">가솔린
										1.6 터보</label>
									<%
									}
									%>
								</div>
							</div>
							

							<div class="row">
								<div class="title-container mr-5 ml-2">
									<div class="title">미션</div>
								</div>
								<div class="options-container blink">
									<%
									if (carname.equals("니로 EV")) {
									%>
									<input type="radio"
										class="form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
										id="filter_2WDAT" name="filter_transmission" value="2WD A/T"
										checked /> <label class="label-radio btn-black transmission1"
										for="filter_2WDAT">2WD A/T</label>

									<%
									} else if (carname.equals("Avante")) {
									%>

									<input type="radio"
										class="form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
										id="filter_AT" name="filter_transmission" value="A/T" checked
										onclick='javascript:TotalPrice()' /> <label
										class="label-radio btn-black transmission1" for="filter_AT">A/T</label>
									<input type="radio"
										class="form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
										id="filter_Dct" name="filter_transmission" value="DCT"
										onclick='javascript:TotalPrice()' /> <label
										class="label-radio btn-basic transmission2" for="filter_Dct">DCT</label>

									<%
									}
									%>
								</div>
							</div>
						</label>
					</div>


					<div
						class="list-group list-group-radio d-grid gap-2 border-0 w-auto mt-30 col-12 blink">

						<%
						if (carname.equals("니로 EV")) {
						%>

						<div class="position-relative col-12 ">
							<input type="hidden" name="trimName" value="에어" /> <input
								class=" form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
								type="radio" name="LGRadio" id="radioAir" value="51140000"
								checked onclick='javascript:TotalPrice()' /> <label
								class="list-group-item py-3 pe-5" for="radioAir"> <strong
								class="fw-semibold fontWeigh-strong">에어</strong> <span
								class="d-block small opacity-75 fontWeigh-span">51,140,000원</span>
							</label> <input type="hidden" name="trimName" value="어스" /> <input
								class=" form-check-input position-absolute top-50 end-0 me-3 fs-5 btn"
								type="radio" name="LGRadio" id="radioEarth" value="53930000"
								onclick='javascript:TotalPrice()' /> <label
								class="list-group-item py-3 pe-5" for="radioEarth"> <strong
								class="fw-semibold fontWeigh-strong">어스</strong> <span
								class="d-block small opacity-75 fontWeigh-span">53,930,000원</span>
							</label>
						</div>
						<!-- div position-relative -->
						<%
						} else if (carname.equals("Avante")) {
						%>
						<div class="position-relative">
							<input type="hidden" name="trimName" value="트렌디" /> <input
								class=" form-check-input position-absolute top-50 end-0 me-3 fs-5 btn blink"
								type="radio" name="LGRadio" id="radioTrendy" value="18250000"
								checked onclick='javascript:TotalPrice()' /> <label
								class="list-group-item py-3 pe-5" for="radioTrendy"> <strong
								class="fw-semibold fontWeigh-strong">트렌디</strong> <span
								class="d-block small opacity-75 fontWeigh-span">18,250,000원</span>
							</label>
						</div>
						<!-- div position-relative -->

						<div class="position-relative">
							<input type="hidden" name="trimName" value="프레스티지" /> <input
								class=" form-check-input position-absolute top-50 end-0 me-3 fs-5 btn blink"
								type="radio" name="LGRadio" id="radioPrestige" value="21510000"
								onclick='javascript:TotalPrice()' /> <label
								class="list-group-item py-3 pe-5" for="radioPrestige"> <strong
								class="fw-semibold fontWeigh-strong">프레스티지</strong> <span
								class="d-block small opacity-75 fontWeigh-span">21,510,000원</span>
							</label>
						</div>
						<!-- div position-relative -->

						<div class="position-relative">
							<input type="hidden" name="trimName" value="시그니처" /> <input
								class=" form-check-input position-absolute top-50 end-0 me-3 fs-5 btn blink"
								type="radio" name="LGRadio" id="radioSignature" value="25070000"
								onclick='javascript:TotalPrice()' /> <label
								class="list-group-item py-3 pe-5" for="radioSignature">
								<strong class="fw-semibold fontWeigh-strong">시그니처</strong> <span
								class="d-block small opacity-75 fontWeigh-span">25,070,000원</span>
							</label>
						</div>
						<!-- div position-relative -->

						<div class="position-relative">
							<input type="hidden" name="trimName" value="GT" /> <input
								class=" form-check-input position-absolute top-50 end-0 me-3 fs-5 btn blink"
								type="radio" name="LGRadio" id="radioGranTurismo"
								value="27840000" onclick='javascript:TotalPrice()' /> <label
								class="list-group-item py-3 pe-5" for="radioGranTurismo">
								<strong class="fw-semibold fontWeigh-strong">GT</strong> <span
								class="d-block small opacity-75 fontWeigh-span">27,840,000원</span>
							</label>
						</div>
						<!-- div position-relative -->
						<%
						}
						%>

					</div>
					<!-- div list-group-radio -->

				</div>
				<!-- div p-25 -->
				<hr />
				<div class="container-fluid pb-3 mb-5">
					<div class="row h-50p">
						<div class="col-12 blink pb-1">
							<button type="button"
								class="btn-dark wh-100 GColor btn_black col-12 m-1 ">컬러
								선택</button>
						</div>
						<!-- div col-6 col-12 -->
					</div>
					<!-- div row h-50p -->
				</div>
				<!-- div container-fluid pb-3 -->
			</div>
			<!-- div sidenavTrim -->

			<!------------------------------------------------------------------------------------------------------------->

			<!-- sidenav sidenavColor -->
			<div class="sidenavColor t-1" style="display: none">
				<!--  style="display: none;" -->
				<div class="p-25">
					<h1><%=carname%></h1>
					<hr class="mt-4 mb-4" />
					<h2>컬러 선택</h2>

					<div class="position-relative container">
						<label class="list-group-item py-3 pe-5" for="listGroupRadioGrid4">
							<br />
							<div class="row">
								<div class="title-container mr-5 ml-2">
									<h5 class="d-flex align-items-center">외장</h5>
								</div>
							</div> <%
 if (carname.equals("니로 EV")) {
 %>
							<div class="color_name niroEv ">스틸 그레이</div>
							<div class="d-flex">
								<ul class="color_list">
									<li class="ml-4"><input type="hidden" name="car_img"
										value="klg_01.png" /> <input type="hidden"
										name="outColor_img" value="klg.png" /> <input type="radio"
										id="outcolor1" name="OutColor" value="스틸 그레이" checked
										class="btn blink" /><label for="incolor1"> <img
											src="../resources/images/cars/niro_EV/klg.png" alt="" class="blink">
									</label></li>
									<li><input type="hidden" name="car_img" value="cge_01.png" />
										<input type="hidden" name="outColor_img" value="cge.png" /> <input
										type="radio" id="outcolor2" name="OutColor" value="시티스케이프 그린"
										class="btn blink" /> <label for="outcolor2"> <img
											src="../resources/images/cars/niro_EV/cge.png" alt="" class="blink">
									</label></li>
									<li><input type="hidden" name="car_img" value="m4b_01.png" />
										<input type="hidden" name="outColor_img" value="m4b.png" /> <input
										type="radio" id="outcolor3" name="OutColor" value="미네랄 블루"
										class="btn blink" /> <label for="outcolor3"> <img
											src="../resources/images/cars/niro_EV/m4b.png" alt="" class="blink">
									</label></li>
									<li><input type="hidden" name="car_img" value="cr5_01.png" />
										<input type="hidden" name="outColor_img" value="cr5.png" /> <input
										type="radio" id="outcolor4" name="OutColor" value="런웨이 레드"
										class="btn blink" /> <label for="outcolor4"> <img
											src="../resources/images/cars/niro_EV/cr5.png" alt="" class="blink">
									</label></li>
								</ul>
							</div> <%
 } else if (carname.equals("Avante")) {
 %>
							<div class="color_name avante">퍼포먼스 블루</div>
							<div class="d-flex">
								<ul class="color_list">
									<li class="ml-4"><input type="hidden" name="car_img"
										value="pBlue.png" /> <input type="radio" id="outcolor1"
										name="OutColor" value="퍼포먼스 블루" checked class="btn blink" /> <label
										for="outcolor1"> <input type="hidden"
											name="outColor_img" value="colorchip-bluep.png" /> <img
											src="../resources/images/cars/avante/colorchip-bluep.png"
											alt="" class="img-radius blink">
									</label></li>
									<li class="ml-4"><input type="hidden" name="car_img"
										value="pBlack.png" /> <input type="radio" id="outcolor2"
										name="OutColor" value="어피스 블랙 펄" class="btn blink" /> <label
										for="outcolor2"> <input type="hidden"
											name="outColor_img" value="colorchip-black.png" /> <img
											src="../resources/images/cars/avante/colorchip-black.png"
											alt="" class="img-radius blink">
									</label></li>
								</ul>
							</div> <%
 }
 %>

							<hr class="mr-4 ml-4" />
							<div class="row">
								<div class="title-container mr-5 ml-2">
									<h5 class="d-flex align-items-center">내장</h5>
								</div>
							</div>
							<div class="color_name2">챠콜</div>
							<div class="d-flex">
								<ul class="color_list2">
									<li class="ml-4"><input type="radio" id="incolor1"
										name="InColor" value="챠콜" class="btn" checked /> <label
										for="incolor1"> <input type="hidden"
											name="inColor_img" value="ccv.png" /> <img
											src="../resources/images/cars/niro_EV/ccv.png" alt="" class="blink">
									</label></li>
									<li class="ml-4"><input type="radio" id="incolor2"
										name="InColor" value="라이트 그레이 투톤" class="btn" /> <label
										for="incolor2"> <input type="hidden"
											name="inColor_img" value="ewr.png" /> <img
											src="../resources/images/cars/niro_EV/ewr.png" alt=""  class="blink">
									</label></li>
								</ul>
							</div>
						</label>
					</div>

				</div>
				<!-- div p-25 -->
				<hr />
				<div class="container-fluid pb-3 mb-5">
					<div class="row h-50p pb-1 blink">
						<div class="col-6 ">
							<button type="button" class="btn-dark wh-100 BTrim btn_black m-1">트림
								선택</button>
						</div>
						<div class="col-6">
							<button type="button"
								class="btn-dark wh-100 GOption btn_black m-1">옵션 선택</button>
						</div>
						<!-- div col-6 col-12 -->
					</div>
					<!-- div row h-50p -->
				</div>
				<!-- div container-fluid pb-3 -->
			</div>
			<!-- div sidenavColor  -->

			<!------------------------------------------------------------------------------------------------------------->

			<!-- sidenavOption -->
			<div class="sidenavOption t-1" style="display: none">

				<!-- style="display: none;" -->
				<div class="p-25">
					<%-- <h1><%=carN%></h1> --%>
					<h1><%=carname%></h1>
					<hr class="mt-4 mb-4" />
					<h2>옵션 선택</h2>

					<div class="position-relative">
						<label class=" py-3 pe-5" for="listGroupRadioGrid4"> <br />
							<div class="row">

								<div class="options-container">


									<div class="col">

										<%
										if (carname.equals("니로 EV")) {
										%>
										<div class="row">

											<label for="HUD" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/headup_th.jpg"
														class="img_size" alt="...">
													<div class="badge-size">
														<span class="badge badge-light">인기</span>
													</div>
													<div class="card-body h135">
														<input type="hidden" name="Hud" value="HUD" /> <input
															type="checkbox" name="HudPrice" id="HUD" value="590000"
															onclick='javascript:TotalPrice()' class="btn">
														<h5 class="card-title">HUD</h5>
														<p class="card-text bp15 ">
															590,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle1">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- HUD -->

											<label for="DriveWise" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/fca2_th.jpg"
														class="img_size" alt="...">
													<div class="badge-size">
														<span class="badge badge-light">인기</span>
													</div>
													<div class="card-body h135">
														<input type="hidden" name="DriveWise" value="드라이브 와이즈" />
														<input type="checkbox" name="DriveWisePrice"
															id="DriveWise" value="890000"
															onclick='javascript:TotalPrice()' class="btn">
														<h5 class="card-title">드라이브 와이즈</h5>
														<p class="card-text bp15 ">
															890,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle2">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- DriveWise -->

											<label for="SunRoop" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/sunroof_th.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="SunRoop" value="선루프+LED 실내등" />
														<input type="checkbox" name="SunRoopPrice" id="SunRoop"
															value="450000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">선루프+LED 실내등</h5>
														<p class="card-text bp15 ">
															450,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle3">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- SunRoop -->

											<label for="SmartConnect" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/kia2_th.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="SmartConnect" value="스마트 커넥트" />
														<input type="checkbox" name="SmartConnectPrice"
															id="SmartConnect" value="890000"
															onclick='javascript:TotalPrice()' class="btn">
														<h5 class="card-title">스마트 커넥트</h5>
														<p class="card-text bp15 ">
															890,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle4">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- SmartConnect -->

											<label for="Comfort" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/ims_th.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="Comfort" value="컴포트" /> <input
															type="checkbox" name="ComfortPrice" id="Comfort"
															value="940000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">컴포트</h5>
														<p class="card-text bp15 ">
															940,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle5">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- Comfort -->

											<label for="HarmanKardon" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/premium8_th.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="HarmanKardon" value="하만/카돈 사운드" />
														<input type="checkbox" name="HarmanKardonPrice"
															id="HarmanKardon" value="590000"
															onclick='javascript:TotalPrice()' class="btn">
														<h5 class="card-title">하만/카돈 사운드</h5>
														<p class="card-text bp15 ">
															590,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle6">check_circle</span>
														</p>
													</div>
												</div>
											</label>
											<!-- HarmanKardon -->

											<label for="HighTech" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/spt_th.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="HighTech" value="하이테크" /> <input
															type="checkbox" name="HighTechPrice" id="HighTech"
															value="790000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">하이테크</h5>
														<p class="card-text bp15 ">
															790,000<small class="text-muted"> 원</small> <span
																class="check_circle7 material-symbols-outlined ">check_circle</span>
														</p>
													</div>
												</div>
											</label>
											<!-- HighTech -->
										</div>
										<!-- row -->
										<%
										} else if (carname.equals("Avante")) {
										%>
										<div class="row">

											<label for="Wheel" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/04319wheel_s.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="wheel" value="19인치 초경량 단조 휠" />
														<input type="checkbox" name="WheelPrice" id="Wheel"
															value="790000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">19인치 초경량 단조 휠</h5>
														<p class="card-text bp15 ">
															790,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle1">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- 19Wheel -->

											<label for="ASunRoop" class="col-6 pb-2 blink">
												<div class="card ">
													<img src="../resources/images/option/044sunroof_s.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="ASunRoop" value="선루프" /> <input
															type="checkbox" name="ASunRoopPrice" id="ASunRoop"
															value="450000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">선루프</h5>
														<p class="card-text bp15 ">
															450,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle2">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- ASunRoop -->

											<label for="Sheet" class="col-6 pb-2 blink">
												<div class="card ">
													<img
														src="../resources/images/option/060nsportsbucket_s.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="Sheet" value="N 라이트 스포츠 버킷 시트" />
														<input type="checkbox" name="SheetPrice" id="Sheet"
															value="1090000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">N 라이트 스포츠 버킷 시트</h5>
														<p class="card-text bp15 ">
															1,090,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle3">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- Sheet -->

											<label for="AComfort" class="col-6 pb-2 blink">
												<div class="card">
													<img src="../resources/images/option/061rearheated_s.jpg"
														class="img_size" alt="...">
													<div class="card-body h135">
														<input type="hidden" name="AComfort" value="N 컴포트" /> <input
															type="checkbox" name="AComfortPrice" id="AComfort"
															value="590000" onclick='javascript:TotalPrice()'
															class="btn">
														<h5 class="card-title">N 컴포트</h5>
														<p class="card-text bp15 ">
															590,000<small class="text-muted"> 원</small> <span
																class="material-symbols-outlined check_circle4">check_circle</span>
															<!-- check_circlez -->
														</p>
													</div>
												</div>
											</label>
											<!-- AComfort -->

										</div>
										<!-- row -->
										<%
										}
										%>

									</div>
									<!-- col -->
								</div>

							</div> <!-- row -->
						</label>
					</div>

				</div>
				<!-- div p-25 -->
				<hr />
				<div class="container-fluid pb-3 mb-5">
					<div class="row h-50p  mb-5 pb-1 blink">
						<div class="col-6">
							<button type="button"
								class="btn-dark wh-100 BColor btn_black m-1">컬러 선택</button>
						</div>
						<div class="col-6 ">
							<button type="submit" form="form1"
								class="btn-dark wh-100 setClear btn_black m-1">견적 완료</button>
						</div>
						<!-- div col-6 col-12 -->
					</div>
					<!-- div row h-50p -->
				</div>
				<!-- div container-fluid pb-3 -->
			</div>
			<!-- div sidenavOption  -->
			<input type="hidden" value="<%=carname%>" name="carname" />
		</form>
		<!-- form ac = build_board.jsp -->
	</div>
	<!-- sidenav -->
	<%
	while (rs.next()) {
		int pri = Integer.parseInt(rs.getString("price"));
		NumberFormat numberFormat = NumberFormat.getInstance();
		String price = numberFormat.format(pri);
		String carModel = rs.getString("carModel");
		String carImage = rs.getString("car_image");
	%>

	<div id="main" class="md-main" >
		<div class="cs_main bgc-g">
			<div class="cs_main_top pl-3 text-black">
				<form name="totalPrice">
					<h2 class="carnameNA"><%=carname%></h2>
					<p>총 차량 가격</p>
					<input class="input-line-none totalPrice" type="text" name="price"
						readonly value="<%=price%>원" />
				</form>
			</div>




		</div>

		<div class="p-25" >
			<div>
				<%
				if (carname.equals("니로 EV")) {
				%>
				<img src="../resources/images/cars/niro_EV/klg_01.png" alt=""
					class="img-fluid car_image imgbuild" />
				<%
				} else if (carname.equals("Avante")) {
				%>
				<img src="../resources/images/cars/avante/pBlue.png" alt=""
					class="img-fluid car_image imgbuild-av" />

				<%
				}
				%>



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
	</div>

	
	
	
	<!-- bootstrap js cdn -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<script>
		$(document)
				.ready(
						function() {

							var sidenav = $("#sidenav");
							var main = $("#main");
							var sideBtn = $("#sideBtn");
							sideBtn.click(function() {
								sidenav.toggleClass("on");
								main.toggleClass("on");
								event.preventDefault();
								event.stopPropagation();
							})

							var sideUBtn = $("#sideUBtn");
							sideUBtn.click(function() {
								sidenav.toggleClass("up");
								main.toggleClass("up");
								event.preventDefault();
								event.stopPropagation();
							})

							/* var radioGranTurismo = $("#radioGranTurismo"); */
							var GtTrig1 = $("#filter_gasoline2+label");
							var GtTrig2 = $("#filter_gasoline1+label");
							$("input#radioGranTurismo").click(
									function() {
										GtTrig1.removeClass("btn-basic")
												.addClass("btn-black");
										GtTrig2.removeClass("btn-black")
												.addClass("btn-basic");
										GtTrig1.trigger("click");

									})

							/* sidenav */
							var SNTrim = $(".sidenavTrim");
							var SNColor = $(".sidenavColor");
							var SNOption = $(".sidenavOption");

							/* button */
							var trim_Color = $(".GColor"); /* 1p */
							var color_trim = $(".BTrim"); /* 2p - 1 */
							var color_Option = $(".GOption"); /* 2p - 2 */
							var option_Color = $(".BColor"); /* 3p - 1 */

							trim_Color.click(function() {/* 컬러 선택 */
								SNColor.show();
								SNTrim.hide();
							})

							color_trim.click(function() { /* 트림 선택 */
								SNTrim.show();
								SNColor.hide();
							})

							color_Option.click(function() { /* 옵션 선택 */
								SNOption.show();
								SNColor.hide();
							})

							option_Color.click(function() { /* 컬러선택 */
								SNColor.show();
								SNOption.hide();
							})

							var car_image = $(".car_image");
							var color_list = $(".color_list li");
							var color_list2 = $(".color_list2 li");
							var color_name = $(".color_name");
							var color_name2 = $(".color_name2");

							var carname = $(".carnameNA");
							color_list
									.click(function() {
										var num = $(this).index();
										if (carname.text() == "니로 EV") {
											if (num == 0) {
												car_image
														.attr("src",
																"../resources/images/cars/niro_EV/klg_01.png");
												color_name.text("스틸 그레이");

											} else if (num == 1) {
												car_image
														.attr("src",
																"../resources/images/cars/niro_EV/cge_01.png");
												color_name.text("시티스케이프 그린");

											} else if (num == 2) {
												car_image
														.attr("src",
																"../resources/images/cars/niro_EV/m4b_01.png");
												color_name.text("미네랄 블루");

											} else if (num == 3) {
												car_image
														.attr("src",
																"../resources/images/cars/niro_EV/cr5_01.png");
												color_name.text("런웨이 레드");

											}
										} else if (carname.text() == "Avante") {
											if (num == 0) {
												car_image
														.attr("src",
																"../resources/images/cars/avante/pBlue.png");
												color_name.text("퍼포먼스 블루");

											} else if (num == 1) {
												car_image
														.attr("src",
																"../resources/images/cars/avante/pBlack.png");
												color_name.text("어피스 블랙 펄");

											}
										}

									})

							color_list2.click(function() {
								var num = $(this).index();
								if (num == 0) {
									/* car_image.attr("src", "../resources/images/cars/niro_EV/ccv_cover.jpg"); */
									color_name2.text("챠콜");

								} else if (num == 1) {
									/* car_image.attr("src", "../resources/images/cars/niro_EV/ewr_cover.jpg"); */
									color_name2.text("라이트 그레이 투톤");

								}

							})

						});
	</script>
</body>
</html>