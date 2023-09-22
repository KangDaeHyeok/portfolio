<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Avante</title>
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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- 360 reel jQuery -->
<script src="../resources/js/jquery.reel.js"></script>	

<style>
footer{
	top: 600px;
}

@media screen and (max-width: 1200px) {
	footer {
		top: 350px;
	}
}

@media screen and (max-width: 768px) {
	footer {
		top: 180px;
	}
}

</style>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<div class="cs_main">
		<img
			src="../resources/images/cars/avante/avante_hybrid_design_front_view.png"
			width="100%" alt="" class="img-fluid">
		<div class="cs_main_info text-white">
			<h1>The new Avante</h1>
			<p>수평적인 그래픽을 확장한 디자인으로 더 낮고 와이드한 비례</p>
			<h3 class="d-inline">24,660,000</h3>
			<small>원부터</small>
			<p>(세제혜택 전 / 하이브리드 기준)</p>
		</div>
	</div>
	<!-- cs_main -->

	<div class="sticky-top">
		<div class="pt-3">
			<a class="ml-2 btn blink" href="avante.jsp" role="button"><h3>아반떼</h3></a>
			<a class="ml-2 btn blink" href="#360image" role="button">360° VR</a>
			<a class="btn blink" href="#avante_data" role="button">제원</a>
			<a class="btn blink" href="#avante_gallery" role="button">갤러리</a>
			<a class="btn blink" href='../buildCar/BuildCar.jsp?carname=Avante' role="button">견적내기</a>
		</div>
	</div>

	<div class="container mt-2" id="360image">
		<div class="row">
			<h1 class="mx-auto">360° VR</h1>
		</div>
		<p class="text-center text-danger">마우스로 드래그하여 회전시켜보세요.</p>
		
		<div class="btn_parent position-relative blink">
			<img src="../resources/images/cars/avante/btn_pip_360vr.png" width="100%" class="img-fluid" />
			
		</div>
		
		<div class="360img_parent d-flex justify-content-center position-relative">
			<img src="../resources/images/cars/avante/360img_blue/001.png"
				 class="reel img-fluid img_blue" id="image"
				 data-images="../resources/images/cars/avante/360img_blue/###.png"
				 data-cw="true"
				 data-frame="1"
				 data-frames="60"
				 data-throwable="0.2"
				 >
				 <!-- data-speed="0.2" -->
			
					
			<img src="../resources/images/cars/avante/360img_black/001.png" alt="" class="reel img-fluid img_black" id="image"
					data-images="../resources/images/cars/avante/360img_black/###.png"
					data-cw="true"
					data-frame="1"
					data-frames="60"
					data-throwable="0.2"
					>		
					
					
					
					
		</div>
	</div>
	
	
	<div class=" position-relative text-center">
		<h5 class="">N 전용 가솔린 2.0 터보</h5>
		<div class="d-flex justify-content-center my-4">
			<div class="float-left color_name">퍼포먼스 블루</div>
			<div class="">
				<ul class="color_list">
					<li><img class="rounded-circle img-fluid blink" src="../resources/images/cars/avante/colorchip-blue.png" alt=""></li>
					<li><img class="rounded-circle img-fluid blink" src="../resources/images/cars/avante/colorchip-black.png" alt=""></li>
				</ul>
			</div>
		</div>
		<p>
			<small>※ 상기 이미지는 실제 차량 컬러와 다를 수 있으며 사전 예고없이 변경될 수 있습니다.</small>
		</p>
	</div>
	
	
	<div id="avante_data" class="my-5 position-relative">
		<div class="row mb-3">
			<h1 class="mx-auto">제원</h1>
		</div>
	    <div class="carousel-item active">
	      <img width="80%" src="../resources/images/cars/avante/pip-the-new-avante-n-cn7-23pe-specifications-w.jpg" class="d-block img-fulud">
	    </div>
	</div>
	
	
	<div id="avante_gallery" class="my-5 pb-5 position-relative">
		<div class="row mb-4">
			<h1 class="mx-auto">갤러리</h1>
		</div>
		
		
		<div class="row">
			<div class="col-sm-6 col-12 mb-3">
				<img width="100%" src="../resources/images/cars/avante/the_new_avante_n_high_performance_e_lsd_ecs_m.jpg" class="img-fulud">
			</div>	
			<div class="col-sm-6 col-12">
				<img width="100%" src="../resources/images/cars/avante/the_new_avante_n_design_front_side_view_main.png" class="img-fulud">
			</div>	
		</div>
		
		<div class="row mt-3">
			<div class="col-sm-6 col-12 mb-3">
				<img width="100%" src="../resources/images/cars/avante/the_new_avante_n_design_radiator_grill_m.jpg" class="img-fulud">
			</div>	
			<div class="col-sm-6 col-12">
				<img width="100%" src="../resources/images/cars/avante/the_new_avante_n_design_wing_type_rear_spoiler_m.jpg" class="img-fulud">
			</div>	
		</div>
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
			var img_blue = $(".360img_parent .img_blue");
			var img_black = $(".360img_parent .img_black");
			var color_list = $(".color_list li");
			var color_name = $(".color_name");
			
			img_black.hide();
			
			color_list.click(function() {
				var num = $(this).index();

				if (num == 0) {
					img_blue.show();
					img_black.hide();
					color_name.text("퍼포먼스 블루");

				} else if (num == 1) {
					img_blue.hide();
					img_black.show();
					color_name.text("어피스 블랙 펄");
				} 
			})
		})
	</script>
</body>
</html>