<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	.jumbotron, .breadcrumb{
		background-color: #fff;
	}
	.breadcrumb-item a{
		color:#323232;
	}
	.breadcrumb-item a:hover{
		font-weight:bold;
	}
	
</style>

<%
String sessionId = (String) session.getAttribute("sessionId");
String ts = "00";
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="c##test"
	password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM allez_member WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>

</head>
<body onload="init()">
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />

	<div class="jumbotron text-center">
		<h1 class="display-4">마이 페이지</h1>
		<hr class="mt-5">
		<p class="">
			<small>내 정보 수정 / 견적과 예약 내역을 확인하세요.</small>
		</p>
	</div>

	<div class="container mb-5 pb-5">
		<div class="row">
			<div class="col-12 mb-3">
				<div class="row justify-content-center ">
					<nav aria-label="breadcrumb blink">
					  <ol class="breadcrumb">
						    <li class="breadcrumb-item"><a href="./List.bu?id=${sessionId}" class="blink">견적 내역</a></li>
						    <li class="breadcrumb-item"><a href="../reserveList.cal?id=${sessionId}" class="blink">시승 신청 내역</a></li>
					  </ol>
					</nav>
				</div>
				
			</div>
			
			<div class="col-12">
				<c:forEach var="row" items="${resultSet.rows}">
					<c:set var="mail" value="${row.email}" />
					<c:set var="mail1" value="${mail.split('@')[0]}" />
					<c:set var="mail2" value="${mail.split('@')[1]}" />

					<c:set var="birth" value="${row.birth_date}" />
					<c:set var="year" value="${birth.split('/')[0]}" />
					<c:set var="month" value="${birth.split('/')[1]}" />
					<c:set var="day" value="${birth.split('/')[2]}" />

					<c:set var="phone" value="${row.phone}" />
					<c:set var="phone1" value="${phone.split('-')[0]}" />
					<c:set var="phone2" value="${phone.split('-')[1]}" />
					<c:set var="phone3" value="${phone.split('-')[2]}" />

					<div class="row justify-content-center blink">
						<form name="newMember" class="form-horizontal" action="ProcessUpdateMember.jsp" method="post" onsubmit="return checkForm()">
							<div class="form-group row mx-2">
								<label class="col-sm-3">아이디</label>
								<div class="col-sm-9">
									<div class="row">
										<input type="text" class="form-control col-10 col-md-6 "
											name="id" id="duplication"
											value="<c:out value='${row.id }'/>" readonly>
										<div class="col-2"></div>
										<input type="hidden" id="id_hidden" />
									</div>
								</div>
							</div>
							<div class="form-group row mx-2">
								<label class="col-sm-3">비밀번호</label>
								<div class="col-sm-9">
									<div class="row">
										<input type="password" class="col-10 col-md-6 form-control "
											name="password" value="<c:out value='${row.password }'/>">
										<div class="col-2"></div>
										<small class="d-block text-danger"> *비밀번호는 4~12자의 영문
											대소문자와 숫자, 특수문자를 포함</small>
									</div>
								</div>
							</div>
							<div class="form-group row mx-2">
								<label class="col-sm-3">비밀번호 확인</label>
								<div class="col-sm-9">
									<div class="row ">
										<input type="password" class="col-10 col-md-6 form-control "
											name="password_confirm" placeholder="비밀번호 확인">
										<div class="col-2"></div>
									</div>
								</div>
							</div>
							<div class="form-group row mx-2">
								<label class="col-sm-3">이름</label>
								<div class="col-sm-9">
									<div class="row ">
										<input type="text" class="col-10 col-md-6 form-control"
											name="name" readonly value="<c:out value='${row.name }'/>">
										<div class="col-2"></div>
									</div>
								</div>
							</div>

							<div class="form-group row mx-2">
								<label class="col-sm-3">생일</label>
								<div class="col-sm-9">
									<div class="row">
										<input type="text" class="col-6 form-control " name="birthyy"
											placeholder="년(4자)" size="2" maxlength="4" value="${year}">
										<select name="birthmm" class="" id="birthmm">
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
										 <input type="text" name="birthdd" maxlength="2"
											placeholder="일" size="1" value="${day}" />
									</div>
								</div>
							</div>
							<div class="form-group row mx-2">
								<label class="col-sm-3">이메일</label>
								<div class="col-sm-9">
									<div class="row">
										<input type="text" id="inactive"
											class="col-10 col-md-6 form-control mr-2" name="mail1" maxlength="50"
											value="${mail}" readonly>
									</div>
								</div>
							</div>
							<div class="form-group row mx-2">
								<label class="col-sm-3">연락처</label>
								<div class="col-sm-9">
									<div class="row">
										<input type="text" class="col-2 form-control mr-2 "
											name="phone1" maxlength="3" value="${phone1}">- <input
											type="text" class="col-2 form-control mx-2 " name="phone2"
											maxlength="4" value="${phone2}">- <input type="text"
											class="col-2 form-control ml-2 " name="phone3" maxlength="4"
											value="${phone3}">
									</div>
								</div>
							</div>
							<hr />
							
							<div class="form-group row float-right mx-2">
								<input type="submit" class="btn btn-primary " value="수정">&nbsp;&nbsp;
								<button type="button" class="btn btn-danger" onclick="deleteMember()">탈퇴</button>
							</div> 
						</form>
					</div> <!-- row -->
				</c:forEach>
			</div>
		</div>
	</div>
	

	<jsp:include page="../footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
	function updateMember() {
		var confirmflag = confirm("수정 하시겠습니까?");
		if (confirmflag) {
			document.newMember.submit();
		} else {
			return false;
		}
	}
		function deleteMember(){
		    var confirmflag = confirm("회원탈퇴를 하시겠습니까?");

	           if(confirmflag){
	           		location.href="DeleteMember.jsp";

	           }else{
	            	return false;
	           }
		}
	
		
		function init() {
			setComboBirthValue("${month}");
		}

		function setComboBirthValue(val) {
			var selectBirth = document.getElementById('birthmm');
			for (i = 0, j = selectBirth.length; i < j; i++) {
				if (selectBirth.options[i].value == val) {
					selectBirth.options[i].selected = true;
					break;
				}
			}
		}
		function checkForm() {
			var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,12}$/; //비밀번호 유효성 검사식
			
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
			updateMember();
		}
	</script>
</body>
</html>