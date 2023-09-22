<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	
<link rel="shortcut icon" href="resources/images/index/favicon.ico">

<link rel="stylesheet" type="text/css" href="resources/css/mainPage.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<title>Allez - The Proof of Hard Basic | 알레즈 공식 사이트</title>
</head>
<body>
	<div class="wrapper pb-5 mb-5">
		<div class="firstpage">

			<!-- ----------------------------메인 영상------------------------------- -->
			<div
				class="embed-responsive embed-responsive-16by9 d-none d-xl-block">
				<video class="embed-responsive-item mx-auto"
					src="resources/images/index/ELANTRA N-trim.mp4" autoplay
					loop muted width="100%" height="100%"></video>
			</div>

			<!-- -----------태블릿&모바일 사이즈의 메인 이미지----------- -->
			<div
				class="main-img d-block d-sm-none d-none d-sm-block d-md-none d-none d-md-block d-lg-none d-none d-lg-block d-xl-none">
				<img
					src="resources/images/index/the_new_avante_n_design_front_side_view_main_m.png"
					class="img-fulid" width="100%" height="">
			</div>

			<%@include file="indexmenu.jsp"%>

			<!-- --------------------------영상 위에 얹은 텍스트--------------------- -->
			<div class="textonvideo">
				<h5>NEVER JUST DRIVE</h5>
				<h2>THE NEW AVANTE N</h2>
			</div>

			<!-- -----------태블릿&모바일 사이즈에서 보이는 텍스트----------- -->
			<div
				class="txtmobile-main d-block d-sm-none d-none d-sm-block d-md-none d-none d-md-block d-lg-none d-none d-lg-block d-xl-none">
				<h5>NEVER JUST DRIVE</h5>
				<h3>THE NEW AVANTE N</h3>
			</div>

			<!-- --------------------영상 위에 얹은 텍스트 아래 버튼 두 개 --------------------->
			<ul class="video-btn">
				<li class="nav-item blink"><a class="nav-link active" href="./cars/avante.jsp"> <span
						class="material-symbols-outlined">arrow_forward_ios</span>상세 보기
				</a></li>
				<li class="nav-item blink"><a class="nav-link" href="./buildCar/BuildCar.jsp?carname=Avante"><span
						class="material-symbols-outlined">arrow_forward_ios</span>견적 내기</a></li>
			</ul>
		</div> <!-- firstpage -->
		<br> <br> <br> <br> <br> <br> <br>



		<!--  ---------------------- BEST KIA ---------------------------  -->

		<div class="row">
			<div class="col-12 text-center">
				<h1>BEST KIA</h1>
				<hr>
				<a class="btn" href="" role="button">최근 출시</a> <a class="btn"
					href="" role="button">연비 효율</a> <a class="btn" href=""
					role="button">적재공간</a>
			</div>
		</div>

		<br> <br> <br> <br> <br>
		<!-- ---------------------------carousel--------------------------- -->
		<div class="row mx-3">
			<div class="container-fluid">
				<div class="carousel_container px-5">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<!-- <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="row row-cols-sm-1 row-cols-lg-3">
									<div class="col mb-4 d-none d-lg-block">
										<div class="card">
											<br> <br>
											<div class="card-top ml-3">
												<h4 class="card-title">
													The 2024 K3 GT <span class="badge badge-pill badge-dark">TOP1</span>
												</h4>
												<p class="card-text">1.6 가솔린 | 시그니처 A/T</p>
											</div>
											<img src="resources/images/index/k3-gt_dbjs5bod7_a_cr5.png"
												class="d-block w-100" alt="...">
											<div class="card-body">
												<p class="card-text">출시일 : 2023-07-19</p>
												<p class="card-text">배기량 : 1.598cc</p>
												<p class="card-text">최고 출력 : 123 ps / 6,300 rpm</p>
												<p class="card-text">외장 컬러 : 런웨이 레드</p>
												<p class="card-text mb-5 pb-5">옵션(3) : 블랙핏 KRELL / 프리미엄
													사운드 / 선루프</p>
												<div class="card_txtbox" style="width: 100%;">
													<hr />
													<h4 class="mb-5 card-text text-right">29,580,000 원</h4>
													<br>
													<div class="float-right">
														<a href="#" class="btn btn-outline-dark">자세히 보기</a> <a
															href="#" class="btn btn-dark">견적 내기</a>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="col mb-4 d-none d-lg-block">
										<div class="card">
											<br> <br>
											<div class="card-top ml-3">
												<h4 class="card-title">
													The 2024 Sportage <span class="badge badge-pill badge-dark">TOP2</span>
												</h4>
												<p class="card-text">1.6 터보 하이브리드 | 30th Edition 그린내장
													4WD A/T</p>
											</div>
											<img
												src="resources/images/index/sportage_nqjj59b34_a_swp.png"
												class="d-block w-100" alt="...">
											<div class="card-body">
												<p class="card-text">출시일 : 2023-07-18</p>
												<p class="card-text">배기량 : 1.598cc</p>
												<p class="card-text">최고 출력 : 180 ps / 5,500 rpm</p>
												<p class="card-text">외장 컬러 : 스노우 화이트 펄</p>
												<p class="card-text mb-5 pb-5">옵션(4) : 빌트인 캠(하이브리드) /
													모니터링 팩(하이브리드 시그니처)</p>
												<div class="card_txtbox" style="width: 100%;">
													<hr />
													<h4 class="mb-5 card-text text-right">45,580,000 원</h4>
													<br>
													<div class="float-right">
														<a href="#" class="btn btn-outline-dark">자세히 보기</a> <a
															href="#" class="btn btn-dark">견적 내기</a>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="col mb-4">
										<div class="card">
											<br> <br>
											<div class="card-top ml-3">
												<h4 class="card-title">
													The 2023 K8 <span class="badge badge-pill badge-dark">TOP3</span>
												</h4>
												<p class="card-text">3.5 가솔린 | 시그니처 투톤휠 AWD</p>
											</div>
											<img src="resources/images/index/k8_gljs49b32_a_agt.png"
												class="d-block w-100" alt="...">
											<div class="card-body">
												<p class="card-text">출시일 : 2023-07-19</p>
												<p class="card-text">배기량 : 1.598cc</p>
												<p class="card-text">최고 출력 : 230hp / 6,300 rpm</p>
												<p class="card-text">외장 컬러 : 인터스텔라 그레이</p>
												<p class="card-text mb-5 pb-5">옵션(3) : 블랙핏 KRELL / 프리미엄
													사운드 / 선루프</p>
												<div class="card_txtbox" style="width: 100%;">
													<hr />
													<h4 class="mb-5 card-text text-right">45,920,000 원</h4>
													<br>
													<div class="float-right">
														<a href="#" class="btn btn-outline-dark">자세히 보기</a> <a
															href="#" class="btn btn-dark">견적 내기</a>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- carousel-item -->

							<div class="carousel-item">
								<div class="row row-cols-sm-1 row-cols-lg-3">
									<div class="col mb-4 d-none d-lg-block">
										<div class="card">
											<br> <br>
											<div class="card-top ml-3" >
												<h4 class="card-title">
													The Kia EV9 <span class="badge badge-pill badge-dark">New</span>
												</h4>
												<p class="card-text">EV전기차 | 어스 4WD A/T 스타일</p>
											</div>
											<img src="resources/images/index/ev9_mvjj6vba1_b_swp.png"
												class="d-block w-100" alt="...">
											<div class="card-body">
												<p class="card-text">출시일 : 2023-06-19</p>
												<p class="card-text">배터리 용량 : 99.8kWh</p>
												<p class="card-text">최고 출력 : 238kW / 385 ps</p>
												<p class="card-text">외장 컬러 : 스노우 화이트 펄</p>
												<p class="card-text mb-5 pb-5">옵션(3) : 21인치 휠 / 스타일드 /
													6인승(스위블)</p>

												<div class="card_txtbox" style="width: 100%;">
													<hr />
													<h4 class="mb-5 card-text text-right">89,740,000 원</h4>
													<br>
													<div class="float-right">
														<a href="#" class="btn btn-outline-dark">자세히 보기</a> <a
															href="#" class="btn btn-dark">견적 내기</a>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="col mb-4 d-none d-lg-block">
										<div class="card">
											<br> <br>
											<div class="card-top ml-3">
												<h4 class="card-title">
													The Kia Carnival <span class="badge badge-pill badge-dark">TOP4</span>
												</h4>
												<p class="card-text">3.5 가솔린 | 시그니처 A/T</p>
											</div>
											<img
												src="resources/images/index/carnival_kpjg91c34_a_abp.png"
												class="d-block w-100" alt="...">
											<div class="card-body">
												<p class="card-text">출시일 : 2023-07-19</p>
												<p class="card-text">배기량 : 3.470cc</p>
												<p class="card-text">최고 출력 : 294 ps / 6,400 rpm</p>
												<p class="card-text">외장 컬러 : 오로라 블랙펄</p>
												<p class="card-text mb-5 pb-5">옵션(7) : 듀얼 선루프 / 드라이브 와이즈
													등</p>

												<div class="card_txtbox" style="width: 100%;">
													<hr />
													<h4 class="mb-5 card-text text-right">44,850,000 원</h4>
													<br>
													<div class="float-right">
														<a href="#" class="btn btn-outline-dark">자세히 보기</a> <a
															href="#" class="btn btn-dark">견적 내기</a>
													</div>
												</div>


											</div>
										</div>

									</div>
									<div class="col mb-4">
										<div class="card">
											<br> <br>
											<div class="card-top ml-3">
												<h4 class="card-title">
													The New Morning <span class="badge badge-pill badge-dark">New</span>
												</h4>
												<p class="card-text">1.0 가솔린 | 프레스티지 A/T</p>
											</div>
											<img src="resources/images/index/morning_jajh5ad38_n_a2g.png"
												class="d-block w-100" alt="...">
											<div class="card-body">
												<p class="card-text">출시일 : 2023-07-05</p>
												<p class="card-text">배기량 : 998cc</p>
												<p class="card-text">최고 출력 : 76 ps / 6,200 rpm</p>
												<p class="card-text">외장 컬러 : 어드벤쳐러스 그린</p>
												<p class="card-text mb-5 pb-5">옵션(2) : 드라이브 와이즈 / 8인치
													내비게이션(프레스티지)</p>

												<div class="card_txtbox" style="width: 100%;">
													<hr />
													<h4 class="mb-5 card-text text-right">16,250,000 원</h4>
													<br>
													<div class="float-right">
														<a href="#" class="btn btn-outline-dark">자세히 보기</a> <a
															href="#" class="btn btn-dark">견적 내기</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon blink" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon blink" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div> <!-- row mx-3 -->
		<br> <br> <br> <br> <br> <br> <br>




		<!-- -------------------------MODELS OF OUR FAMILY Page -------------------------->


		<div class="row mx-3">
			<div class="col-12 text-center">
				<h1>MODELS OF OUR FAMILY</h1>
				<hr>
				<a class="btn" href="" role="button">최근 출시</a> <a class="btn"
					href="" role="button">안정성</a> <a class="btn" href="" role="button">액세서리</a>
			</div>
		</div>
		<br> <br> <br> <br> <br> 
		<br>



		<div class="cs_cd card-deck mx-3">
			<div class="card">
				<img src="./resources/images/index/seltos_feature_bg_pc.jpg"
					class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">VENUE</h5>
					<p class="card-text">미래지향적인 새로운 스타일과 차급을 넘나드는 상품성으로 새로운 차원의 경험을
						선사합니다.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"> 
					<a href="#">자세히 보기</a> 
					<a href="#">견적 내기</a>
					</small>
				</div>
			</div>
			<div class="card">
				<img src="./resources/images/index/k8_feature_pc_bg.jpg"
					class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">THE ALL NEW GRANDEUR</h5>
					<p class="card-text">고성능 퍼포먼스에 더욱 최적화된 디자인과 업그레이드된 상품성으로
						라이프스타일을 선도합니다.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"> 
					<a href="#">자세히 보기</a>
					<a href="#">견적 내기</a>
					</small>
				</div>
			</div>
			<div class="card">
				<img src="./resources/images/index/sportage_feature_bg_pc.jpg"
					class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">ALL NEW TUCSON Hybrid</h5>
					<p class="card-text">당신만의 특별한 공간, 더 오래 머물수록 그 가치는 빛이 납니다.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">
					<a href="#">자세히 보기</a>
					<a href="#">견적 내기</a>
					</small>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> 
		<br>



		<!-- ----------------------------------- 하단 박스들 ------------------------------>
		<div class="row mx-3" id="lower_boxes">
			<div class="col-lg-3 col-sm-6 my-2">
				<div class="card">
					<div class="card-body blink">
						<h5 class="card-title">
							<span class="material-symbols-outlined">calculate</span>
						</h5>
						<p class="card-text">견적 내기</p>
						<br> <br> <br> <a href="./car/models.jsp?model=ev" class="btn btn-dark">자세히
							보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-sm-6 my-2">
				<div class="card">
					<div class="card-body blink">
						<h5 class="card-title">
							<span class="material-symbols-outlined">directions_car</span>
						</h5>
						<p class="card-text">시승 신청</p>
						<br> <br> <br> <a href="./reserve/test_drive.jsp" class="btn btn-dark">자세히
							보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 my-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							<span class="material-symbols-outlined">location_on</span>
						</h5>
						<p class="card-text">판매 네트워크</p>
						<br> <br> <br> <a href="#" class="btn btn-dark">자세히
							보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 my-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							<span class="material-symbols-outlined">redeem</span>
						</h5>
						<p class="card-text">이 달의 구매 혜택</p>
						<br> <br> <br> <a href="#" class="btn btn-dark">자세히
							보기</a>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> 
		<br>
		<!-- --------------------------------전기차 news ------------------------------>
		<div class="evcar mx-3">
			<h1 class="text-center">NEWS</h1>
			<br>
			<p class="text-center">지구 환경을 품은 현대자동차의 미래형 모빌리티를 경험해보세요.</p>
			<br> <br>
			<div class="row no-gutters position-relative">
				<div class="col-xl-6 mb-md-0 p-md-4 col-lg-12">
					<img src="resources/images/index/ev_ioniq6.jpg" class="w-100">
				</div>
				<div class="col-xl-6 position-static p-4 pl-md-0 col-lg-12"
					id="news-txt">
					<h5 class="mt-0">
						<span class="badge badge-primary">New</span>
					</h5>
					<br>
					<h2 class="mt-0">아이오닉 6</h2>
					<br> <br>
					<p>
						현대가 1세대 더 뉴 아이오닉6 상품성 개선 모델 ‘더 뉴 아이오닉6’의 디자인을 25일(화) 공개했다.<br>
						1세대 더 뉴 아이오닉6는 지난 2022년 출시 후 매년 국내에서 6만대 이상 판매되며 2년 연속 전기차 시장 1위를
						지켜왔으며,<br> 올해도 상반기까지 3만 6천대 이상 판매되며 많은 고객들의 사랑을 받고 있다. <br>
						E-GMP 차세대 전기차 플랫폼 (Electric-Global Modular Platform)배터리, 모터, 차체,
						섀시구조까지 <br> 모든 것이 새로워진 전기차 전용 플랫폼 E-GMP는 승객 보호와 배터리 안전성 확보를
						위해 <br> 차체 사이드실 내부에 알루미늄 압출재를 적용하여 구조적 안전성을 높였습니다.
					</p>
					<br> <br> 
					<a href="./car/models.jsp?model=ev" class="blink">전기차 ▷</a> 
					<a href="./car/models.jsp?model=ev" class="blink">수소 전기차 ▷</a>
				</div>
			</div>
		</div>
		<!-- evcar -->
	</div> <!-- wrapper -->
	<%@include file="footer.jsp"%>




</body>
</html>