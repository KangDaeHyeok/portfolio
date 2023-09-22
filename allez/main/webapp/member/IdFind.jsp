<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
</style>

</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	    <h1 class="display-4">아이디 찾기</h1>
	    <hr class="mt-5">
	    <p class=""><small>회원가입시 작성한 이름과 이메일로 아이디를 찾으세요.</small></p>
	</div>
	
	<div class="container mb-5 pb-5 blink">
		<div class="row justify-content-center">
			<form action="findId.do" method="post" name="Idfind">
				<div class="form-group row mx-2">
					<label class="col-sm-3">이름</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-11 form-control" name="name" id="name">
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">이메일</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-5 form-control mr-2" name="mail1" maxlength="50"> @
							<select name="mail2" class="ml-2 col-5" id="mail2">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
					</div>
				</div>
				<hr />
				<div class="form-group row float-right mx-2">
					<a href="LoginMember.jsp" class="btn btn-danger">취소</a>
					<input type="button" class="btn btn-primary ml-2" value="찾기" onclick="CheckEmail()"/>
					<input type="hidden" id="email_hidden"/>
				</div> 
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
	<script>
	
		

		function CheckEmail() {

			if (!document.Idfind.name.value) {
				alert("이름을 입력하세요");
				return false;
			}
			if (!document.Idfind.mail1.value) {
				alert("이메일을 입력하세요");
				return false;
			}
			if (!document.Idfind.mail2.value) {
				alert("이메일을 입력하세요");
				return false;
			}
			
			
			alert("아이디를 이메일로 발송했습니다. 조회되지 않는 사용자일 경우 이메일이 전송되지 않을 수 있습니다.");
			
			document.Idfind.submit();
		}
	</script>
</body>
</html>