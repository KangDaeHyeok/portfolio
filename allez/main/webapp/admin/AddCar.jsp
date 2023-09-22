<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 : 모델 등록</title>
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
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	    <h1 class="display-4">모델 추가</h1>
	    <hr class="mt-5">
	    <p class=""><small>새로운 모델의 차량을 추가하세요.</small></p>
	</div>

	
	<div class="container mb-5 pb-5 blink">
		<div class="row justify-content-center">
			<form action="AddCar.ad" method="post" name="AddCar" enctype="multipart/form-data">
				<div class="form-group row mx-2">
					<label class="col-sm-3">모델 종류</label>
					<div class="col-sm-9">
						<input type="radio" id="ev" value="ev" name="carModel">
						<label for="ev" class="mr-3">ev</label>
						<input type="radio" id="sedan" value="sedan" name="carModel">
						<label for="sedan" class="mr-3">sedan</label>
						<input type="radio" id="suv" value="suv" name="carModel">
						<label for="suv" class="mr-3">suv</label>
						<input type="radio" id="truck" value="truck" name="carModel">
						<label for="truck" class="mr-3">truck</label>
					</div>
				</div>

				<div class="form-group row mx-2">
					<label class="col-sm-3">모델명</label>
					<div class="col-sm-9">
						<input type="text" class="col-12 form-control" name="carName">
					</div>
				</div>
				
				<div class="form-group row mx-2">
					<label class="col-sm-3">모델 가격</label>
					<div class="col-sm-9">
						<input type="text" class="col-12 form-control" name="price">
					</div>
				</div>

				<div class="form-group row mx-2">
					<label class="col-sm-3">이미지</label>
					<div class="col-sm-9">
						<input type="file" value="이미지 등록" name="carImage">
					</div>
				</div>
				<hr />
				<div class="row float-right mx-2">
					<input class="btn btn-success" type="button" value="등록" onclick="AddValidation()" />
				</div> 
			</form>
		</div><!-- row -->
	</div><!-- container -->
	
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
	<script>
		function AddValidation(){
			
			if(!document.AddCar.carModel.value){
				alert("모델 종류를 입력해 주세요");
				return false;
			}
			if(!document.AddCar.carName.value){
				alert("모델명을 입력해 주세요");
				return false;
			}
			if(!document.AddCar.price.value){
				alert("모델 가격을 입력해 주세요");
				return false;
			}
			if(!document.AddCar.carImage.value){
				alert("모델 이미지를 첨부해 주세요");
				return false;
			}
			document.AddCar.submit();
			alert("모델이 등록되었습니다.");
		}
	</script>
</body>
</html>