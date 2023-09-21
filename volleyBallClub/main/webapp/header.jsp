<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<header>
	<div class="top">
		<div class="left bo">
			<a href="#">
				한국도로공사 테니스단 홈페이지
				<span class="material-symbols-outlined">arrow_forward</span>
			</a>
		</div>
		<div class="right bo">
			<c:choose>
				 <c:when test="${logId!=null}">
			        <a>
				        <span class="material-symbols-outlined">person</span>
						<c:out value="${logId}"/>님
					</a>
			    </c:when>
			    <c:otherwise>
			        <a href="/profile/join">
						<span class="material-symbols-outlined">person</span>
						회원가입
					</a>
			    </c:otherwise>
			</c:choose>
			
			
			<c:choose>
				 <c:when test="${logId!=null}">
			        <a href="/logout">
				        <span class="material-symbols-outlined">lock</span>
						로그아웃
					</a>
			    </c:when>
			    <c:otherwise>
			        <a href="/profile/login">
						<span class="material-symbols-outlined">lock_open</span>
						로그인
					</a>
			    </c:otherwise>
			</c:choose>
			
			
			<c:choose>
				 <c:when test="${logId!=null}">
			        <a href="/mypage">
						<span class="material-symbols-outlined">folder_open</span>
						마이페이지
					</a>
			    </c:when>
			    <c:otherwise>
			        <a href="#" onclick="loginpage()">
						<span class="material-symbols-outlined">folder_open</span>
						마이페이지
					</a>
			    </c:otherwise>
			</c:choose>
			
			
		</div>
	</div>
	<div class="nav_parent">
		<nav id="gnb" class="bo">
			<div class="left bo"><a href="/index">한국도로공사 하이패스 배구단</a></div>
			<ul>
				<li class="bo"><a href="/index" class="uppercase">home</a></li>
				<li class="bo"><a href="#" class="uppercase">exsports</a></li>
				<li class="bo"><a href="/club" class="uppercase">club</a></li>
				<li class="bo"><a href="/player" class="uppercase">player</a></li>
				<li class="bo"><a href="#" class="uppercase">game</a></li>
				<li class="bo"><a href="#" class="uppercase">media</a></li>
				<li class="bo"><a href="/board/fanzone" class="uppercase">fanzone</a></li>
			</ul>
			<div class="right">
				<a href="#" class="bo">instagram</a>
				<a href="#" class="bo">youtube</a>
				<a href="#" class="bo">facebook</a>
				<a href="#" class="bo">post</a>
			</div>
		</nav>
	</div>

	<div class="mobile_nav_parent">
		<nav id="mobile_gnb" class="bo">
			<div class="mobile_logo bo"><a href="/index">한국도로공사 하이패스 배구단</a></div>

			<div class="mobile_left_hambergerBtn"><a href="#">메뉴</a></div>

			<ul class="mobile_menu_left">
				<li class="bo"><a href="/index" class="uppercase">home</a></li>
				<li class="bo"><a href="#" class="uppercase">exsports</a></li>
				<li class="bo"><a href="/club" class="uppercase">club</a></li>
				<li class="bo"><a href="/player" class="uppercase">player</a></li>
				<li class="bo"><a href="#" class="uppercase">game</a></li>
				<li class="bo"><a href="#" class="uppercase">media</a></li>
				<li class="bo"><a href="/board/fanzone" class="uppercase">fanzone</a></li>
			</ul>

			<div class="mobile_right">
				<a href="#" class="bo">instagram</a>
				<a href="#" class="bo">youtube</a>
				<a href="#" class="bo">facebook</a>
				<a href="#" class="bo">post</a>
			</div>


			<div class="mobile_right_hambergerBtn"><a href="#">정보</a></div>
			
			<div class="mobile_menu_right">
				<span class="material-symbols-outlined close">
					close
				</span>
				<div class="account_wrapper">
					<h5 class="bo uppercase">my account</h5>
					<ul class="account">
						<c:choose>
							 <c:when test="${logId!=null}">
								<li class="bo"><a href="/logout">로그아웃</a></li>
						        <li class="bo"><a><c:out value="${logId}"/>님</a></li>
								<li class="bo"><a href="#">마이페이지</a></li>
						    </c:when>
						    <c:otherwise>
						        <li class="bo"><a href="/profile/login">로그인</a></li>
								<li class="bo"><a href="/profile/join">회원가입</a></li>
								<li class="bo"><a href="#" onclick="loginpage()">마이페이지</a></li>
						    </c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="sns_wrapper">
					<h5 class="bo uppercase">sns links</h5>
					<ul class="sns">
						<li class="bo"><a href="#">인스타그램</a></li>
						<li class="bo"><a href="#">유튜브</a></li>
						<li class="bo"><a href="#">페이스북</a></li>
						<li class="bo"><a href="#">네이버포스트</a></li>
					</ul>
				</div>
				<div class="tennis_wrapper">
					<h5 class="bo uppercase">family site</h5>
					<ul class="tennis">
						<li class="bo"><a href="#">한국도로공사 테니스단</a></li>
					</ul>
				</div>
				<div>
					<p>© COPYRIGHT KOREA EXPRESSWAY WOMEN’S<br>VOLLEYBALL CLUB.</p>
				</div>

			</div>
		</nav>
	</div>
</header>