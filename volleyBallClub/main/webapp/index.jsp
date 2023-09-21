<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한국로도공사 하이패스 배구단</title>
<!-- 파비콘 -->
<link rel="icon" href="./resources/images/home/04_table/hpic01.png">
<!-- css -->
<link rel="stylesheet" href="./resources/css/index_style.css" />
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
<div id="index_wrapper">
	<%@include file="header.jsp" %>
	<section id="carousel">
		<div class="carousel_left bo"><a href="#"></a></div>
		<div class="left_chevron"></div>
		<div class="carousel_center bo">
			<ul>
				<li class="active bo"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="carousel_btn">
			<ul class="btn">
				<li class="active">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li>6</li>
				<li>7</li>
			</ul>
		</div>

		<div class="carousel_right bo"><a href="#"></a></div>
		<div class="right_chevron"></div>
	</section>

	<section id="table_parent">
		<h1 class="uppercase bo animate__animated animate__fadeInUp">
			latest matches results of<br>
			this season
		</h1>
		<table>
			<thead>
				<tr>
					<td>날짜</td>
					<td>경기</td>
					<td>시간</td>
					<td>구장</td>
					<td>스코어</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="league_dto" items="${tableList}">
					<tr>
						<td><span>${league_dto.round }</span> ${league_dto.dates}</td>
						<td><div class="emblem_wrapper"><img src="./resources/images/home/04_table/${league_dto.team_img}" alt="${league_dto.team}">${league_dto.team}&emsp;<b>VS</b>&emsp;<img src="./resources/images/home/04_table/${league_dto.other_img}" alt="${league_dto.other}">${league_dto.other}</div></td>
						<td>${league_dto.times}</td>
						<td>${league_dto.area}</td>
						<td><span>${league_dto.score}</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>


	<section id="mobile_table_parent">
		<h1 class="uppercase bo animate__animated animate__fadeInUp">
			latest matches results of<br>
			this season
		</h1>
		<table>
			<thead>
				<tr>
					<td>날짜</td>
					<td>경기</td>
					<td>시간</td>
					<td>구장</td>
					<td>스코어</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="league_dto" items="${tableList}">
					<tr>
						<td><span>${league_dto.round }</span> ${league_dto.dates}</td>
						<td><div class="emblem_wrapper"><img src="./resources/images/home/04_table/${league_dto.team_img}" alt="${league_dto.team}">${league_dto.team}&emsp;<b>VS</b>&emsp;<img src="./resources/images/home/04_table/${league_dto.other_img}" alt="${league_dto.other}">${league_dto.other}</div></td>
						<td>${league_dto.times}</td>
						<td>${league_dto.area}</td>
						<td><span>${league_dto.score}</span></td>
					</tr>
				</c:forEach>
			</tbody>
				
		</table>
	</section>
	
	<section id="team">
		<div class="p_wrapper animate__animated animate__fadeInUp">
			<p class="uppercase italic ft_blue bo">meet our team</p>
			<h1 class="uppercase bo">meet the player</h1>
			<p class="capitalize bo">We sweat today to be champions tomorrow</p>
		</div>
		<div class="img_wrapper">
			<div class="img_parent">
				<c:forEach var="player_dto1" items="${playerList1}">
					<c:choose>
						<c:when test="${player_dto1.name eq '한국도로공사'}">
							<div>
								<a href="#"></a>
								<div><img src="./resources/images/home/05_team/${player_dto1.player_img }" alt=""></div>
								<p><strong>${player_dto1.name }</strong><br><a href="#"><i>${player_dto1.position }</i></a></p>
							</div>	
						</c:when>
						<c:otherwise>
							<div>
								<a href="#"></a>
								<div>
									<img src="./resources/images/home/05_team/${player_dto1.player_img }" alt="">
								</div>	
								<p>
									<strong>${player_dto1.name }</strong><br>
									<i>${player_dto1.position }</i>
									<a href="#">
										<span class="material-symbols-outlined">description</span>프로필보기
									</a>
								</p>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>



			<div class="img_parent">
				<c:forEach var="player_dto2" items="${playerList2}">
					<c:choose>
						<c:when test="${player_dto2.name eq '한국도로공사'}">
							<div>
								<a href="#"></a>
								<div><img src="./resources/images/home/05_team/${player_dto2.player_img }" alt=""></div>
								<p><strong>${player_dto2.name }</strong><br><a href="#"><i>${player_dto2.position }</i></a></p>
							</div>	
						</c:when>
						<c:otherwise>
							<div>
								<a href="#"></a>
								<div>
									<img src="./resources/images/home/05_team/${player_dto2.player_img }" alt="">
								</div>	
								<p>
									<strong>${player_dto2.name }</strong><br>
									<i>${player_dto2.position }</i>
									<a href="#">
										<span class="material-symbols-outlined">description</span>프로필보기
									</a>
								</p>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>



			<div class="img_parent">
				<c:forEach var="player_dto3" items="${playerList3}">
					<c:choose>
						<c:when test="${player_dto3.name eq '한국도로공사'}">
							<div>
								<a href="#"></a>
								<div><img src="./resources/images/home/05_team/${player_dto3.player_img }" alt=""></div>
								<p><strong>${player_dto3.name }</strong><br><a href="#"><i>${player_dto3.position }</i></a></p>
							</div>	
						</c:when>
						<c:otherwise>
							<div>
								<a href="#"></a>
								<div>
									<img src="./resources/images/home/05_team/${player_dto3.player_img }" alt="">
								</div>	
								<p>
									<strong>${player_dto3.name }</strong><br>
									<i>${player_dto3.position }</i>
									<a href="#">
										<span class="material-symbols-outlined">description</span>프로필보기
									</a>
								</p>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>


			<div class="img_parent">
				<c:forEach var="player_dto4" items="${playerList4}">
					<c:choose>
						<c:when test="${player_dto4.name eq '한국도로공사'}">
							<div>
								<a href="#"></a>
								<div><img src="./resources/images/home/05_team/${player_dto4.player_img }" alt=""></div>
								<p><strong>${player_dto4.name }</strong><br><a href="#"><i>${player_dto4.position }</i></a></p>
							</div>	
						</c:when>
						<c:otherwise>
							<div>
								<a href="#"></a>
								<div>
									<img src="./resources/images/home/05_team/${player_dto4.player_img }" alt="">
								</div>	
								<p>
									<strong>${player_dto4.name }</strong><br>
									<i>${player_dto4.position }</i>
									<a href="#">
										<span class="material-symbols-outlined">description</span>프로필보기
									</a>
								</p>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</section>



	<section id="mobile_team">
		<div class="p_wrapper animate__animated animate__fadeInUp">
			<p class="uppercase italic ft_blue bo">meet our team</p>
			<h1 class="uppercase bo">meet the player</h1>
			<p class="capitalize bo">We sweat today to be champions tomorrow</p>
		</div>
		<div class="img_wrapper">
			<div class="img_parent">
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/0.jpg" alt="on the rise"></div>
					<p><strong>한국도로공사</strong><br><a href="#"><i>하이패스 배구단</i></a></p>
				</div>
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/1.jpg" alt="김종민"></div>
					<p><strong>김종민</strong><br><i>감독</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>			
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/2.jpg" alt="캣벨"></div>
					<p><strong>캣벨</strong><br><i>아포짓</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>
			</div>
			<div class="img_parent">							
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/3.jpg" alt="안예림"></div>
					<p><strong>안예림</strong><br><i>세터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/4.jpg" alt="전세얀"></div>
					<p><strong>전세얀</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/5.jpg" alt="이윤정"></div>
					<p><strong>이윤정</strong><br><i>세터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
			</div>
			<div class="img_parent">
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/6.jpg" alt="이예림"></div>
					<p><strong>이예림</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/7.jpg" alt="임명옥"></div>
					<p><strong>임명옥</strong><br><i>리베로</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>			
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/8.jpg" alt="박정아"></div>
					<p><strong>박정아</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>	
			</div>
			<div class="img_parent">						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/9.jpg" alt="배유나"></div>
					<p><strong>배유나</strong><br><i>미들블로커</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/10.jpg" alt="이예담"></div>
					<p><strong>이예담</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/11.jpg" alt="문정원"></div>
					<p><strong>문정원</strong><br><i>아포짓</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>		
			</div>
			<div class="img_parent">
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/12.jpg" alt="정대영"></div>
					<p><strong>정대영</strong><br><i>미들블로커</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/13.jpg" alt="임주은"></div>
					<p><strong>임주은</strong><br><i>미들블로커</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>			
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/14.jpg" alt="차유정"></div>
					<p><strong>차유정</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>	
			</div>	
			<div class="img_parent">						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/15.jpg" alt="이미소"></div>
					<p><strong>이미소</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/16.jpg" alt="우수민"></div>
					<p><strong>우수민</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/17.jpg" alt="김세인"></div>
					<p><strong>김세인</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>	
			</div>
			<div class="img_parent">
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/18.jpg" alt="백체림"></div>
					<p><strong>백체림</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/19.jpg" alt="공은서"></div>
					<p><strong>공은서</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>			
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/20.jpg" alt="이예은"></div>
					<p><strong>이예은</strong><br><i>아웃사이더 히터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>
			</div>	
			<div class="img_parent">							
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/21.jpg" alt="정소율"></div>
					<p><strong>정소율</strong><br><i>세터</i><a href="#"><span class="material-symbols-outlined">description</span>프로필보기</a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/22.jpg" alt="한국도로공사 스포츠단"></div>
					<p><strong>한국도로공사</strong><br><a href="#"><i>하이패스 배구단</i></a></p>
				</div>						
				<div>
					<a href="#"></a>
					<div><img src="./resources/images/home/05_team/23.jpg" alt="한국도로공사 배구단"></div>
					<p><strong>한국도로공사</strong><br><a href="#"><i>하이패스 배구단</i></a></p>
				</div>	
			</div>
		</div>

	</section>

	<section id="club">
		<h1 class="uppercase bo animate__animated animate__fadeInUp">korea expressway women's<br>volleyball club</h1>
		<div class="bgwhite bo">
			<div class="bo animate__animated animate__fadeIn animate__delay-1s"><a href="#"></a></div>
			<p class="bo">꿈을 이룬시간, 아쉬움의 순간이 지나고, 다시 날아 오를시간<br>
				최고의 선수들과 최고의 팬들이 있는 열정 가득한 코트에<br>
				한국도로공사 배구단이 있을 수 있어<br>
				행복합니다.
			</p>
		</div>
	</section>
	<article id="photo">
		<div class="p_wrapper animate__animated animate__fadeInUp">
			<p class="uppercase italic ft_blue bo">view our stoty</p>
			<h1 class="uppercase bo">view latest photos</h1>
			<p class="uppercase bo">korea expressway women's volleyball club</p>
		</div>
		<div>
			<div class="photo_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2023-04-05</p>
				<a href="#" class="bo">2023. 03. 17 VS GS칼텍스</a>
			</div>
			<div class="photo_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2023-03-22</p>
				<a href="#" class="bo">2023. 03. 14 VS 페퍼저축은행</a>
			</div>
			<div class="photo_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2023-03-17</p>
				<a href="#" class="bo">2023. 03. 10 VS 현대건설</a>
			</div>
		</div>
	</article>
	<article id="media">
		<div class="p_wrapper animate__animated animate__fadeInUp">
			<p class="uppercase italic ft_blue bo">fell our story</p>
			<h1 class="uppercase bo">view latest media</h1>
			<p class="uppercase bo">korea expressway women's volleyball club</p>
		</div>
		<div>
			<div class="media_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2022-04-12</p>
				<a href="#" class="bo">[도공월간하드털이] 하드를 탈탈탈 털어보았습니다</a>
			</div>
			<div class="media_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2022-04-12</p>
				<a href="#" class="bo">[만우절 기념] 도공 공식 '찐친' 윤정&예림 Vlog)with ...</a>
			</div>
			<div class="media_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2022-04-12</p>
				<a href="#" class="bo">'엄지척' 칼림바 감성 연주 비하인드 &nbsp&nbsp&nbsp&nbsp| 박정아 생일 ...</a>
			</div>
		</div>
	</article>
	<section id="info">
		<div class="bo">
			<div class="p_wrapper">
				<h1 class="bo animate__animated animate__fadeInLeft">승리를 향한 열정과 긍정의 힘으로<br>
				도로공사 배구단 파이팅</h1>
				<div class="bo animate__animated animate__fadeInLeft"><a href="#">경기일정안내</a></div>
			</div>
		</div>
		<div class="bo">
			<div class="p_wrapper">
				<h1 class="bo animate__animated animate__fadeInRight">도로공사 배구단의<br>
				박진감 넘치는 경기를 직접 느껴보세요</h1>
				<div class="bo animate__animated animate__fadeInRight"><a href="#">티켓예매안내</a></div>
			</div>
		</div>
	</section>
	<article id="news">
		<div class="p_wrapper animate__animated animate__fadeInUp">
			<p class="uppercase italic ft_blue bo">read our story</p>
			<h1 class="uppercase bo">read latest news</h1>
			<p class="uppercase bo">korea expressway women's volleyball club</p>
		</div>	
		<div>
			<div class="news_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2023-01-06</p>
				<a href="#" class="bo">V-리그 세 번째 팀 맞이한 캣벨 "도로공사가 찾던 마...</a>
			</div>
			<div class="news_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2023-01-06</p>
				<a href="#" class="bo">도로공사 외국인 선수 교체, 카타리나→캣벨...6일 출...</a>
			</div>
			<div class="news_wrapper">
				<div class="bo">
					<a href="#"></a>
				</div>
				<p class="italic ft_blue bo">2023-01-06</p>
				<a href="#" class="bo">'한국 떠나는' 카타리나 "포기하지 않는 선수들의 집념...</a>
			</div>
		</div>
	</article>


	<nav id="lnb">
		<ul>
			<li class="bo animate__animated animate__fadeInLeft"><a href="#">코보</a></li>
			<li class="bo animate__animated animate__fadeInLeft"><a href="#">도드람</a></li>
			<li class="bo animate__animated animate__fadeInUp"><a href="#">한국도로공사</a></li>
			<li class="bo animate__animated animate__fadeInUp"><a href="#">하나은행</a></li>
			<li class="bo animate__animated animate__fadeInRight"><a href="#">김천시</a></li>
			<li class="bo animate__animated animate__fadeInRight"><a href="#">코오롱스포츠</a></li>
		</ul>
	</nav>
	
	<%@include file="footer.jsp" %>
	
	
</div>
	
<script src="./resources/js/myJS.js"></script>
</body>
</html>