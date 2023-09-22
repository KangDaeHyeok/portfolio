<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기, 재설정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	body{
		overflow-x:hidden;
	}
	.jumbotron{
    	background-color : #fff;
    }
    #none{
    	display:none;
    }
</style>

</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	    <h1 class="display-4">비밀번호 찾기</h1>
	    <hr class="mt-5">
	    <p class=""><small>회원가입시 작성한 정보로 비밀번호를 찾으세요.</small></p>
	</div>

	<div class="container mb-5 pb-5 blink">
		<div class="row justify-content-center">
			<form action="UpdatePassword.do" method="post" name="UpdatePw">
				<div class="form-group row mx-2">
					<label class="col-sm-3">아이디</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="form-control col-12" name="id" id="id">
						</div>
					</div>
				</div>
				
				<div class="form-group row mx-2">
					<label class="col-sm-3">이름</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-12 form-control" name="name" id="name">
						</div>
					</div>
				</div>
			
				<!-- 이메일 -->
				<div class="form-group row mx-2">
					<label class="col-sm-3">이메일</label>
					
					<div class="col-sm-9">
						<div class="row">
							<input type="text" id="mail1" class="col-5 form-control mr-2" name="mail1" maxlength="50"> @
							<select name="mail2" class="mx-2 col-4" id="mail2">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
							<input type="button" value="인증" onclick="CheckEmail()"/>
							<input type="hidden" id="e_hidden"/>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2 CheckNum">
					<label class="col-sm-3"></label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-10 form-control mr-2" placeholder="인증번호" id="number" name="number">
							<input type="button" value="확인" onclick="CheckNum()"/>
						</div>
					</div>
				</div>
				<!-- 비밀번호 재설정 -->
				<div id="none">
					<div class="form-group row mx-2">
						<label class="col-sm-3">새 비밀번호</label>
						<div class="col-sm-9">
							<div class="row">
								<input type="password" class="col-12 form-control" name="pwReset" id="pwReset">
							</div>
						</div>
					</div>
					<div class="form-group row mx-2">
						<label class="col-sm-3">비번 확인</label>
						<div class="col-sm-9">
							<div class="row">
								<input type="password" class="col-12 form-control" name="pwCheck" id="pwCheck">
							</div>
						</div>
					</div>
					<hr />
					<div class="form-group row float-right mx-2">
						<!-- <a href="LoginMember.jsp" class="btn btn-danger">취소</a> -->
						<input class="btn btn-primary ml-2" type="button" value="비밀번호 변경" onclick="Update()" />
					</div>
				</div><!-- none -->
				<div class="form-group row float-right mx-2">
					<a href="LoginMember.jsp" class="btn btn-danger">취소</a>	
				</div>
			</form>
		</div><!-- section2 -->
	</div>
	<!-- container -->

	<jsp:include page="../footer.jsp" />

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
	<script>
		
		/* 이메일 인증 ajex */
		function CheckEmail() {
			
			/* 빈칸 체크 */
			if (!document.UpdatePw.id.value) {
				alert("아이디를 입력하세요");
				return false;
			}
			if (!document.UpdatePw.name.value) {
				alert("이름을 입력하세요");
				return false;
			}
			if (!document.UpdatePw.mail1.value) {
				alert("이메일을 입력하세요");
				return false;
			}

			$.ajax({
				type : "POST", //POST 방식으로 전송
				url : "SearchData.do", //SearchData.do 주소로 보냄 (MemberController 클래스로 이동)
				data : {
					"id" : $("#id").val(),
					"name" : $("#name").val(),
					"mail1" : $("#mail1").val(),
					"mail2" : $("#mail2").val()
					//data : {"변수1 명" : 변수1의 값} (형식으로 만든다)
				},
				complete : function(data) {
					console.log(data.responseText); //Dev Tools 콘솔창에 랜덤으로 만들어진 인증번호 표시
					var responseText = data.responseText;
					$("#e_hidden").val(responseText); //hidden속성을 가지고 있는 input 태그에 콘솔창에 뜬 인증번호 값 저장

					alert("인증번호를 발송했습니다. 조회되지 않는 사용자일 경우 이메일이 전송되지 않을 수 있습니다.");
					
					
				}
				
			});
		}
		
		//인증 확인
		function CheckNum(){
		 	 if(($("#e_hidden").val()) != ""){
				if($("#number").val() == $("#e_hidden").val()){
					alert("인증 되었습니다.");
					
					//입력받은 인증번호의 값이 일치하면 이메일 입력칸 비활성화
					document.getElementById('mail1').readOnly = true;
					
					document.getElementById('none').style.display = "block";
					document.getElementById('block').style.display = "none";
				}
				else{
					alert("인증 실패하였습니다.");
				}
				
			} else{
				alert("이메일 인증을 해주세요")
			}  
			
		}
		
		
		//비밀번호 재설정
		function Update(){
			
			var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,12}$/; //비밀번호 유효성 검사식
			
			/* password 유효성 검사 */
			if (!document.UpdatePw.pwReset.value) {
				alert("비밀번호를 입력하세요");
				return false;
			}
			if (!regPw.test(document.UpdatePw.pwReset.value)){
				alert("비밀번호는 4~12자의 영문 대소문자와 숫자, 특수문자를 포함해야 합니다.");
				return false;
			}
			if (!document.UpdatePw.pwCheck.value) {
				alert("비밀번호 확인을 입력하세요");
				return false;
			}
			if (document.UpdatePw.pwReset.value != document.UpdatePw.pwCheck.value) {
				alert("비밀번호를 동일하게 입력하세요");
				return false;
			}
			
			document.UpdatePw.submit();
		}
	</script>
</body>
</html>