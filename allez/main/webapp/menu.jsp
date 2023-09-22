<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- core태그를 쓰기 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

	
<style>
/* 기능이 동작하는 버튼 표시 */
.nav-item a{
	display:inline-block
}
.blink {
   animation: blink 1s infinite;
   box-sizing: border-box;
   color: black ;
}

@keyframes blink {
   0% {
      border: 2px dashed red;
      border: 2px dashed rgba(255,0,0,0);
      border-radius: 5px;
      background-color:rgba(255,0,0,0.2);
   }
   100% {
      border: 2px dashed red;
      border: 2px dashed rgba(255,0,0,0.7);
      border-radius: 5px;
      background-color:rgba(255,0,0,0.1);
     
   }
}

.m_blink{
	animation: m_blink 1s infinite;
}
@keyframes m_blink {
   0% {
      border: 2px dashed red;
      border: 2px dashed rgba(255,0,0,0);
      border-radius: 5px;
      background-color:rgba(255,0,0,0.2);
   }
   100% {
      border: 2px dashed red;
      border: 2px dashed rgba(255,0,0,0.7);
      border-radius: 5px;
      background-color:rgba(255,0,0,0.1);
     
   }
}

/*영상 위에 얹은 네비게이션 바*/
.userNav{
	position:relative;
	height:100px;
	z-index: 2;
}
.nav {
	position: absolute;
	top: 25px;
	margin-left: 4%;
}

.nav li a {
	color: white;
	font-size: 22px;
	font-weight: bold;
}

.nav li a img {
	width: 80px;
	height: 50px;
}

/*중앙 로고(홈 버튼)*/
.logo {
	position: absolute;
	top: 23px;
	margin-left: 50%;
}

.logo img {
	width: 3.4em;
	height: 2em;
}

/*우측 상단 로그인 & 게시판 버튼*/
.login {
	position: absolute;
	top: 25px;
	right: 4%;
}

.login li {
	text-decoration: none;
	list-style: none;
	float: left;
}


.login li a {
	color: white;
	font-size: 22px;
	font-weight: bold;
}


.dropdown-menu{
	pisition:relative;
	top: 70px;
	background-color: #323233;
}


.dropdown-menu a{
	font-size: 17px !important;
}


.dropdown-item:focus, .dropdown-item:hover{
	background-color: #fff0;
	color:gold;
}


.mobileNav{
	display:none;
}

.adminNav{
	justify-content : normal;
}

/*스마트 폰*/
@media screen and (max-width: 950px) {
	.userNav{
		display:none;
	}
	.mobileNav{
		display:block;
		background-color: #323232;
		height: 100px;
		z-index:9999;
	}
	.mobileNav .navbar-brand, .mobileNav .navbar-toggler{
		position: relative;
		top: 20px;
	}
	
	.mobileNav #navbarNav{
		position: relative;
		width: 950px;
	    top: 46px;
	    left: -16px;
	}
	.mobileNav #navbarNav .nav-item{
		position: relative;
		left: 15px;
	}
	.mobileNav #navbarNav .nav-item:hover>a{
		color:gold;
	}
	
	#navbarNav .nav-item>a, .dropdown-item{
		color:white;
		font-weight:bold;
	}
	
	.mobileNav .navbar-collapse{
		background-color: #323232;
		
	}
	
	
}

</style>

