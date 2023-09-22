<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="mvc.model.BuildDTO"%>
<%@page import="mvc.model.CarDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적 내역</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css?v=1"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
.display-inline {
	display: inline;
}

.jumbotron {
	background-color: #fff;
}

.cs_img {
	width: 100%;
	display: inline;
	border-radius: 50%;
	margin-right: 20px;
	padding-top: 5px;
}

.psr {
	position: relative;
	bottom: 0;
}
/*1)laptop컴퓨터용
		디바이스 장치가 최소 1200일 때=> 모니터 크기가 1200px이상일 때*/
@media screen and (min-width: 1200px) {
}
/*2)laptop이하일 때:  타블렛 & 스마트폰용*/
@media screen and (max-width: 1199px) {
}

/*3)타블렛일때만의 스타일*/
@media screen and (max-width: 992px) {
	.psr {
		position: relative;
		bottom: 0;
	}
}
/*4)스마트폰일때만의 스타일*/
@media screen and (max-width: 768px) {
}
</style>
</head>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="c##test"
	password="1234" />


<%
request.setCharacterEncoding("UTF-8");
String sessionId = (String) session.getAttribute("sessionId");
List buildList = (List) request.getAttribute("buildList");

NumberFormat numberFormat = NumberFormat.getInstance();
%>

