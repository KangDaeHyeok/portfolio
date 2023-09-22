<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 신청내역</title>
<style>
.jumbotron {
	background-color: #fff !important;
}

.car_img{
	width: 100%;
}
</style>


<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />

	<div class="jumbotron text-center">
		<h1 class="display-4">시승 신청내역</h1>
		<hr class="mt-5">
		<p class="">
			<small>시승 예약 정보를 확인하세요.</small>
		</p>
	</div>

	<div class="container mb-5 pb-5">
		<div class="row mx-2">
			<c:forEach var="list" items="${reserveList}">
				<div class="card col-12 mb-2 pb-3">
					<div class="row no-gutters">
						<div class="col-md-6">
							<img src="${list.image_url}" alt="" class="img-fluid car_img" />
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="card-body col-12 mt-3">
									<h5 class="card-title">${list.car_name}</h5>
									<p class="card-text">${list.place}</p>
									<p class="card-text">${list.drive_date} ${list.drive_time}</p>
								</div>
								<div class="col-12">
									<a class="mr-3 blink float-right btn btn-danger" href="delete.cal?num=${list.num}&id=${list.id}">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>