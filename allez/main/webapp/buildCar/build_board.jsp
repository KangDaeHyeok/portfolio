<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적 완료</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
crossorigin="anonymous">

<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
ol li {
	list-style: none;
}
.jumbotron{
    	background-color : #fff;
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

.jumbotron {
	background-color: #fff;
}

.btn-link {
	color: black !important;
}

.btn-link:hover {
	color: black !important;
}

.card-header {
	background-color: #F8F8F8 !important;
}

.card-body {
	background-color: #FFF;
	color: #000000;
}

.font-size {
	font-size: 20px;
	margin: auto 0;
}

select {
	width: 200px;
	padding: 5px;
	border: 1px solid #999;
	font-family: 'Nanumgothic';
	background: url('https://i.ibb.co/98Vbb8L/gnb-bg.gif') no-reqeat 95% 50%;
	border-radius: 3px;
	appearance: none;
	-webkit-appearance: none;
}

.bgc-whith {
	background-color: #E7E7E7;
	height: 1px;
	border-radius: 5px;
}

.color img {
	width: 48px;
	display: inline;
	border-radius: 50%;
	margin-right: 20px;
	padding-top: 5px;
}

.r-0 {
	right: 0;
}

.l-0 {
	left: 0;
}

.display-block {
	display: block;
}

.display-inline {
	display: inline;
}

.d-n {
	display: none;
}

.m-1 {
	margin: 0.5%;
}

#installmentPrincipal {
	/* margin-left:-9999px; */
	
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
	.lgmt{
		margin-top: 10px;
	}


}
/*4)스마트폰일때만의 스타일*/
@media screen and (max-width: 768px) {

}

