<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

<%
	String ts = "00";
%>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	    <h1 class="display-4">회원가입</h1>
	    <hr class="mt-5">
	    <p class=""><small>다양한 혜텍을 받을 수 있는 Allez의 멤버가 되어보세요.</small></p>
	</div>

	<div class="container mb-5 pb-5 blink">
		<div class="row justify-content-center">
			<form action="JoinMemberAction.do" method="post" name="newMember">
				<div class="form-group row mx-2">
					<label class="col-sm-3">아이디</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="form-control col-10 col-md-6" name="id" id="duplication">
							<input type="button" value="확인" onclick="duplicationCheck()"/>
							<div class="col-2"></div>
							<input type="hidden" id="id_hidden"/>
							<small class="text-danger">* 아이디는 4~12자의 영문 소문자와 숫자를 포함하여 입력하세요.</small>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">비밀번호</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="password" class="col-10 col-md-6 form-control" name="password">
							<div class="col-2"></div>
							<small class="d-block text-danger"> *비밀번호는 4~12자의 영문 대소문자와 숫자, 특수문자를 포함</small>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">비밀번호 확인</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="password" class="col-10 col-md-6 form-control" name="password_confirm">
							<div class="col-2"></div>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">이름</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-10 col-md-6 form-control" name="name">
							<div class="col-2"></div>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">생일</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-6 form-control" name="birthyy" placeholder="년(4자)" size="2" maxlength="4">
							<select name="birthmm" class="mr-2" id="birthmm">
								<option value=<%=ts%>>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<input type="text" name="birthdd" maxlength="2" placeholder="일" size="1" />	
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">이메일</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" id="inactive" class="col-4 form-control mr-2" name="mail1" maxlength="50"> @
							<select name="mail2" class="mx-2" id="mail2">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
							<input type="button" value="인증" onclick="CheckEmail()"/>
							<input type="hidden" id="email_hidden"/>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3"></label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-10 col-md-6 form-control" placeholder="인증번호" id="test" name="test">
							<input type="button" value="확인" onclick="CheckNum()"/>
							<div class="col-2"></div>
						</div>
					</div>
				</div>
				<div class="form-group row mx-2">
					<label class="col-sm-3">연락처</label>
					<div class="col-sm-9">
						<div class="row">
							<input type="text" class="col-2 form-control mr-2" name="phone1" maxlength="3">-
							<input type="text" class="col-2 form-control mx-2" name="phone2" maxlength="4">-
							<input type="text" class="col-2 form-control ml-2" name="phone3" maxlength="4">
						</div>
					</div>
				</div>
				<hr />
				<div class="form-group row float-right mx-2">
					<a href="LoginMember.jsp" class="btn btn-danger">취소</a>
					<input class="btn btn-primary ml-2" type="button" value="회원가입" onclick="AddForm()" />
				</div> 
			</form>
		</div>
	</div><!-- container -->
	
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
	<script>
		function AddForm() {
			var regId = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,12}$/; //아이디 유효성 검사식
			var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,12}$/; //비밀번호 유효성 검사식
			
			
			/* ID 유효성 검사 */
			if (!regId.test(document.newMember.id.value)){
	            alert("아이디는 4~12자의 영문 소문자와 숫자를 포함하여 입력하세요.");
	            return false;
	        }
			

			/* password 유효성 검사 */
			if (!document.newMember.password.value) {
				alert("비밀번호를 입력하세요");
				return false;
			}
			if (!regPw.test(document.newMember.password.value)){
				alert("비밀번호는 4~12자의 영문 대소문자와 숫자, 특수문자를 포함해야 합니다.");
				return false;
			}
			if (!document.newMember.password_confirm.value) {
				alert("비밀번호 확인을 입력하세요");
				return false;
			}
			if (document.newMember.password.value != document.newMember.password_confirm.value) {
				alert("비밀번호를 동일하게 입력하세요");
				return false;
			}

			
			
			if (!document.newMember.name.value) {
				alert("이름을 입력하세요");
				return false;
			}
			if (!document.newMember.birthyy.value) {
				alert("년도를 입력하세요");
				return false;
			}
			if (birthmm.options[birthmm.selectedIndex].value ==<%=ts%>) {
				alert("월을 입력하세요");
				return false;
			}
			if (!document.newMember.birthdd.value) {
				alert("일을 입력하세요");
				return false;
			}
			if (!document.newMember.mail1.value) {
				alert("이메일을 입력하세요");
				return false;
			}
			if (!document.newMember.mail2.value) {
				alert("이메일을 입력하세요");
				return false;
			}
			
			
			/* 이메일 인증을 했는지 여부 유효성검사 */
			if ($("#test").val() != $("#email_hidden").val()) {
				alert("이메일인증을 확인해주세요");
				return false;
			}
			
			
			if (!document.newMember.phone1.value) {
				alert("연락처를 입력하세요");
				return false;
			}
			if (!document.newMember.phone2.value) {
				alert("연락처를 입력하세요");
				return false;
			}
			if (!document.newMember.phone3.value) {
				alert("연락처를 입력하세요");
				return false;
			}
			
			document.newMember.submit();
			
			alert("회원가입을 축하드립니다. 다시 로그인 해주세요");
		}
		
		
		/* 아이디 중복 검사 */
		function duplicationCheck(){
			var regId = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,12}$/; //아이디 유효성 검사식
			
			if (!document.newMember.id.value) {
				alert("아이디를 입력하세요");
				return false;
			}
			
			$.ajax({
				type : "POST", //POST 방식으로 전송
				url : "duplicationCheck.do", //duplicationCheck.do 주소로 보냄 (MemberController 클래스로 이동)
				data : {
					"id" : $("#duplication").val()
					},
				complete : function(data) {
					var responseText = data.responseText;
					//.val(data.responseText) : 값을 수정할 때 사용
					$("#id_hidden").val(responseText);//hidden속성을 가지고 있는 input 태그에 받아온 data값 저장

					if ($("#duplication").val() == $("#id_hidden").val()) {
						alert("이미 사용중인 아이디입니다.");
						} else {
							if (!regId.test(document.newMember.id.value)){
					            alert("아이디는 4~12자의 영문 소문자와 숫자를 포함하여 입력하세요.");
					            return false;
					        }
							else{
								alert("사용 가능한 아이디입니다.");
							}
							
						}
				}
				
			});
		}

		/* 이메일 인증 ajex */
		function CheckEmail() {
			
			if (!document.newMember.mail1.value) {
				alert("이메일을 입력하세요");
				return false;
			}

			$.ajax({
				type : "POST", //POST 방식으로 전송
				url : "EmailCheck.do", //EmailCheck.do 주소로 보냄 (MemberController 클래스로 이동)
				data : {
					"mail1" : $("#inactive").val(),
					"mail2" : $("#mail2").val()
					//data : {"변수1 명" : 변수1의 값} (형식으로 만든다)
				},
				complete : function(data) {
					console.log(data.responseText); //Dev Tools 콘솔창에 랜덤으로 만들어진 인증번호 표시
					var responseText = data.responseText;
					$("#email_hidden").val(responseText); //hidden속성을 가지고 있는 input 태그에 콘솔창에 뜬 인증번호 값 저장

					alert("인증번호를 발송했습니다.");
				}
				
			});
		}
		
		/* 인증확인 */
		function CheckNum(){
			if(($("#email_hidden").val()) != ""){
				if($("#test").val() == $("#email_hidden").val()){ //#test를 가진 input태그의 값과 #hidden을 가진 input태그의 값을 비교 
					alert("인증 되었습니다.");
					document.getElementById('inactive').readOnly = true;
					//입력받은 인증번호의 값이 일치하면 이메일 입력칸 비활성화
				}
				else{
					alert("인증 실패하였습니다.");
				}
			} else{
				alert("이메일 인증을 해주세요")
			} 	
		}
		
		
	</script>
</body>
</html>