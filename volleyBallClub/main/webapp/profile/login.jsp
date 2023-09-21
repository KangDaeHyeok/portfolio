<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 한국도로공사 하이패스 배구단</title>
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
</head>
<body>
	<div id="login_wrapper" class="tot_wrap">
		<%@include file="../header.jsp" %>
		<section id="main">
			<div class="p_wrapper">
				<p class="uppercase italic bo">my page</p>
				<h1 class="bo">로그인</h1>
				<p class="uppercase bo">korea expressway women's volleyball club</p>
			</div>
		</section>
		
		<section id="login">
			<div class="login_wrapper">
				<div class="form_wrap">
					<form action="/login" name="login_form" method="post">
						<div class="input_wrap">
							<div class="log_wrap">
								<label for="id">아이디</label>
								<input type="text" name="id" id="id"/>
							</div>
							<div class="pas_wrap">
								<label for="password">비밀번호</label>
								<input type="password" name="password" id="password"/>
							</div>
						</div>
						<div class="submit_wrap">
							<a href="#" onclick="login()">로그인</a>
						</div>
					</form>
				</div>
				<div class="service_wrap">
					<p>소셜계정으로 간편하게 서비스를 이용하세요</p>
					<div>
						<a href=""><img width="40px" src="../resources/images/profile/icon-naver.png" alt="네이버" /></a>
						<a href=""><img width="40px" src="../resources/images/profile/icon-kakao.png" alt="카카오" /></a>
					</div>
					<ul>
						<li><a href="">아이디 찾기</a></li>
						<li><a href="">비밀번호 찾기</a></li>
						<li><a href="/profile/join">회원가입</a></li>
						<li><a href="">홈으로 이동</a></li>
					</ul>
				</div>
				
			</div>
		</section>
		<%@include file="../footer.jsp" %>
		
	</div>
	<script src="../resources/js/myJS.js"></script>
	<script>
		$(function(){
			//로그인 실패시
			var logMsg = "fail";
			if(logMsg == '${msg}') alert("유효하지 않은 아이디 또는 비밀번호입니다.");
		})
	</script>
</body>
</html>