<nav class="navbar userNav" style="background-color: #323232;">
	<ul class="nav float-left blink">
		<li class="nav-item"><a class="nav-link" href='<c:url value="/car/models.jsp?model=ev"/>'>모델</a></li>
		<li class="nav-item"><a class="nav-link" href='<c:url value="/board/AboutUs.jsp"/>'>회사 소개</a></li>
		<li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	          시승 신청
	        </a>
	        <div class="dropdown-menu">
	        	<a class="dropdown-item blink" href='<c:url value="/reserve/test_drive.jsp?id=${sessionId}"/>'>시승 예약</a>
				<a class="dropdown-item blink" href='<c:url value="/Hugi_List.hg"/>'>시승 후기</a>
	        </div>
     	 </li>
     	 <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	          게시판
	        </a>
	        <div class="dropdown-menu">
	        	<a class="dropdown-item blink" href='<c:url value="/board/events_board.jsp"/>'>이벤트</a>
	        	<a class="dropdown-item blink" href='<c:url value="/board/Members.jsp"/>'>멤버스</a>
				<a class="dropdown-item blink" href='<c:url value="/board/faq_board.jsp"/>'>FAQ</a>
				<a class="dropdown-item blink" href='<c:url value="/list.bo?id=${sessionId}"/>'>문의하기</a>
	        </div>
     	 </li>
	</ul>
	<a class="navbar-brand logo" href='<c:url value="/index.jsp"/>'><img
		src='<c:url value="/resources/images/index/logo_footer.png"/>' class="blink"></a>
		
		
	<ul class="login float-right">
		<c:choose>
			<c:when test="${empty sessionId}">
				<li class="nav-item blink"><a class="nav-link" href='<c:url value="/member/LoginMember.jsp"/>'>로그인</a></li>
			</c:when>
			<c:otherwise>
				<div class="navbar blink">
					<li class="nav-item">
						<a class="nav-link logout" href='<c:url value="/member/logoutMember.jsp"/>'>로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href='<c:url value="/member/myPage.jsp?id=${sessionId}"/>'>마이 페이지</a>
					</li>
				</div>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>



<!-- 관리자 메뉴바 -->
<c:choose>
	<c:when test="${sessionId eq 'admin'}">
		<nav class="adminNav navbar navbar-expand-lg navbar-dark strong fixed-bottom"
			style="background-color: #323232">
			
			<a class="navbar-brand">관리자 모드</a>
			<a class="nav-link text-white blink" href='<c:url value="/admin/AddCar.jsp"/>'>모델 등록</a>
			<a class="nav-link text-white blink" href='<c:url value="/admin/Admin_ev_models.jsp?edit=update"/>'>모델 수정</a>
			<a class="nav-link text-white blink" href='<c:url value="/admin/Admin_ev_models.jsp?edit=delete"/>'>모델 삭제</a>
		</nav>
	</c:when>
</c:choose>	


<!-- 모바일 메뉴바 -->
<nav class="navbar navbar-expand-lg navbar-dark mobileNav">
	<a class="navbar-brand ml-3" href='<c:url value="/index.jsp"/>'> <img
		src='<c:url value="/resources/images/index/logo_footer.png"/>' class="m_blink">
	</a>
	<button class="navbar-toggler btn_ham float-right" type="button"
		data-toggle="collapse" data-target="#navbarNav"
		aria-controls="navbarNav" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon m_blink"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link m_blink"
				href='<c:url value="/car/models.jsp?model=ev"/>'>모델</a></li>
			<li class="nav-item"><a class="nav-link m_blink"
				href='<c:url value="/board/AboutUs.jsp"/>'>회사 소개</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle m_blink" href="#" role="button"
				data-toggle="dropdown" aria-expanded="false">시승 신청</a>
				<div class="dropdown-menu">
					<a class="dropdown-item m_blink"
						href='<c:url value="/reserve/test_drive.jsp?id=${sessionId}"/>'>시승 예약</a> <a
						class="dropdown-item m_blink" href='<c:url value="/Hugi_List.hg"/>'>시승 후기</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle m_blink" href="#" role="button"
				data-toggle="dropdown" aria-expanded="false">게시판</a>
				<div class="dropdown-menu">
					<a class="dropdown-item m_blink"
						href='<c:url value="/board/events_board.jsp"/>'>이벤트</a>
					<a class="dropdown-item m_blink"
						href='<c:url value="/board/Members.jsp"/>'>멤버스</a>	
						
					<a class="dropdown-item m_blink" href='<c:url value="/board/faq_board.jsp"/>'>FAQ</a>
					<a class="dropdown-item m_blink"
						href='<c:url value="/list.bo?id=${sessionId}"/>'>문의하기</a>
				</div></li>
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link m_blink"
						href='<c:url value="/member/LoginMember.jsp"/>'>로그인</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link m_blink logout"
						href='<c:url value="/member/logoutMember.jsp" /> '>로그아웃</a></li>
					<li class="nav-item"><a class="nav-link m_blink"
						href='<c:url value="/member/myPage.jsp?id=${sessionId}"/>'>마이 페이지</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>

<script>
	$(function(){
		
		var logout = $(".logout");
		
		logout.click(function(){
			alert("로그아웃 되었습니다.");
		})
		
	})
</script>