<body>
	<!-- 18-15)로그인 시 세션에 저장했던 sessionId 와 BoardController 에서
		 request 에 저장한 속성값들을 얻어와서 변수에 저장 -->

	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
		<h1 class="display-4">
			[
			<%=sessionId%>
			]님의 견적 내역
		</h1>
		<hr class="mt-5">
		<p class="">
			<small style="color: gray">견적은 2개까지만 저장 가능합니다.</small>
		</p>
	</div>

	<div class="container pb-5 mb-5">

		<%
		if (buildList.size() > 1) {
		%>
		<div class="row mb-5">
			<%
			for (int i = 0; i < 2; i++) {
				BuildDTO buildDTO = (BuildDTO) buildList.get(i);
			%>

			<div class="col-12 col-lg-6 display-inline psr my-3">

				<div class="card pb-5">
					<form action="BuildList.bu" method="post" name="buildList">
						<div class="m-3">
							<h3><%=buildDTO.getCarname()%></h3>
							<h4><%=buildDTO.getEngine()%>
								<%=buildDTO.getTrim()%>
								<%=buildDTO.getTransmission()%></h4>
							<div>
								<img src="../resources/images/cars/<%=buildDTO.getCar_image()%>"
									alt="이미지" class="cs_img" />
							</div>
							<%
							String carPrice = "";
							if (buildDTO.getOptionPrice() == null) {
								int carP = Integer.parseInt(buildDTO.getCarPrice());
								carPrice = numberFormat.format(carP);
							} else if (buildDTO.getOptionPrice() != null) {
								String[] spl = buildDTO.getOptionPrice().split(",");
								int pri = 0;
								for (int j = 0; j < spl.length; j++) {
									pri += Integer.parseInt(spl[j]);
								}

								int carP = Integer.parseInt(buildDTO.getCarPrice());
								carPrice = numberFormat.format(carP + pri);
							}
							%>
							<div class="psr">
								<h3><%=carPrice%>
									원
								</h3>
								<br />

								<div>
									<h5 class="display-inline">등록일</h5>
									&nbsp;&nbsp;
									<h4 class="display-inline"><%=buildDTO.getLogtime()%></h4>
								</div>
								<hr class="bgc-whith" />

								<div class="card-body row blink">
									<div class="col-6 display-inline">
										<!-- collapse -->
										<a class="btn btn-dark btn_black col-12"
											data-toggle="collapse" href="#collapseExample<%=i %>" role="button"
											aria-expanded="false" aria-controls="collapseExample"> 내역 </a>
									</div>
									<!-- collapse -->
									<input type="hidden" value="<%=buildDTO.getListNum()%>"
										name="listNum" /> <input type="hidden" value="<%=sessionId%>"
										name="id" />
									<button type="submit" class="btn btn-dark btn_black col-6">상세
										정보</button>
								</div>
								<!-- card-body -->


								<div class="collapse show" id="collapseExample<%=i %>">
									<div class="row">
										<div class="col-6">
											<div>선택 옵션</div>
											<%
											String optionN = buildDTO.getOptionName();
											String optionP = buildDTO.getOptionPrice();
											String tOPF = "";
											if (optionN == null) {
												optionN = "옵션 선택안함";
												optionP = "0";
												tOPF = "0";
											}
											String[] sON = optionN.split(",");
											String[] sOP = optionP.split(",");
											int sOPP = 0;

											int tOP = 0;

											for (int k = 0; k < sON.length; k++) {
												sOPP = Integer.parseInt(sOP[k]);
												tOP += sOPP;
												String sOPF = numberFormat.format(sOPP);
											%>
											<div>
												<p class="display-inline">
													ㆍ<%=sON[k]%></p>
											</div>
											<%
											}
											%>
										</div>
										<!-- card card-body -->
										<div class="border-left col-6">
											<div>선택 컬러</div>
											<%
											String incolor = buildDTO.getIn_color();
											String outcolor = buildDTO.getOut_color();
											%>
											<div>
												ㆍ외장 :
												<%=outcolor%>
											</div>
											<div>
												ㆍ내장 :
												<%=incolor%>
											</div>
										</div>

										<!-- <hr class="bgc-lightGray" /> -->
									</div>
									<!-- row -->
								</div>
								<!-- collapse text -->
							</div>
						</div>
					</form>
				</div>

			</div>
			<%
			} /* for i=0 i<2 */
			%>
		</div>
		<!-- row -->
		<%
		} else if (buildList.size() == 1) {
		%>
		<div class="row mb-5">
			<%
			for (int i = 0; i < 1; i++) {
				BuildDTO buildDTO = (BuildDTO) buildList.get(i);
			%>

			<div class="col-12 col-lg-6 display-inline psr">
				<form action="BuildList.bu" method="post" name="buildList">
					<div class="card">
						<div class="m-3">
							<h3><%=buildDTO.getCarname()%></h3>
							<h4><%=buildDTO.getEngine()%>
								<%=buildDTO.getTrim()%>
								<%=buildDTO.getTransmission()%></h4>
							<div>
								<img src="../resources/images/cars/<%=buildDTO.getCar_image()%>"
									alt="이미지" class="cs_img" />
							</div>
							<%
							String carPrice = "";
							if (buildDTO.getOptionPrice() == null) {
								int carP = Integer.parseInt(buildDTO.getCarPrice());
								carPrice = numberFormat.format(carP);
							} else if (buildDTO.getOptionPrice() != null) {
								String[] spl = buildDTO.getOptionPrice().split(",");
								int pri = 0;
								for (int j = 0; j < spl.length; j++) {
									pri += Integer.parseInt(spl[j]);
								}

								int carP = Integer.parseInt(buildDTO.getCarPrice());
								carPrice = numberFormat.format(carP + pri);
							}
							%>
							<div class="psr">
								<h3><%=carPrice%>
									원
								</h3>
								<br />

								<div>
									<h5 class="display-inline">등록일</h5>
									&nbsp;&nbsp;
									<h4 class="display-inline"><%=buildDTO.getLogtime()%></h4>
								</div>
								<hr class="bgc-whith" />
								<div class="card-body row blink">
									<div class="col-6 display-inline">
										<!-- collapse -->
										<a class="btn btn-dark btn_black col-12"
											data-toggle="collapse" href="#collapseExample" role="button"
											aria-expanded="false" aria-controls="collapseExample"> 내역
											</a>
									</div>
									<!-- collapse -->
									<input type="hidden" value="<%=buildDTO.getListNum()%>"
										name="listNum" /> <input type="hidden" value="<%=sessionId%>"
										name="id" />
									<button type="submit" class="btn btn-dark btn_black col-6">상세
										정보</button>
								</div>
								<!-- card-body -->


								<div class="collapse show" id="collapseExample">
									<div class="row p-2">
										<div class="col-6">
											<div>선택 옵션</div>
											<%
											String optionN = buildDTO.getOptionName();
											String optionP = buildDTO.getOptionPrice();
											String tOPF = "";
											if (optionN == null) {
												optionN = "옵션 선택안함";
												optionP = "0";
												tOPF = "0";
											}
											String[] sON = optionN.split(",");
											String[] sOP = optionP.split(",");
											int sOPP = 0;

											int tOP = 0;

											for (int k = 0; k < sON.length; k++) {
												sOPP = Integer.parseInt(sOP[k]);
												tOP += sOPP;
												String sOPF = numberFormat.format(sOPP);
											%>
											<div>
												<p class="display-inline">
													ㆍ<%=sON[k]%></p>
											</div>
											<%
											}
											%>
										</div>
										<!-- card card-body -->
										<div class="border-left col-6">
											<div>선택 컬러</div>
											<%
											String incolor = buildDTO.getIn_color();
											String outcolor = buildDTO.getOut_color();
											%>
											<div>
												ㆍ외장 :
												<%=outcolor%>
											</div>
											<div>
												ㆍ내장 :
												<%=incolor%>
											</div>
										</div>

										<!-- <hr class="bgc-lightGray" /> -->
									</div>
									<!-- row -->
								</div>
								<!-- collapse text -->



							</div>
						</div>
					</div>
				</form>
			</div>
			<%
			} /* for i=0 i<2 */
			%>
		</div>
		<!-- row -->
		<%
		} else {
		%>
		<div class="container pb-5 mb-5">
			<div class="col-12 col-lg-6 display-inline psr" style="height: 200px">
				<h1 style="text-align: center;">저장된 견적이 없습니다.</h1>
			</div>
		</div>
		<%
		}
		%>


	</div>

	<%@include file="../footer.jsp"%>
	<!-- bootstrap js cdn -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<script>
		function checkForm() {
			document.buildList.submit();
		}
		
	</script>

</body>
</html>