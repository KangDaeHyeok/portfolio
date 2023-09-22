<%@page import="java.text.NumberFormat"%>
<%@page import="mvc.model.BuildDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적 상세보기</title>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">



<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
.jumbotron{
    	background-color : #fff;
    }
.bgc-gray{
	background-color: #B9B9B9;
	height: 2px;
	border-radius: 5px;
}

.bgc-lightGray{
background-color: #E7E7E7;
	height: 1px;
	border-radius: 5px
}
.display-inline {
	display: inline;
}
.cs_img {
	width: 100%;
	display: inline;
	border-radius: 50%;
	margin-right: 20px;
	padding-top: 5px;
}
.color img{
width: 48px;
display: inline;
border-radius: 50%;
margin-right: 20px;
padding-top: 5px;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String sessionId = (String) session.getAttribute("sessionId");

List info = (List) request.getAttribute("info"); 

NumberFormat numberFormat = NumberFormat.getInstance();

BuildDTO dto = (BuildDTO) info.get(0);

String title = dto.getCarname()+" - "+dto.getEngine()+" | "+dto.getTransmission()+" | "+dto.getTrim();
String color = dto.getOut_color() +" | "+  dto.getIn_color();

int carPrice = Integer.parseInt(dto.getCarPrice());
String carPriceF = numberFormat.format(carPrice);

String optionN = dto.getOptionName();
String optionP = dto.getOptionPrice();
String tOPF = "";
if(optionN == null){
	optionN = "옵션 선택안함";
	optionP = "0";
	tOPF = "0";
}
String[] sON = optionN.split(",");
String[] sOP = optionP.split(",");	
int sOPP=0;

int tOP=0;
String consignment ="";
consignment = dto.getConsignment();
String region = dto.getRegion();
String regionP = dto.getRegion();
String wH = dto.getWarehouse();
int RP=0;

String cashWay = dto.getCashWay();

int totalPrice=0;


%>

	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
		<h1 class="display-4"><%=sessionId%> 님의 [ <%=dto.getCarname()%> ]</h1>
	    <hr class="mt-5">
	    <p class=""><small style="color: gray"><%=dto.getLogtime() %></small></p>
	</div>
	
	
	<div class="container pb-5 mb-5">
		<div class="row">
			<div class="col-12 col-lg-6">
				<hr class="bgc-gray" />
				<h5>ㆍ<%=title %></h5>
				<h5>ㆍ<%=color %></h5>
				<%-- <h5 class="color">ㆍ
					<img src="../resources/images/cars/<%=dto.getOutColor_image() %>" alt="외장 컬러" />
					|&nbsp;&nbsp;&nbsp;
					<img src="../resources/images/cars/niro_EV/<%=dto.getInColor_image() %>" alt="내장 컬러" />
				</h5> --%>

				<hr class="bgc-lightGray" />
				<h4 class="display-inline">모델 가격</h4><h4 class="float-right"><%=carPriceF%> 원</h4>
				<hr class="bgc-gray" />
				<%
					for(int i=0; i<sON.length; i++){
						sOPP = Integer.parseInt(sOP[i]);
						tOP += sOPP;
						String sOPF = numberFormat.format(sOPP);
						
				%>
				<div><h5 class="display-inline">ㆍ<%=sON[i] %></h5><h5 class="float-right"><%=sOPF %> 원</h5></div>
				<div style="line-height:40%;"><br /></div>
				<%
					}
				tOPF = numberFormat.format(tOP);
				%>
				<hr class="bgc-lightGray" />
				<h4 class="display-inline">옵션 가격</h4><h4 class="float-right"><%=tOPF%> 원</h4>
				<hr class="bgc-gray" />
				<%
				if(consignment.equals("탁송의뢰")){
					
					if(region.equals("156000")) region = "서울";
					if(region.equals("153000")) region = "경기";
					if(region.equals("307000")) region = "강원";
					if(region.equals("213000")) region = "충청";
					if(region.equals("258000")) region = "전라";
					if(region.equals("273000")) region = "경상";
					if(region.equals("509000")) region = "제주";
					
					RP = Integer.parseInt(regionP);
					String RPF = numberFormat.format(RP);
				%>
				<h5 class="display-inline">ㆍ탁송지 : <%=region%></h5><h5 class="float-right"><%=RPF %> 원</h5>
				<div style="line-height:40%;"><br /></div>
				<h5 class="display-inline">ㆍ출고장 : <%=wH %></h5><h5 class="float-right"> 0 원</h5>
				<hr class="bgc-lightGray" />
				<h4 class="display-inline">탁송료</h4><h4 class="float-right"><%=RPF%> 원</h4>
				<%
				}else if(consignment.equals("본인탁송")){
				%>
				<h5 class="display-inline">ㆍ출고장 : <%=wH %></h5><h5 class="float-right"> 0 원</h5>
				<hr class="bgc-lightGray" />
				<h4 class="display-inline">탁송료</h4><h4 class="float-right"> 0 원</h4>
				<%
				}
				%>
			</div>
			
			<div class="col-12 col-lg-6">
				<hr class="bgc-gray" />
				<img src="../resources/images/cars/<%=dto.getCar_image() %>" alt="" class="cs_img"/>
				<hr class="bgc-gray" />
				<%
				totalPrice = RP+tOP+carPrice;
				int indo = totalPrice - 101900;
				
				String indoF = numberFormat.format(indo);
				String TP = numberFormat.format(totalPrice);
				
				if(cashWay.equals("현금")){
				%>
					<h5 class="display-inline">ㆍ계약금</h5><h5 class="float-right">100,000 원</h5>
					<div style="line-height:40%;"><br /></div>
					<h5 class="display-inline">ㆍ인도금</h5><h5 class="float-right"><%=indoF%> 원</h5>
					<div style="line-height:40%;"><br /></div>
					<h5 class="display-inline">ㆍ단기 의무 보험료</h5><h5 class="float-right">1,900 원</h5>
					<hr class="bgc-lightGray" />
					<h4 class="display-inline">차량 총 견적 금액</h4><h4 class="float-right"><%=TP %> 원</h4>
				<% 
				}else if(cashWay.equals("할부")){
					String prepayment = dto.getPrepayment();
					int PP = Integer.parseInt(prepayment);
					String PPF = numberFormat.format(PP);
					
					String installmentPrincipal = dto.getInstallmentPrincipal();
					int IP = Integer.parseInt(installmentPrincipal);
					String IPF = numberFormat.format(IP);
					
					String monthPeriod = dto.getMonthPeriod();
					int MP = Integer.parseInt(monthPeriod);
					String MPF = numberFormat.format(MP);
					
					String payInstallments = dto.getPayInstallments();
					int PI = Integer.parseInt(payInstallments);
					String PIF = numberFormat.format(PI);
				%>
				<h5 class="display-inline">ㆍ선수금</h5><h5 class="float-right"><%=PPF%> 원</h5>
				<div style="line-height:40%;"><br /></div>
				<h5 class="display-inline">ㆍ할부원금</h5><h5 class="float-right"><%=IPF %> 원</h5>
				<div style="line-height:40%;"><br /></div>
				<h5 class="display-inline">ㆍ할부기간</h5><h5 class="float-right"><%=MPF %> 개월</h5>
				<div style="line-height:40%;"><br /></div>
				<h5 class="display-inline">ㆍ분할 납부금</h5><h5 class="float-right">월 <%=PIF %> 원</h5>
				<hr class="bgc-lightGray" />
				<h4 class="display-inline">차량 총 견적 금액</h4><h4 class="float-right"><%=TP %> 원</h4>
				
				<%
				}
				%>
				<hr class="bgc-gray" />
				
				<form action="Delete.bu" name="Delete" method="post">
					<input type="hidden" value="<%=dto.getListNum()%>" name="listNum"/>
					<input type="hidden" value="<%=sessionId%>" name="id"/>
					<button type="button" class="btn btn-info float-right m-1 blink p-2" onclick='javascript:deleteForm()'>내역 삭제</button>
				</form>
				<form action="List.bu" name="List" method="post" >
					<input type="hidden" value="<%=dto.getListNum()%>" name="listNum"/>
					<input type="hidden" value="<%=sessionId%>" name="id"/>
					<button type="button" class="btn btn-primary float-right m-1 blink p-2" onclick='javascript:listForm()'>이전</button>
				</form>
				</div>
			</div><!-- col-6 -->
		</div>
	</div><!-- container -->
	
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
	function deleteForm(){
		document.Delete.submit();
	}
	
	function listForm(){
		document.List.submit();
	}
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
</body>
</html>