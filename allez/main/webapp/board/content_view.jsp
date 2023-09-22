<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Content View</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
crossorigin="anonymous">
<!-- bootstrap icon -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<style>
	.jumbotron{
    	background-color : #fff;
    }
</style>
<% String sessionId = (String)session.getAttribute("sessionId"); %>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	  <h1 class="display-4">문의하기</h1>
	  <hr class="mt-5">
	  <p class=""><small>문의를 남겨주시면 답변해드리겠습니다.</small></p>
	</div>
	
	<div class="container pb-5 mb-5 blink">
		<form action="modify.bo" method="post">
			<table class="table table-borderless">
				<%-- bIdx hidden --%>
				<input type="hidden" name="num" value="${content.num}" />
				
				<tr>
					<td ml="3">제목</td>
					<td><input class="form-control" type="text" name="subject" value="${content.subject}"></td>
				</tr>
				<tr>
					<td ml="3">이름</td>
					<td><input class="form-control" type="text" name="writer" value="${content.writer}" readonly></td>	
				</tr>
				<tr>
					<td ml="3">내용</td>
					<td>
						<textarea rows="12" name="content" class="form-control">${content.content}</textarea>
					</td>
				</tr>
			</table>	
			<div class="float-right">
				<c:if test="${sessionId == content.id}">
					<a class="btn btn-danger" href="delete.bo?num=${content.num}">삭제</a>&nbsp;&nbsp;
					<button type="submit" class="btn btn-warning">수정</button>&nbsp;&nbsp;
				</c:if>
				<a href="list.bo" class="btn btn-primary">목록보기</a>&nbsp;&nbsp;
				
				<c:if test="${sessionId eq 'admin'}">
					<a href="reply_view.bo?num=${content.num}" class="btn btn-success">답변</a>
				</c:if>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />

</body>
</html>