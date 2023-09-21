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
	<div id="contentView_wrapper" class="tot_wrap">
		<%@include file="../header.jsp" %>
		<section id="main">
			<div class="p_wrapper">
				<p class="uppercase italic bo">fanzone</p>
				<h1 class="bo">Q & A</h1>
				<p class="uppercase bo">korea expressway women's volleyball club</p>
			</div>
		</section>
		
		<section id="contentView">
			<div class="contentView_wrapper">
				<div class="table_wrapper">
					<form action="/updateBoard" name="update_form" method="post">
						<table border="1">
							<tr>
								<td>제목</td>
								<td><input type="text" name="title" value="${Board_DTO.title}"/></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" readonly name="writer" value="${Board_DTO.writer}"/></td>
							</tr>
							<c:if test="${logId eq 'admin'}">
								<tr>
									<td class="txt_left" colspan="2">
										<c:choose>
											<c:when test="${Board_DTO.notice == 0}">
												<label><input type="radio" name="notice" value="0" > 일반글</label> &nbsp;&nbsp;
												<label><input type="radio" name="notice" value="1" checked> 공지글</label> &nbsp;&nbsp;
											</c:when>
											<c:otherwise>
												<label><input type="radio" name="notice" value="0" checked> 일반글</label> &nbsp;&nbsp;
												<label><input type="radio" name="notice" value="1" > 공지글</label> &nbsp;&nbsp;
											</c:otherwise>
										</c:choose>	
									</td>
								</tr>
						    </c:if>
						    
						    <c:if test="${Board_DTO.id == logId}">
								<tr>
									<td colspan="2" class="secret_prt txt_left">
										<c:choose>
											<c:when test="${Board_DTO.secret == 0}">
												<input type="radio" name="secret" value="0" checked> 공개글 &nbsp;&nbsp;
												<input type="radio" name="secret" value="1"> 비밀글 &nbsp;&nbsp;
												<input type="text" id="secret_num" name="secret_num" value="">
											</c:when>
											<c:otherwise>
												<input type="radio" name="secret" value="0" > 공개글 &nbsp;&nbsp;
												<input type="radio" name="secret" value="1" checked> 비밀글 &nbsp;&nbsp;
												<input type="text" id="secret_num" name="secret_num" value="${Board_DTO.secret_num}">
											</c:otherwise>
										</c:choose>	
										
	    							</td>
								</tr>
							 </c:if>
							 
							<tr>
								<td>내용</td>
								<td>
									<textarea name="content" rows="25">${Board_DTO.content}</textarea>
								</td>
							</tr>
						</table>
						<input type="hidden" name="id" value="${Board_DTO.id}"/>
						<input type="hidden" name="idx" value="${Board_DTO.idx}"/>
						<input type="hidden" name="count" value="${Board_DTO.count}"/>
						<input type="hidden" name="insert_time" value="${Board_DTO.insert_time}"/>
						<div class="submit_wrap">
							<c:choose>
								<c:when test="${Board_DTO.id == logId}">
								 	<a href="/board/fanzone">이전</a>
								 	<a href="#" onclick="return updateCheck()" >수정</a>
									<a href="/deleteBoard?idx=${Board_DTO.idx}" onclick="return deleteCheck()" >삭제</a>
							    </c:when>
							    <c:otherwise>
							    	<a href="#" onclick="pageBack()">이전</a>
							    </c:otherwise>
							</c:choose>
						</div>
					</form>	
				</div>		
				
				<c:forEach var="reply" items="${reply}">
					<div class="reply_wrap">
						<form action="/updateReply" name="modify_form" method="post">
							<div>
								<div><input type="text" name="writer" readonly value="${reply.writer}"/></div>
								<div>제목 &nbsp;&nbsp;<input type="text" name="title" value="${reply.title}"/></div>
							</div>
							<div>
								<textarea name="content" rows="5">${reply.content}</textarea>
							</div>
							<div>
								<div>${reply.insert_time}</div>
								<div>
									<c:if test="${reply.id == logId}">
										<input type="submit" value="수정" onclick="return modifyReply()"/>
										<a href="/deleteReply?idx=${reply.idx}&b_idx=${reply.b_idx}" onclick="return deleteComment()">삭제</a>
									</c:if>
								</div>
							</div>
							<input type="hidden" name="idx" value="${reply.idx}"/>
							<input type="hidden" name="b_idx" value="${reply.b_idx}"/>
						</form>
					</div>
				</c:forEach>
				<br /><br />
				<hr />	
				<br /><br />
				<div class="reply_add">
					<form action="" name="add_form">
						<div>
							<div><input type="text" name="writer" readonly value="${name}"/></div>
							<div>제목 &nbsp;&nbsp;<input type="text" name="title" /></div>
						</div>
						<div>
							<textarea name="content" rows="5"></textarea>
						</div>
						<div>
							<div></div>
							<div><input type="text" value="등록" onclick="addReply()"/></div>
						</div>
						<input type="hidden" name="b_idx" value="${Board_DTO.idx}"/>
						<input type="hidden" name="id" value="${logId}"/>
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
			var secretCheck = '${Board_DTO.secret}';
			
			if(secretCheck == 0){
				secret_num.attr("type","hidden");
			} else{
				secret_num.attr("type","text");
			}
		
			
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