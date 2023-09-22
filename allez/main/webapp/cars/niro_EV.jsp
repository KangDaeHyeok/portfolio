<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- core태그를 쓰기 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니로 EV</title>
<!-- cars css 추가 -->
<link rel="stylesheet" href="../resources/css/cars_style.css">

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<%@include file="../menu.jsp"%>
	<div class="cs_main">
		<img src="../resources/images/cars/niro_EV/niroev_feature_bg.jpg"
			width="100%" alt="" class="img-fluid">
		<div class="cs_main_info text-white">
			<h1>The 2004 Niro EV</h1>
			<p>내일을 향한 움직임</p>
			<h3 class="d-inline">51,140,000</h3>
			<small>원부터</small>
			<p>(세제혜택 전 / 에어 기준)</p>
		</div>
	</div>
	<!-- cs_main -->

	<div class="sticky-top">
		<div class="pt-3">
			<a class="ml-2 btn blink" href="niro_EV.jsp" role="button"><h3>니로
					EV</h3></a>
			<a class="ml-2 btn blink" href="#img_bg" role="button">모델 소개</a>
			<a class="btn blink" href="#car_data" role="button">제원</a>
			<a class="btn blink" href="#car_gallery" role="button">갤러리</a>
			<a class="btn blink" href="../buildCar/BuildCar.jsp?carname=니로 EV" role="button">견적내기</a>
		</div>
	</div>

	<div class="in_out_btn d-flex justify-content-center position-relative">
		<button type="button" class="btn mr-2 blink">외장</button>
		<button type="button" class="btn blink">내장</button>
	</div>
	
	<div id="img_bg" class="img_bg position-relative"></div>
	<div
		class="cs_car_image d-flex justify-content-center position-relative">
		<img src="../resources/images/cars/niro_EV/klg_01.png" alt=""
			class="car_image img-fluid w-auto position-relative">
	</div>

	<div class="cs_out_list color_parent position-relative text-center">
		<h5 class="">EV 전기차 에어 2WD A/T</h5>
		<div class="d-flex justify-content-center my-4">
			<div class="float-left color_name">스틸 그레이</div>
			<div class="">
				<ul class="color_list">
					<li><img src="../resources/images/cars/niro_EV/klg.png" class="blink" alt=""></li>
					<li><img src="../resources/images/cars/niro_EV/cge.png" class="blink" alt=""></li>
					<li><img src="../resources/images/cars/niro_EV/m4b.png" class="blink" alt=""></li>
					<li><img src="../resources/images/cars/niro_EV/cr5.png" class="blink" alt=""></li>
				</ul>
			</div>
		</div>
		<p>
			<small>본 차량의 이미지는 실제와 다를 수 있습니다.</small>
		</p>
	</div>

	<div class="cs_in_list color_parent position-relative text-center">
		<h5 class="">EV 전기차 에어 2WD A/T</h5>
		<div class="d-flex justify-content-center my-4">
			<div class="float-left color_name">챠콜</div>
			<div class="">
				<ul class="color_list">
					<li><img src="../resources/images/cars/niro_EV/ccv.png" class="blink" alt=""></li>
					<li><img src="../resources/images/cars/niro_EV/ewr.png" class="blink" alt=""></li>
				</ul>
			</div>
		</div>
		<p>
			<small>본 차량의 이미지는 실제와 다를 수 있습니다.</small>
		</p>
	</div>


	<div class="container thumbnail_parent position-relative">
		<div class="row">
			<h1 class="mx-auto">니로 EV 추천 모델</h1>
		</div>
		<div class="row my-5">
			<div class="col-md-4 col-6 mb-5">
				<div class="thumbnail">
					<div class="caption">
						<p>EV 전기차</p>
						<h5>어스 KLG-라이트투톤</h5>
					</div>
					<img class="img-fluid"
						src="../resources/images/cars/niro_EV/niro-ev_sgjj5vf33_r_swp.png">
					<br /> <br></br>
					<div class="caption">
						<div class="row">
							<div class="col-6 font-weight-bold">외장컬러</div>
							<div class="col-6">스노우 화이트 펄</div>
						</div>
						<div class="row">
							<div class="col-6 font-weight-bold">내장컬러</div>
							<div class="col-6">라이트 그레이 투톤</div>
						</div>
					</div>
					<hr />
					<div class="float-right">
						<h4 class="d-inline">57,920,000</h4><small>원</small>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-6">
				<div class="thumbnail">
					<div class="caption">
						<p>EV 전기차</p>
						<h5>에어 2WD A/T</h5>
					</div>
					<img class="img-fluid"
						src="../resources/images/cars/niro_EV/niro-ev_sgjj5ve33_a_swp.png">
					<br />
					<br></br>
					<div class="caption">
						<div class="row">
							<div class="col-6 font-weight-bold">외장컬러</div>
							<div class="col-6">스노우 화이트 펄</div>
						</div>
						<div class="row">
							<div class="col-6 font-weight-bold">내장컬러</div>
							<div class="col-6">차콜</div>
						</div>
					</div>
					<hr />
					<div class="float-right">
						<h4 class="d-inline">51,220,000</h4><small>원</small>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-6">
				<div class="thumbnail">
					<div class="caption">
						<p>EV 전기차</p>
						<h5>에어 2WD A/T</h5>
					</div>
					<img class="img-fluid"
						src="../resources/images/cars/niro_EV/niro-ev_sgjj5ve33_a_agt.png">
					<br />
					<br></br>
					<div class="caption">
						<div class="row">
							<div class="col-6 font-weight-bold">외장컬러</div>
							<div class="col-6">인터스텔라그레이</div>
						</div>
						<div class="row">
							<div class="col-6 font-weight-bold">내장컬러</div>
							<div class="col-6">차콜</div>
						</div>
					</div>
					<hr />
					<div class="float-right">
						<h4 class="d-inline">51,140,000</h4><small>원</small>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="car_data">
		<div class="row mb-3">
			<h1 class="mx-auto">제원</h1>
		</div>
		
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active blink"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1" class="blink"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2" class="blink"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="3" class="blink"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img width="60%" src="../resources/images/cars/niro_EV/niroev_specification_front_image_pc.png" class="d-block img-fulud">
		    </div>
		    <div class="carousel-item">
		      <img width="60%" src="../resources/images/cars/niro_EV/niroev_specification_side_image_pc.png" class="d-block img-fulud">
		    </div>
		    <div class="carousel-item">
		      <img width="60%" src="../resources/images/cars/niro_EV/niroev_specification_rear_image_pc.png" class="d-block img-fulud">
		    </div>
		     <div class="carousel-item">
		      <img width="60%" src="../resources/images/cars/niro_EV/niroev_specification_3direction_image_pc.png" class="d-block img-fulud">
		    </div>
		  </div>
		</div>
	</div>
	
	<div id="car_gallery">
		<div class="row mb-4">
			<h1 class="mx-auto">갤러리</h1>
		</div>
		
		
		<div class="row mx-auto">
			<div class="col-sm-4 col-12">
				<div class="col mb-5">
					<img width="100%" src="../resources/images/cars/niro_EV/niroev_gallery_image_v2l.jpg" class="img-fulud">
				</div>
				<div class="col mb-5">
					<img width="100%" src="../resources/images/cars/niro_EV/niroev_gallery_image_exterior.jpg" class="img-fulud">
				</div>
			</div>
			
			<div class="col-sm-8 col-12">
				<img width="98%" src="../resources/images/cars/niro_EV/niroev_gallery_image_interior.jpg" class="img-fulud">
			</div>
		</div>
	</div>
	
	<div class="pb-5 mb-5">
		<p class="text-center">상기 차량 이미지와 사양 구성은 차종, 차급 및 선택 사양에 따라 다르게 적용되며 색상은 실제 색상과 차이가 있을 수 있습니다.</p>
	</div>
	
	<jsp:include page="../footer.jsp" />

	<!-- bootstrap js cdn -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			// 버튼 이벤트
			var car_image = $(".car_image");
			var color_list = $(".color_list li");
			var color_name = $(".color_name");
			var in_out_btn = $(".in_out_btn button");
			var img_bg = $(".img_bg");
			var cs_car_image = $(".cs_car_image");
			var color_parent = $(".color_parent");
			var cs_out_list = $(".cs_out_list");
			var cs_in_list = $(".cs_in_list");

			color_list.click(function() {
				var num = $(this).index();

				if (num == 0) {
					car_image.attr("src", "../resources/images/cars/niro_EV/klg_01.png")
					color_name.text("스틸 그레이");
					img_bg.css("background-color", "#c9c9cb")

				} else if (num == 1) {
					car_image.attr("src", "../resources/images/cars/niro_EV/cge_01.png")
					color_name.text("시티스케이프 그린");
					img_bg.css("background-color", "#2d332d")

				} else if (num == 2) {
					car_image.attr("src", "../resources/images/cars/niro_EV/m4b_01.png")
					color_name.text("미네랄 블루");
					img_bg.css("background-color", "#2d404B")

				} else if (num == 3) {
					car_image.attr("src", "../resources/images/cars/niro_EV/cr5_01.png")
					color_name.text("런웨이 레드");
					img_bg.css("background-color", "#650009")
				}
			})

			in_out_btn.click(function() {
						var num = $(this).index();
						var su = 0;

						if (num == 0) {
							car_image.attr("src","../resources/images/cars/niro_EV/klg_01.png");

							if (su >= 0) {
								location.reload();
							}

						} else if (num == 1) {
							car_image.attr("src","../resources/images/cars/niro_EV/ccv_cover.jpg").css("top", "-60px");
							img_bg.css("visibility", "hidden");
							cs_out_list.hide();
							cs_in_list.css("display", "block");
							su++;

							color_list
									.click(function() {
										var num = $(this).index();

										if (num == 0) {
											car_image.attr("src","../resources/images/cars/niro_EV/ccv_cover.jpg")
											color_name.text("챠콜");

										} else if (num == 1) {
											car_image.attr("src","../resources/images/cars/niro_EV/ewr_cover.jpg")
											color_name.text("라이트 그레이 투톤");
										}

									})

						}
					})

		})
	</script>
</body>
</html>