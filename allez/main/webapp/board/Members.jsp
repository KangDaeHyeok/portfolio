<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link rel="stylesheet" type="text/css" href="../resources/css/Members.css">

<link rel="shortcut icon" href="../resources/images/index/favicon.ico">	
<title>Members</title>
</head> 
<body>
	<%@include file="../indexmenu.jsp"%>
	<img src="../resources/images/members/kv_kia-members.jpg" class="img-fluid top" alt="Responsive image">
	
		<div class="members-title">
			<h1>기아 멤버스</h1>
		</div> <!-- members-title -->



	<!-- 메인 아래 스티키 간단 네브 --------------------------------------------------->
	<div class="sticky-top snP">
		<ul class="stickyNav list">
			<li class="nav-item">
				<h2 class="nav-link">유지 & 관리</h2>
			</li>
			<li class="nav-item">
				<a class="nav-link text-muted">기아멤버스</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="https://www.hyundai.com/kr/ko/service-membership/car-management-service/usedcar">중고차</a>
			</li>
		</ul>
	</div> 
		<br><br><br><br>


		<!-- 1st section------------------------------------------------------------ -->
		<div class="card text-center col-lg-12 border-white">
			<div class="card-body">
				<h1 class="card-title font-weight-bold">기아멤버스</h1><br>
				<h5 class="card-text text-muted">차량 구매부터 유지/관리는 물론, <br>
				 더 즐거운 자동차 생활을 위한 기아만의 멤버십 프로그램입니다.</h5><br><br>
				<a href="https://members.kia.com/kr/view/kindex.do" class="btn btn-outline-dark font-weight-bold">기아멤버스 바로가기</a>
			</div>
		</div>
		<br><br><br><br><br><br>



		<!-- 기아 멤버스 포인트 section --------------------------------------------------->
		<div class="container">
			<div class="card border-white mx-2">
				<div class="row no-gutters mx-5">
					<div class="col-12 col-lg-6">
						<img src="../resources/images/members/kia_members_img01_re.jpg" class="card-img rounded-0">
					</div>
					<div class="col-12 col-lg-6" id="point-txt">
						<div class="card-body">
							<h3 class="card-title font-weight-bold">기아멤버스 포인트</h3><br>
							<p class="card-text">기아멤버스 포인트는 기아멤버스 회원을 대상으로 기아 주식회사와 포인트 서비스 계약을<br> 체결한 가맹점에서 물품 구매, 또는 서비스 이용 시 기아멤버스 카드 또는 제휴 카드를<br> 통해 포인트를 적립하고, 사용할 수 있는 제도입니다.</p><br>
							<p class="card-text">
								<a href="https://www.kia.com/kr/customer-service/kia-members/kia-members">멤버십 카드 →</a>
							</p>
							<p class="card-text">
								<a href="https://www.kia.com/kr/customer-service/kia-members/kia-members">멤버십 적립/사용 →</a>
							</p>
							<p class="card-text">
								<a href="https://kia.auton.kr/index/main">카앤라이프몰 →</a>
						</p>
							<p class="card-text">
								<a href="https://www.kia.com/kr/customer-service/kia-members/kia-members">카케어 프로그램 →</a>
						</p>
							<p class="card-text">
								<a href="https://www.kia.com/kr/customer-service/kia-members/kia-members">라이프케어 프로그램 →</a>
						</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br><br><br><br><br><br>



		<!-- 차량케어 서비스 section---------------------------------------------------------------------- -->
		<div class="container">
			<div class="card border-white mx-2" id="car-care">
				<div class="row no-gutters mx-5">
					<div class="col-12 order-lg-2 col-lg-6">
						<img src="../resources/images/members/kia_members_img02.jpg" class="img-fluid">
					</div>
					<div class="col-12 order-lg-1 col-lg-6">
						<div class="card-body" id="care-txt">
							<h3 class="card-title font-weight-bold">차량케어 서비스</h3><br>
							<p class="card-text">기아의 공식 서비스 브랜드 Auto Q는 18개 직영 센터와 800여개의 <br> 서비스 협력사로 구성된 전국 					서비스 네트워크입니다.
							</p> <br><br>
								<p class="card-text">
									<a href="https://members.kia.com/kr/view/kindex.do">차량사양 조회 →</a>
								</p>
								<p class="card-text">
									<a href="https://members.kia.com/kr/view/kindex.do">보증수리 →</a>
								</p>
								<p class="card-text">
									<a href="https://members.kia.com/kr/view/kindex.do">프리케어 →</a>
								</p>
								<p class="card-text">
									<a href="https://members.kia.com/kr/view/kindex.do">AUTO Q 검색/예약 →</a>
								</p>
								<p class="card-text">
									<a href="https://members.kia.com/kr/view/kindex.do">긴급출동/무상견인 →</a>
								</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	<br><br><br><br><br><br>

	
		
	<!-- 스마트 카 라이프 section ---------------------------------------------------------------------------->
	<div class="container">
		<div class="card border-white mx-2" id="smart-car">
			<div class="row no-gutters mx-5">
				<div class="col-12 col-lg-6">
					<img src="../resources/images/members/kia_members_img03.jpg" class="card-img rounded-0">
				</div>
				<div class="col-12 col-lg-6" id="point-txt">
					<div class="card-body">
						<h3 class="card-title font-weight-bold text-right">스마트 카 라이프</h3><br>
						<p class="card-text text-right">Kia Digital Key는 NFC 안테나가 장착된 스마트폰 또는 카드키로 <br> 차량의 도어를 열고 시동을 걸 수 있는 새로운 서비스 입니다.</p><br>
						<p class="card-text text-right">
							<a href="https://members.kia.com/kr/view/kindex.do">Kia CarPay →</a></p>
						<p class="card-text text-right">
							<a href="https://members.kia.com/kr/view/kindex.do">Kia Digital Key →</a></p>
						<p class="card-text text-right">
							<a href="https://connect.kia.com/kr/00_main/main.html">Kia Connect →</a></p>
						<p class="card-text text-right">
							<a href="https://members.kia.com/kr/view/kindex.do">스마트기기 연계 서비스 →</a></p>
						<p class="card-text text-right">
							<a href="https://members.kia.com/kr/view/kindex.do">네비게이션/빌트인캠 업데이트 →</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>


		<!-- 하단의 박스들------------------------------------------------------- -->

		<div class="row mx-3" id="lower_boxes">
			<div class="col-lg-3 col-sm-6 my-2 blink">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							<span class="material-symbols-outlined">calculate</span>
						</h5>
						<p class="card-text">견적 내기</p>
						<br> <br> <br> <a href="../car/models.jsp?model=ev" class="btn btn-dark">자세히
							보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-sm-6 my-2 blink">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							<span class="material-symbols-outlined">directions_car</span>
						</h5>
						<p class="card-text">시승 신청</p>
						<br> <br> <br> <a href="../reserve/test_drive.jsp" class="btn btn-dark">자세히
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
		<br><br><br><br><br><br><br><br>
	<%@include file="../footer.jsp"%>

</body>
</html>