</style>
</head>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />
	<%
	request.setCharacterEncoding("UTF-8");
	String sessionId = (String) session.getAttribute("sessionId");
	String result = (String)request.getAttribute("result");
	

	String carname = request.getParameter("carname");
	String engine = request.getParameter("filter_engine");
	String transmission = request.getParameter("filter_transmission");
	String trimName[] = request.getParameterValues("trimName");

	//trim price
	String LGRadio = request.getParameter("LGRadio");
	String car_img[] = request.getParameterValues("car_img");

	/* 내장in 외장out 컬러 */
	String OutColor = request.getParameter("OutColor");
	String InColor = request.getParameter("InColor");

	/* 내장in 외장out 컬러 파일주소 */
	String outColor_img[] = request.getParameterValues("outColor_img");
	String inColor_img[] = request.getParameterValues("inColor_img");

	String trim = "";/* 트림 배열에서 뽑기 */
	if (carname.equals("니로 EV")) {
		if (LGRadio.equals("51140000")) {
			trim = trimName[0];
		} else if (LGRadio.equals("53930000")) {
			trim = trimName[1];
		}
	} else if (carname.equals("Avante")) {
		if (LGRadio.equals("18250000")) {
			trim = trimName[0];
		} else if (LGRadio.equals("21510000")) {
			trim = trimName[1];
		} else if (LGRadio.equals("25070000")) {
			trim = trimName[2];
		} else if (LGRadio.equals("27840000")) {
			trim = trimName[3];
		}
	}

	String carImgFile = "";/* 차 이미지, 색으로 비교 */
	String outColorImgFile = ""; /* 외장 컬러 배열 뽑기*/
	if (carname.equals("니로 EV")) {
		if (OutColor.equals("스틸 그레이")) {
			carImgFile = "niro_EV/" + car_img[0];
			outColorImgFile = "niro_EV/" + outColor_img[0];
		} else if (OutColor.equals("시티스케이프 그린")) {
			carImgFile = "niro_EV/" + car_img[1];
			outColorImgFile = "niro_EV/" + outColor_img[1];
		} else if (OutColor.equals("미네랄 블루")) {
			carImgFile = "niro_EV/" + car_img[2];
			outColorImgFile = "niro_EV/" + outColor_img[2];
		} else if (OutColor.equals("런웨이 레드")) {
			carImgFile = "niro_EV/" + car_img[3];
			outColorImgFile = "niro_EV/" + outColor_img[3];
		}
	} else if (carname.equals("Avante")) {
		if (OutColor.equals("퍼포먼스 블루")) {
			carImgFile = "avante/" + car_img[0];
			outColorImgFile = "avante/" + outColor_img[0];
		} else if (OutColor.equals("어피스 블랙 펄")) {
			carImgFile = "avante/" + car_img[1];
			outColorImgFile = "avante/" + outColor_img[1];
		}
	}

	String inColorImgFile = ""; /* 내장 컬러 배열 뽑기 */
	if (InColor.equals("챠콜")) {
		inColorImgFile = inColor_img[0];
	} else if (InColor.equals("라이트 그레이 투톤")) {
		inColorImgFile = inColor_img[1];
	}

	/* 니로 EV 옵션 */
	String Hud = "";
	String HudPrice = "";
	String DriveWise = "";
	String DriveWisePrice = "";
	String SunRoop = "";
	String SunRoopPrice = "";
	String SmartConnect = "";
	String SmartConnectPrice = "";
	String Comfort = "";
	String ComfortPrice = "";
	String HarmanKardon = "";
	String HarmanKardonPrice = "";
	String HighTech = "";
	String HighTechPrice = "";

	/* Avante 옵션 */
	String wheel = "";
	String WheelPrice = "";
	String ASunRoop = "";
	String ASunRoopPrice = "";
	String Sheet = "";
	String SheetPrice = "";
	String AComfort = "";
	String AComfortPrice = "";

	if (carname.equals("니로 EV")) {
		Hud = request.getParameter("Hud");
		HudPrice = request.getParameter("HudPrice");
		DriveWise = request.getParameter("DriveWise");
		DriveWisePrice = request.getParameter("DriveWisePrice");
		SunRoop = request.getParameter("SunRoop");
		SunRoopPrice = request.getParameter("SunRoopPrice");
		SmartConnect = request.getParameter("SmartConnect");
		SmartConnectPrice = request.getParameter("SmartConnectPrice");
		Comfort = request.getParameter("Comfort");
		ComfortPrice = request.getParameter("ComfortPrice");
		HarmanKardon = request.getParameter("HarmanKardon");
		HarmanKardonPrice = request.getParameter("HarmanKardonPrice");
		HighTech = request.getParameter("HighTech");
		HighTechPrice = request.getParameter("HighTechPrice");

	} else if (carname.equals("Avante")) {
		wheel = request.getParameter("wheel");
		WheelPrice = request.getParameter("WheelPrice");
		ASunRoop = request.getParameter("ASunRoop");
		ASunRoopPrice = request.getParameter("ASunRoopPrice");
		Sheet = request.getParameter("Sheet");
		SheetPrice = request.getParameter("SheetPrice");
		AComfort = request.getParameter("AComfort");
		AComfortPrice = request.getParameter("AComfortPrice");
	}

	String title = engine + " " + trim + " " + transmission;

	/* comma */
	NumberFormat numberFormat = NumberFormat.getInstance();
	int carP = Integer.parseInt(LGRadio);
	String carPrice = numberFormat.format(carP);

	String NiroOption[] = {Hud, DriveWise, SunRoop, SmartConnect, Comfort, HarmanKardon, HighTech};
	String NiroOptionP[] = {HudPrice, DriveWisePrice, SunRoopPrice, SmartConnectPrice, ComfortPrice, HarmanKardonPrice,
			HighTechPrice};

	String AvanOption[] = {wheel, ASunRoop, Sheet, AComfort};
	String AvanOptionP[] = {WheelPrice, ASunRoopPrice, SheetPrice, AComfortPrice};

	int tot = 0;
	if (carname.equals("니로 EV")) {
		for (int i = 0; i < NiroOption.length; i++) {
			if (NiroOptionP[i] != null) {
		int optionP = Integer.parseInt(NiroOptionP[i]);
		tot += optionP;
			}
		}
	} else if (carname.equals("Avante")) {
		for (int i = 0; i < AvanOption.length; i++) {
			if (AvanOptionP[i] != null) {
		int optionP = Integer.parseInt(AvanOptionP[i]);
		tot += optionP;
			}
		}
	}
	String totalPrice = numberFormat.format(tot + carP);

	/* 인도금 계산 */
	int indo = tot + carP - 101900;
	String indoStr = numberFormat.format(indo);

	/* 선수금 최소금액 총액 10% */
	String[] spl = totalPrice.split(",");
	String RangeMin = spl[0];
	String mins = spl[0] + "0000";
	int minsp = Integer.parseInt(mins);
	String minspl = numberFormat.format(minsp);

	/* 선수금 최대금액 원금 - 300만 */
	String[] splA = totalPrice.split("0,0");
	String spladd = splA[0];
	String[] splS = spladd.split(",");
	String lostspl1 = splS[0] + splS[1];
	int lostspl2 = Integer.parseInt(lostspl1);
	int lostMax = lostspl2 - 300;
	String lostsplit = numberFormat.format(lostMax);

	/* 할부원금 출력문 표기 금액 */
	int totcash = tot + carP;
	String tcsSpl = spl[0] + "0000"; /* 최소금액 */
	int tcspl = Integer.parseInt(tcsSpl);
	int tcash = totcash - tcspl;/* 원금-최소금액 */
	String totalCashSplit = numberFormat.format(tcash); /* 할부원금 */

	/* 선수금 value 최대치 */
	int maxC = (lostMax * 10000);

	/* 할부금액/개월 */
	int au = tcash / 12;
	String aus = numberFormat.format(au);
	/* System.out.print(  ); */
	%>
	
