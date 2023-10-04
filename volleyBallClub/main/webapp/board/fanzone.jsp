<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A | 한국도로공사 하이패스 배구단</title>
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
</head>
<body>
	<div id="fanzone_wrapper" class="tot_wrap">
		<%@include file="../header.jsp" %>
		<section id="main">
			<div class="p_wrapper">
				<p class="uppercase italic bo">fanzone</p>
				<h1 class="bo">Q & A</h1>
				<p class="uppercase bo">korea expressway women's volleyball club</p>
			</div>
		</section>
		
		<section id="fanzone">
			<div class="fanzone_wrapper">
				<div class="table_wrapper">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${notice}">
								<c:if test="${notice.id eq 'admin'}">
									<tr style="background-color: #f4f4f4;">
										<td>
											공지사항
										</td>
										<td>
											<a onclick="return checkLogin()" href="/selectContent?idx=${notice.idx}">${notice.title}</a>
										</td>
										<td>${notice.writer}</td>
										<td>${notice.insert_time.substring(0,10)}</td>
										<td>${notice.count}</td>
									</tr>
								</c:if>
							</c:forEach>
						
							<c:forEach var="list" items="${list}">
						    	<tr>
									<td>
										${list.idx}
									</td>
									<td>
										<c:choose>
											<c:when test="${list.secret eq '1'}">
											 	<form action="/selectContent?idx=${list.idx}" id="secret_form" method="post" >
											 		<input type="hidden" name="secret_num" value="${list.secret_num}"/>
											 		<a href="#" class="checkSecret">
												 		<span class="material-symbols-outlined">lock</span>
												 		${list.title}
												 	</a>
											 	</form>
										    </c:when>
										    <c:otherwise>
										    	<a onclick="return checkLogin()" href="/selectContent?idx=${list.idx}">${list.title}</a>
										    </c:otherwise>
										</c:choose>
									</td>
									<td>${list.writer}</td>
									<td>${list.insert_time.substring(0,10)}</td>
									<td>${list.count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>	
				
				<div class="write_wrap">
					<a onclick="return checkLogin()" href="/writeBoard">글쓰기</a>
				</div>
				
				<div class="page_wrap">
					<ul>
				    	<li class="pagination_first">
				      		<a href="/board/fanzone?num=${page.startPageNum}">처음</a>
				    	</li>
				    	
				    	<c:if test="${page.prev}">
					    	<li>
					      		<a href="/board/fanzone?num=${page.startPageNum-1}${page.searchTypeKeyword}">&lt;</a>
					    	</li>
				    	</c:if>
					
					    <c:forEach var="num" begin="${page.startPageNum}" end="${page.endPageNum}">
					    	<li class="pagination_button">
					    	
					    	 <c:if test="${select != num}">
							 	<a href="/board/fanzone?num=${num}${page.searchTypeKeyword}">${num}</a>
							 	</c:if>    
							  
							 <c:if test="${select == num}">
							 	<b>${num}</b>
							 </c:if>
							 
					    	</li>
					    </c:forEach>
					
						<c:if test="${page.next}">
							<li>
					      		<a href="/board/fanzone?num=${page.endPageNum+1}${page.searchTypeKeyword}">&gt;</a>
					    	</li>
				    	</c:if>
				    	
					    <li class="pagination_last">
					        <a href="/board/fanzone?num=${page.endPageNum}">마지막</a>
					    </li>
					</ul>
					<form action="" name="page_form" method="post">
						<input type="hidden" name="pageNo" />
					</form>
				</div>
                
				<div class="search_wrap">
                    <form action="/board/fanzone" name="search_form" method="post"  >
                        <div class="search_content">
                            <select name="searchType">
                                <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if> >제목</option>
                                <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if> >내용</option>
                                <option value="total" <c:if test="${page.searchType eq 'total'}">selected</c:if> >전체</option>
                                <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if> >작성자</option>
                            </select>
                            <input type="text" name="keyword" value="${page.keyword}"/>
                            <button type="submit" >검색</button>
                        </div>
                        <input type="hidden" name="num" value="1" />
                    </form>
                </div>
				
			</div>
		</section>
		<%@include file="../footer.jsp" %>
	</div>
	<script src="../resources/js/myJS.js"></script>
	<script>
		$(function(){
			//게시글 비밀번호 확인
			var checkSecret = $(".checkSecret");
			
			checkSecret.click(function(){
				var logId = '${logId}';
				if(logId == null || logId == ''){
					alert("로그인해주세요");
					
					location.href = "/profile/login";
					return false;
				}
				
				var secret_form = $(this).parent();
				// 사용자가 설정한 비밀번호
				var secret_num = $(this).siblings().val();
				
				var input_password = prompt("비밀글 등록시 설정한 비밀번호를 입력하세요.");
				
				if(input_password == null){
					return false;
				} else if(secret_num == input_password){
					secret_form.submit();
				} else if(secret_num != input_password){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				} 
			})
		})
		
		function checkLogin(){
			var logId = '${logId}';
			if(logId == null || logId == ''){
				alert("로그인해주세요");
				
				location.href = "/profile/login";
				return false;
			}
		}
	</script>
</body>
</html>