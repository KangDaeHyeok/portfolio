<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.CarDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 : 모델 수정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	.jumbotron{
    	background-color : #fff;
    }
    .form-group{
    	width: 400px;
    }
    .opa{
    opacity: 0.5;
    }
</style>

</head>
<body>
<%
	CarDTO dto = (CarDTO)request.getAttribute("dto");
%>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	    <h1 class="display-4">모델 수정</h1>
	    <hr class="mt-5">
	    <p class=""><small>선택한 모델의 정보를 수정하세요.</small></p>
	</div>

	
	<div class="container mb-5 pb-5 blink">
		<div class="row justify-content-center">
			<form action="UpdateCar.ad" method="post" enctype="multipart/form-data" name="updateForm">
				<div class="form-group row mx-2">
					<label class="col-sm-3">모델 종류</label>
					<div class="col-sm-9 opa">
						<input type="radio" id="ev" value="<%=dto.getCarModel()%>" name="carModel"
						<% if("ev".equals(dto.getCarModel())){%>checked<%}%> onclick="return false;">
						<label for="ev" class="mr-3">ev</label>
						
						<input type="radio" id="sedan" value="<%=dto.getCarModel()%>" name="carModel"
						<% if("sedan".equals(dto.getCarModel())){%>checked<%}%> onclick="return false;">
						<label for="sedan" class="mr-3">sedan</label>
						
						<input type="radio" id="suv" value="<%=dto.getCarModel()%>" name="carModel"
						<% if("suv".equals(dto.getCarModel())){%>checked<%}%> onclick="return false;">
						<label for="suv" class="mr-3">suv</label>
						
						<input type="radio" id="truck" value="<%=dto.getCarModel()%>" name="carModel"
						<% if("truck".equals(dto.getCarModel())){%>checked<%}%> onclick="return false;">
						<label for="truck" class="mr-3">truck</label>
					
					</div>
				</div>

				<div class="form-group row mx-2">
					<label class="col-sm-3">모델명</label>
					<div class="col-sm-9">
						<input type="text" class="col-12 form-control" name="carName" value="<%=dto.getCarname()%>">
						<input type="hidden" name="carNameOrigin" value="<%=dto.getCarname()%>"/>
					</div>
				</div>

				<div class="form-group row mx-2">
					<label class="col-sm-3">모델 가격</label>
					<div class="col-sm-9">
						<input type="text" class="col-12 form-control" name="price" value="<%=dto.getPrice() %>">
					</div>
				</div>

				<div class="form-group row mx-2">
					<label class="col-sm-3">이미지</label>
					<div class="col-sm-9">
						<input type="file" value="이미지 등록" name="modelImage"/>
					</div>
				</div>
				<div class="row mx-2 float-right">
					<input class="btn btn-warning " type="button" value="수정" onclick="update()"/>
				</div>
			</form>
		</div><!-- center -->
	</div><!-- container -->
	
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>

<script>
	function update(){
		var confirmflag = confirm("해당 모델을 수정하시겠습니까?");
		
		if (confirmflag) {
			document.updateForm.submit();

		} else {
			return false;
		}
	}
</script>
</body>
</html>