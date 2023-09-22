<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
ul li, ol li {
	list-style: none;
}

.jumbotron {
	background-color: #fff;
}

.header {
	background-color: pink;
}

.header p {
	top: 10px;
}

.cs_btn {
	width: 200px;
	top: 30px;
	left: 50%;
	margin-left: -100px;
}

.coupon {
	width: 400px;
	height: 300px;
	background-color: #fff;
	left: 50%;
	margin-left: -200px;
	top: 20px;
}

.coupon p {
	position: absolute;
	width: 50%;
	top: 35%;
	left: 25%;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String user = request.getParameter("user");
	String date = request.getParameter("date");

	String img = null;
	if (title.equals("Meet The N"))
		img = "../resources/images/event/meet-the-n-page-pc-1120xa.png";
	else if (title.equals("여름철 차량 점검"))
		img = "../resources/images/event/event-bluemembers-hyundaishop-summer-carcare-august-page-pc-1120xa.jpg";
	%>
	<!-- nav추가 -->
  	<jsp:include page="../menu.jsp" />
  
	<div class="jumbotron text-center">
		<h1 class="display-5 font-weight-bolder">이벤트</h1>
		<hr class="mt-5">
		<p class="">
			<small>고객님을 위한 스페셜 이벤트는 계속됩니다. 즐거운 행운과 경품을 만나보세요!</small>
		</p>
	</div>

	<div class="container-fluid">
		<div class="row py-3 header">
			<div class="col">
				<h3 class="float-left ml-3"><%=title%></h3>
				<p class="float-right mr-3 position-relative"><%=user%>
					|
					<%=date%></p>
			</div>
		</div>
	</div>


	<div class="container mb-5 pb-5">
		<div class="row py-3 py-sm-5">
			<div class="col">
				<img width="100%" src="<%=img%>" class="img-fluid" alt="">

				<% if(title.equals("Meet The N")){ %>
					<div class="coupon position-relative text-center align-middle">
						<p></p>
					</div>

					<!-- Button trigger modal -->
					<button type="button"
						class="cs_btn btn btn-outline-dark btn-lg position-relative mb-5 blink"
						data-toggle="modal" data-target="#exampleModal">응모하기</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">더 뉴 아반떼 N</h5>
								</div>
								<div class="modal-body">시승 지원 이벤트에 참여하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary event_enter">응모하기</button>
								</div>
							</div>
						</div>
					</div> <!-- Modal -->
					
				<% } %>
				
			</div> <!-- col -->
		</div> <!-- row -->
	</div> <!-- container -->
	
	<jsp:include page="../footer.jsp" />


	<!-- 두번 누를 때 btn에 disabled 클래스 추가 -->

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
			var btn = $(".event_enter");
			var text = $(".coupon p");

			var random1 = Math.floor(Math.random() * 11);
			var random2 = Math.floor(Math.random() * 11);

			var count = 0;

			btn.click(function() {

				if (random1 == random2) {
					text.text("당첨되셨습니다.");
					// location.href="event_page.jsp?coupon=시승권";
				} else {
					text.text("다음에 다시 응모해주세요.")
					btn.addClass("disabled");
				}

			})

		})
	</script>

</body>
</html>