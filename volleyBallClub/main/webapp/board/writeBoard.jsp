<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
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
	<div id="writeBoard_wrapper" class="tot_wrap">
		<%@include file="../header.jsp" %>
		<section id="main">
			<div class="p_wrapper">
				<p class="uppercase italic bo">fanzone</p>
				<h1 class="bo">Q & A</h1>
				<p class="uppercase bo">korea expressway women's volleyball club</p>
			</div>
		</section>
		
		<section id="writeBoard">
			<div class="writeBoard_wrapper">
				<div class="table_wrapper">
					<form action="/insertBoard" name="write_form" method="post">
						<table border="1">
							<tr>
								<td>제목</td>
								<td><input type="text" name="title"/></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" readonly name="writer" value="${Member_DTO.name}"/></td>
							</tr>	
							<c:if test="${logId eq 'admin'}">
								<tr>
									<td class="txt_left" colspan="2">
									 	<label><input type="radio" name="notice" value="0"> 일반글</label> &nbsp;&nbsp;
										<label><input type="radio" name="notice" value="1" checked> 공지글</label> &nbsp;&nbsp;
									</td>
								</tr>
						    </c:if>
							<tr>
								<td colspan="2" class="secret_prt txt_left">
									<input type="radio" name="secret" value="0" checked> 공개글 &nbsp;&nbsp;
									<input type="radio" name="secret" value="1"> 비밀글 &nbsp;&nbsp;
									<input type="text" id="secret_num" name="secret_num" value="">
     							</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea name="content" rows="25"></textarea>
								</td>
							</tr>
						</table>
						<div class="submit_wrap">
							<a href="#" onclick="pageBack()">이전</a>
							<a href="#" onclick="writeBoard()">작성</a>
						</div>
						<input type="hidden" name="id" value="${logId}" />
					</form>
				</div>	
			</div>
		</section>
		<%@include file="../footer.jsp" %>
	</div>
	<script src="../resources/js/myJS.js"></script>
	<script>
		$(function(){
			var secret = $(".secret_prt input[type=radio]");
			var secret_num = $("#secret_num");
			
			secret_num.attr("type","hidden");
			
			secret.click(function(){
				if($(this).val() == 1){
					secret_num.attr("type","text");
				} else if($(this).val() == 0){
					secret_num.attr("type","hidden");
				}
			})
		})
	</script>
</body>
</html>