<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="c##test" password="1234" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
	select count(*) from buildList where id = ?
	<sql:param value="<%=sessionId %>" />	
</sql:query>

<c:forEach items="${resultSet.rowsByIndex }" var="row">
	<c:forEach items="${row }" var="data">
		<input type="hidden" id="dataValue" value="${data}">
	</c:forEach>
</c:forEach>

	<div class="jumbotron text-center">
		<h1 class="display-4">고객님의 [ <%=carname%> ] 견적이 완성되었습니다.</h1>
	    <hr class="mt-5">
	    <p class=""><small>견적은 2개까지만 작성 가능합니다.</small></p>
	</div>
	<div class="container mb-5 pb-5">
		<form action="BuildAdd.bu" method="post" name="buildForm">
			<!-- <form action="buildList.jsp" method="get" name="buildForm"> -->
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="accordion" id="accordionExample">
						<div class="card blink">
							<div class="card-header" id="headingOne">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left" type="button"
										data-toggle="collapse" data-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										<p class="float-left font-size">차량 가격</p>
										<p class="float-right font-size"><%=totalPrice%>
											원
										</p>
									</button>
								</h2>
							</div>

							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordionExample">
								<p></p>
								<div class="card-body font-size">
									<div class="top mb-5 ">
										<h3><%=carname%></h3>
										<input type="hidden" value="<%=carname%>" name="carname" />
										<h5><%=title%></h5>
										<input type="hidden" value="<%=engine%>" name="engine" /> <input
											type="hidden" value="<%=trim%>" name="trim" /> <input
											type="hidden" value="<%=transmission%>" name="transmission" />
										<div class="titleprice float-right"><%=carPrice%>
											원
										</div>
										<input type="hidden" value="<%=carP%>" name="carPrice" />
									</div>
									<hr class="bgc-whith" />
									<h3>컬러</h3>
									<div class="color my-3">
										<div class="imgfile float-left">
											<img src="../resources/images/cars/<%=outColorImgFile%>"
												alt="<%=OutColor%>"> <input type="hidden"
												value="<%=outColorImgFile%>" name="outColorImgFile" />
										</div>
										<div class="d-inline">
											<div class="color_name mb-1">외장</div>
											<strong><%=OutColor%></strong> <input type="hidden"
												value="<%=OutColor%>" name="outColor" />
										</div>
									</div>
									<div class="color my-3">
										<div class="imgfile float-left">
											<img
												src="../resources/images/cars/niro_EV/<%=inColorImgFile%>"
												alt="<%=InColor%>"> <input type="hidden"
												value="<%=inColorImgFile%>" name="inColorImgFile" />
										</div>
										<div class="d-inline">
											<div class="color_name mb-1">내장</div>
											<strong><%=InColor%></strong> <input type="hidden"
												value="<%=InColor%>" name="inColor" />
										</div>
									</div>
									<div class="mb-5">
										<div class="titleprice float-right">0 원</div>
									</div>
									<hr class="bgc-whith" />
									<h3>선택 옵션</h3>
									<%
									if (carname.equals("니로 EV")) {
										String allOptionName = "";
										String allOptionPrice = "";
										for (int i = 0; i < NiroOption.length; i++) {
											if (NiroOptionP[i] != null) {
											int optionP = Integer.parseInt(NiroOptionP[i]);
											String optionPrice = numberFormat.format(optionP);
											allOptionName += (NiroOption[i] + ",");
											allOptionPrice += (NiroOptionP[i] + ",");
									%>
									<div class="options my-3"><%=NiroOption[i]%>
										<div class="titleprice float-right"><%=optionPrice%>원</div>
									</div>
									<%
										}
									}
									%>
									<input type="hidden" value="<%=allOptionName%>"
										name="optionName" /> <input type="hidden"
										value="<%=allOptionPrice%>" name="optionPrice" />
									<%
									} else if (carname.equals("Avante")) {
									String allOptionName = "";
									String allOptionPrice = "";
									for (int i = 0; i < AvanOption.length; i++) {
										if (AvanOptionP[i] != null) {
											int optionP = Integer.parseInt(AvanOptionP[i]);
											String optionPrice = numberFormat.format(optionP);
											allOptionName += (AvanOption[i] + ",");
											allOptionPrice += (AvanOptionP[i] + ",");
									%>
									<div class="options my-3">
										<%=AvanOption[i]%><div class="titleprice float-right"><%=optionPrice%>
											원
										</div>
									</div>
									<%
									}
									}
									%>
									<input type="hidden" value="<%=allOptionName%>"
										name="optionName" /> <input type="hidden"
										value="<%=allOptionPrice%>" name="optionPrice" />
									<%
									}/*  else if (carname.equals("Avante")) */
									%>
								</div>
								<!-- card-body -->
							</div>
							<!-- #collapseOne -->
						</div>
						<!-- .card -->



						<div class="card blink">
							<div class="card-header" id="headingTwo">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left collapsed"
										type="button" data-toggle="collapse"
										data-target="#collapseTwo" aria-expanded="false"
										aria-controls="collapseTwo">
										<p class="float-left font-size">탁송</p>
										<div class="float-right font-size">
											<p class="ConP display-inline">0</p>
											<p class="display-inline">원</p>
										</div>
									</button>
								</h2>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordionExample">
								<p></p>
								<div class="card-body">

									<input type="radio" id="Consignment" name="consignment"
										onclick='javascript:show1_hide2()' value="탁송의뢰" checked /> <label
										for="Consignment" class="blink">탁송 의뢰</label> <input type="radio"
										id="SelfConsignment" name="consignment"
										onclick='javascript:hide1_show2()' value="본인탁송" /> <label
										for="SelfConsignment" class="blink">본인 탁송</label> <br />
									<div class="ml-4 mt-4 col-12 display-inline Consignment1"
										id="reg">
										<select name="region" class="col-5  mt-2 blink" id="region1">
											<option disabled selected value="0">시/도 선택</option>
											<option value="156000">서울</option>
											<option value="153000">경기</option>
											<option value="307000">강원</option>
											<option value="213000">충청</option>
											<option value="258000">전라</option>
											<option value="273000">경상</option>
											<option value="509000">제주</option>
										</select>
									</div>
									<div class="ml-4 mt-4 col-12 display-inline Consignment1 mb-2"
										id="whouse1">
										<select name="warehouse" class="col-5  my-2 blink" id="warehouse1">
											<option disabled selected value="0">출고장 선택</option>
											<option value="덕평">덕평</option>
											<!-- 경기도, 서울시, 강원도 -->
											<option value="화성">화성</option>
											<!-- 경기도 -->
											<option value="광명">광명</option>
											<!-- 경기도 -->
											<option value="서산">서산</option>
											<!-- 충청도 -->
											<option value="충주">충주</option>
											<!-- 충청도 -->
											<option value="신태인">신태인</option>
											<!-- 전라북도 -->
											<option value="경산">경산</option>
											<!-- 경상도 -->
											<option value="광주">광주</option>
											<!-- 전라남도 -->
										</select>
									</div>
								</div>
								<!-- card body -->
							</div>
						</div>
						<div class="card blink">
							<div class="card-header" id="headingThree">
								<h2 class="mb-0">
									<button class="btn btn-link btn-block text-left collapsed"
										type="button" data-toggle="collapse"
										data-target="#collapseThree" aria-expanded="false"
										aria-controls="collapseThree">
										<p class="float-left font-size">결제 방법</p>
									</button>
								</h2>
							</div>
							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordionExample">
								<p></p>
								<div class="card-body">
									<small>결제 방법을 선택하시고, 지불조건 및 납입 사항을 확인해 주세요</small>
									<p></p>
									<input type="radio" id="Cash" name="cashWay" checked
										onclick='javascript:cash_show()' value="현금" /> <label
										for="Cash" class="blink">현금</label> <input type="radio"
										id="Installment" name="cashWay"
										onclick='javascript:cash_hide()' value="할부" /> <label
										for="Installment" class="blink">할부</label> <br />
									<div class="options my-3" id="cash1">
										<p class="float-left font-size">계약금</p>
										<p class="float-right font-size">100,000 원</p>
										<br />
										<br />
										<p class="float-left font-size">인도금</p>
										<p class="float-right font-size indo"><%=indoStr%>
											원
										</p>
										<br />
										<br />
										<p class="float-left font-size">단기 의무 보험료</p>
										<p class="float-right font-size">1,900 원</p>
									</div>

									<br />

									<div class="options my-3 d-n" id="cash2">
										<div class="form-group">
											<label for="formControlRange1" class="font-size">선수금</label>
											<br /> <span class="float-right">선수금 금액</span> <br />
											<br /> <span id="value3" class="float-right font-size">
												<%=minspl%> 원
											</span> <input type="hidden" value="<%=minspl%>" name="prepayment"
												id="prepayment" /> <br /> <br />
											<p class="float-left"><%=spl[0]%>
												만원
											</p>
											<p class="float-right"><%=lostsplit%>
												만원
											</p>
											<div class="blink">
											<input type="range" class="form-control-range RValue1 "
												id="formControlRange1" min="<%=tcspl%>" max="<%=maxC%>"
												step="10000" value="<%=tcspl%>" oninput="CashValue1()">
												</div>
											<span id="value1" class="float-right font-size">할부 원금
												<%=totalCashSplit%> 원
											</span> <input type="hidden" value="<%=totalCashSplit%>"
												name="installmentPrincipal" id="installmentPrincipal" />
										</div>

										<br />
										<hr class="bgc-whith" />

										<div class="form-group">
											<label for="formControlRange2" class="font-size">할부
												기간</label> <span id="value2" class="float-right font-size">12
												개월</span> <input type="hidden" value="12" name="monthPeriod"
												id="monthPeriod" /> <br /> <br />
											<p class="float-left">12 개월</p>
											<p class="float-right">60 개월</p>
											<div class="blink">
											<input type="range" class="form-control-range RValue2"
												id="formControlRange2" min="12" max="60" step="12"
												value="12" oninput="CashValue2()">
											</div>
											<span id="value4"
												class="float-right font-size">월 <%=aus%> 원
											</span> <input type="hidden" value="<%=aus%>" name="payInstallments"
												id="payInstallments" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-4 lgmt">
					<div class="card">
						<div class="m-3">
							<h3><%=carname%></h3>
							<h5><%=title%></h5>
							<img src="../resources/images/cars/<%=carImgFile%>"
								class="card-img-top" alt="<%=carname%>"> <input
								type="hidden" value="<%=carImgFile%>" name="carImgFile" />
							<div class="card-body">
								<hr class="bgc-whith" />
								<p class="display-inline">|</p>
								<a href='<c:url value="/reserve/test_drive.jsp?id=${sessionId}"/>' class="mr-3 display-inline blink">시승
									신청</a>
								<p class="display-inline">|</p>
								<a href="../board/events_board.jsp" class="display-inline blink">이벤트
									보기</a> <br />
								<br /> <input type="hidden" value="<%=sessionId%>" name="id" />
								
								<div class="row">
									<div class="col-6 d-inline blink pb-1">
										<a href="./BuildCar.jsp?carname=<%=carname%>"><button type="button"
										class="btn  btn-dark btn_black  m-1 "
										style="width: 100%; height: 100%"
										>취소</button></a>
									</div>
									<div class="col-6 d-inline blink pb-1">
										<button type="button"
										class="btn  btn-dark btn_black  m-1 "
										style="width: 100%; height: 100%"
										onclick='javascript:checkForm()'>견적 저장</button>
									</div>
								</div>
								<!-- <button type="submit" class="btn btn-primary btn-dark btn_black col-12 m-1" style="width:100%; height: 100%"
							onclick='javascript:checkForm()'>
							견적 저장
							</button> -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
				<hr class="bgc-whith" />
					<ul>
						<h5>유의 사항</h5>
							<li>본 견적서는 고객님의 차량 구입(청약) 의사 결정에 도움을 드리고자 작성된 것으로 법적인 효력은
								없으며, 계약을 원하실 경우 별도로 청약 의사 표시를 하셔야 합니다.</li>
							<li>자동차 취등록세 및 부대비용, 등록비용은 고객님의 이해를 돕기 위한 부분으로 정확한 금액은 반드시
								지점, 대리점에 확인하시기 바랍니다.</li>
							<li>공채 금액은 매일매일 변경되는 부분으로 자세한 내용은 지점 대리점으로 문의 부탁드립니다.</li>
							<li>실제 계약 내용은 계약하실 시점의 차량가격, 판매조건, 대출조건에 따라 본 견적 내용과 달라질 수
								있으며, 본 견적은 법적구속력이 없습니다.</li>
							<li>알레는 지점, 대리점의 영업담당을 통해서만 판매되며, 전국 어느 곳에서나 동일한 가격과 조건으로
								제공되고 있습니다.</li>
					</ul>
				</div><!-- col-12 -->
			</div>
			<!-- row -->
		</form>
	</div>
	<!-- container -->
	<jsp:include page="../footer.jsp"/>

