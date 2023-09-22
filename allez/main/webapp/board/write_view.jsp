<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의하기 작성</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
crossorigin="anonymous">
<!-- bootstrap icon -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
	.jumbotron{
    	background-color : #fff;
    }
</style>
<% 
	String sessionId = (String)session.getAttribute("sessionId");
%>
</head>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	  <h1 class="display-4">문의하기</h1>
	  <hr class="mt-5">
	  <p class=""><small>문의를 남겨주시면 답변해드리겠습니다.</small></p>
	</div>
	
	<div class="container pb-5 mb-5 blink">
		<form action="write.bo" method="post" name="writeForm">
			<table class="table">
				<input type="hidden" name="id" value="<%=sessionId %>" />
				<tr>
					<td ml="3">제목</td>
					<td><input class="form-control" type="text" name="subject" id="subject"></td>
				</tr>
				<tr>
					<td ml="3">내용</td>
					<td>
						<textarea rows="12" name="content" class="form-control" id="content"></textarea>
					</td>
				</tr>
			</table>	
			<div class="float-right">
				<button type="button" onclick="checkWrite()" class="btn btn-success">입력</button>&nbsp;&nbsp;
				<a href="list.bo" class="btn btn-primary">목록보기</a>
			</div>
		</form>
	</div>
		
	<jsp:include page="../footer.jsp" />
	<!-- bootstrap js cdn -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
	<script>
		function checkWrite(){
			if($("#subject").val() == "" || $("#subject").val() == null){
				alert("제목을 입력해주세요.");
				return false;
			}
			if($("#content").val() == "" || $("#content").val() == null){
				alert("내용을 입력해주세요.");
				return false;
			}
			
			document.writeForm.submit();
		}
	</script>
</body>
</html>