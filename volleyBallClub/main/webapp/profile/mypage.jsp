<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 한국도로공사 하이패스 배구단</title>
<!-- 파비콘 -->
<link rel="icon" href="../resources/images/home/04_table/hpic01.png">
<!-- css -->
<link rel="stylesheet" href="../resources/css/myStyle.css" />
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&family=Roboto:wght@300;500;700&family=Rubik:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&family=Roboto:wght@300;500;700&display=swap" rel="stylesheet">
<!-- 애니메이션 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<!-- 구글아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- 구글 제이커리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- ajax 제이커리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div id="mypage_wrapper" class="tot_wrap">
		<%@include file="../header.jsp" %>
		<section id="main">
			<div class="p_wrapper">
				<p class="uppercase italic bo">my page</p>
				<h1 class="bo">마이페이지</h1>
				<p class="uppercase bo">korea expressway women's volleyball club</p>
			</div>
		</section>
		
		<section id="mypage">
			<div class="mypage_wrapper">
				<div class="form_wrap">
					<form action="/updateProfile" name="mypage_form" method="post">
						<div class="input_wrap">
							<div class="log_wrap">
								<label for="id">아이디<span>*</span></label>
								<input readonly type="text" name="id" id="id" value="${Member_DTO.id}"/>
							</div>
							<div class="name_wrap">
								<label for="name">이름<span>*</span></label>
								<input type="text" name="name" id="name" value="${Member_DTO.name}"/>
							</div>
							<div class="email_wrap">
								<label for="name">Email<span>*</span></label>
								<input type="text" name="email" id="email" value="${Member_DTO.email}"/>
							</div>
							<div class="phone_wrap">
								<label for="name">연락처<span>*</span></label>
								<input type="text" name="phone" id="phone" value="${Member_DTO.phone}"/>
							</div>
							<div class="zip_code_wrap">
								<label for="zip_code">우편번호<span>*</span></label>
								<input type="text" name="zip_code" id="zip_code" value="${Member_DTO.zip_code}" onclick="post()"/>
							</div>
							
							<div class="address_wrap">
								<label for="address">기본주소<span>*</span></label>
								<input type="text" name="address" id="address" value="${Member_DTO.address}"/>
							</div>
							<div class="detailed_address_wrap">
								<label for="name">상세주소</label>
								<input type="text" name="detailed_address" id="detailed_address" value="${Member_DTO.detailed_address}"/>
							</div>
							<div class="pas_wrap">
								<label for="password">비밀번호<span>*</span></label>
								<input type="password" name="password" id="password"/>
							</div>
							<div class="pas_check_wrap">
								<label for="password_ck">비밀번호 확인<span>*</span></label>
								<input type="password" name="password_ck" id="password_ck"/>
							</div>
						</div>
						<div class="submit_wrap">
							<button type="reset">취소</button>
							<button type="button" onclick="updateMember()" >정보수정</button>
							<button type="button" onclick="deleteMember()">회원탈퇴</button>
						</div>
						<p><span>*</span>필수입력</p>
					</form>
				</div>
			</div>
		</section>
		<%@include file="../footer.jsp" %>
	</div>
	<script src="../resources/js/myJS.js"></script>
</body>
</html>