<!-- bootstrap js cdn -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {
		if(${result == "success"}){
			alert("견적 저장, 내역 페이지로 이동합니다.");
			document.removefrm.submit();
		} else if(${result == "fail"}){
			alert("견적을 저장하기 위한 공간이 부족합니다.");
		}
		function Comma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			return num.toString().replace(regexp, ',');
		}
		/* 탁송 title 오른쪽 가격 택스트 바꾸기 */
		$("#region1").change(function(){
		    var ConP = $(this).val();
		    var CMConP = Comma(ConP);
		    $(".ConP").text(CMConP);
		});
		
		var Con = $("#Consignment");
		var SelfCon = $("#SelfConsignment"); 
		var region = $("#region1");
		var warehouse1 = $("#warehouse1");
		
		var conprice = $("#region1 option:selected").val(); 
		var numConp = parseInt(conprice);
		var tot = indo+numConp;
		var indo = <%=indo%>;
		var indoC = Comma(<%=indo%>);
		
		/* 탁송값이 달라졌을대 결제 방법의 택스트 변화 */
		region.click(function(){
			$("input[name=consignment]:checked").each(function(e){
				conprice = $("#region1 option:selected").val(); 
				numConp = parseInt(conprice);
				tot = indo+numConp;
				$(".indo").text(Comma(tot)+" 원");
				/* console.log("region.click : tot : "+tot); */
			})
		})
		
		Con.click(function(){
			$("input[name=consignment]:checked").each(function(e){
				conprice = $("#region1 option:selected").val(); 
				numConp = parseInt(conprice);
				tot = indo+numConp;
				$(".indo").text(Comma(tot)+" 원");
			})
		})
		
		SelfCon.click(function(){
			$("input[name=consignment]:checked").each(function(e){
				$(".indo").text(indoC+" 원");
			})
		})
		
	});
	
