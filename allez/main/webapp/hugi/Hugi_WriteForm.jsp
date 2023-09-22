<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 후기 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
crossorigin="anonymous">

<style>
.jumbotron {
	background-color: #fff !important;
}
</style>

</head>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
		<h1 class="display-4">시승 후기</h1>
		<hr class="mt-5">
		<p class="">
			<small>시승 후기를 작성하세요.</small>
		</p>
	</div>
	
	<div class="container pb-5 mb-5 blink">
		<form action="../write.hg" method="post" name="writeForm">
			<table class="table">
				<%
					String id = (String)session.getAttribute("sessionId");
				%>
				<input type="hidden" name="id_hidden" value="<%=id %>"/> <!-- 세션으로 받아온 아이디 저장 -->
				<tr>
					<td ml="3">제목</td>
					<td><input class="form-control" type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td ml="3">모델 이름</td>
					<td>
						<select name="carname" id="carname">
							<option value="">선택해주세요.</option><!-- db에서 받아온 값을 입력하기 위해 필요 -->
						</select>
					</td>
				</tr>
				<tr>
					<td ml="3">내용</td>
					<td>
						<textarea rows="12" name="content" id="content" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td ml="3">별점</td>
					<td>
						<select name="star" id="star">
							<option class="black" value="0">선택해주세요.</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</td>
				</tr>
			</table>	
			<div class="float-right">
				<!-- <input type="button" class="btn btn-success" value="작성" onclick="write()"/> -->
				<a href="javascript:write()"><input type="button" class="btn btn-success" value="작성"/></a>
				<a href="../Hugi_List.hg" class="btn btn-primary">목록보기</a>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
	
	<script>
		
		/* select box의 값을 얻어오기 위한 기능 */
		$(document).ready(function() {
			$.ajax({
				type : "POST",
				url : "../selectbox.hg",
				data : {},
				dataType : "JSON",
				success : function(response) {/* 정상적으로 응답 받았을 경우에 실행 */
					/* console.log(response); */ //console창에 응답받은 값을 확인
					for(var i=0; i<response.length; i++){
						$("#carname").append('<option value="'+response[i].carname+'">'+response[i].carname+'</option>');
					}
				}
			})
		});
		
		
		/* 유효성 검사 */
		function write(){
			
			if($("#title").val() == ""){
				alert("제목을 입력해주세요.");
				return false;
			}
			if($("#carname").val() == ""){
				alert("모델 이름을 선택해주세요.");
				return false;
			}
			if($("#content").val() == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
			if($("#star").val() == "0"){
				alert("별점을 선택해주세요");
				return false;
			}
			document.writeForm.submit();
		}
	</script>
</body>
</html>