</script>

<script>
function confirmEstimation(){
	var dataValue = document.getElementById('dataValue').value;
	if(dataValue == '2'){
		alert("견적은 2개까지만 작성 가능합니다.");
	}
}	
function Comma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

function show1_hide2(){
	var region = document.getElementById('reg');
	region.style.display = 'inline';
	var value = $("#region1 option:selected").val();
	$(".ConP").text(Comma(value));

}

function hide1_show2(){
	var region = document.getElementById('reg');
	region.style.display = 'none';
	$(".ConP").text(0);
}

function cash_show(){
	var cash1 = document.getElementById('cash1');
	cash1.style.display = 'inline';
	var cash2 = document.getElementById('cash2');
	cash2.style.display = 'none';
	
}

function cash_hide(){
	var cash1 = document.getElementById('cash1');
	cash1.style.display = 'none';
	var cash2 = document.getElementById('cash2');
	cash2.style.display = 'inline';
	
}

function CashValue1(){
	var value1 = document.getElementById('formControlRange1').value;
	var value2 = document.getElementById('formControlRange2').value;

	var tot = <%=totcash%> - value1;
	var aus = tot/value2;
	var floorAus = Math.floor(aus);
	document.getElementById('value1').innerHTML="할부 원금 "+Comma(tot)+" 원";
	document.getElementById('value3').innerHTML=Comma(value1)+" 원";
	document.getElementById('value4').innerHTML="월 "+Comma(floorAus)+" 원";
	
	$("#installmentPrincipal").val(tot);
	$("#prepayment").val(value1);
	$("#payInstallments").val(floorAus);
}

function CashValue2(){
	var value1 = document.getElementById('formControlRange1').value;
	var value2 = document.getElementById('formControlRange2').value;
	 
	var tot = <%=totcash%> - value1;
	var aus = tot/value2;
	var floorAus = Math.floor(aus);
	document.getElementById('value2').innerHTML=value2+" 개월";
	document.getElementById('value4').innerHTML="월 "+Comma(floorAus)+" 원";
	$("#monthPeriod").val(value2);
	$("#payInstallments").val(floorAus);
	
}

function checkForm(){
	if(${sessionId == null}){ // 로그인이 되어 있지 않으면 if조건문이 true
		alert("로그인해 주세요");
		location.href="../member/LoginMember.jsp";
		return false;
	}
	if ($("input[name=consignment]:checked").val() == "탁송의뢰") {
		if ($("#region1").val() == null) {
			alert("탁송 받을 지역을 선택해 주세요.");
			return false;
		}else if ($("#warehouse1").val() == null) {
			alert("출고장을 선택해 주세요");
			return false;
		}
	}else if($("input[name=consignment]:checked").val() == "본인탁송"){
		if ($("#warehouse1").val() == null) {
			alert("출고장을 선택해 주세요");
			return false;
		}
	}
	confirmEstimation();
	document.buildForm.submit();
	
}

</script>
</body>
</html>