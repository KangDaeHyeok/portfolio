<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.HugiDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
crossorigin="anonymous">
</head>
<body>
<%
	HugiDTO dto = (HugiDTO)request.getAttribute("dto");
%>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron text-center">
	  <h1 class="display-4">시승후기</h1>
	  <hr class="mt-5">
	</div>
	
	<div class="container pb-5 mb-5 blink">
		<form action="update.hg" method="post" name="viewForm">
			<table class="table">
				<%
					String id = (String)session.getAttribute("sessionId");
				%>
				<input type="hidden" name="id_hidden" value="<%=id %>"/> <!-- 세션으로 받아온 아이디 저장 -->
				<input type="hidden" name="num" value="<%=dto.getNum()%>"/><!-- 게시글 순서 저장 -->
				<tr>
					<td ml="3">제목</td>
					<td>
						<input class="form-control" type="text" name="title" id="title" value="<%=dto.getTitle()%>">
						<input type="hidden" name="h_title" id="h_title" value="<%=dto.getTitle()%>">
					</td>
					
				</tr>
				<tr>
					<td ml="3">모델이름</td>
					<td>
						<select name="carname" id="carname">
							<option value="<%=dto.getCarname()%>"><%=dto.getCarname()%></option><!-- db에서 받아온 값을 입력하기 위해 필요 -->
						</select>
					</td>
				</tr>
				<tr>
					<td ml="3">내용</td>
					<td>
						<textarea rows="12" name="content" id="content" class="form-control"><%=dto.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td ml="3">별점</td>
					<td>
						<select name="star" id="star">
							<option class="black" value="0">선택해주세요.</option>
							<option value="1" <%=dto.getStar() == 1 ? " selected":"" %>>★</option>
							<option value="2" <%=dto.getStar() == 2 ? " selected":"" %>>★★</option>
							<option value="3" <%=dto.getStar() == 3 ? " selected":"" %>>★★★</option>
							<option value="4" <%=dto.getStar() == 4 ? " selected":"" %>>★★★★</option>
							<option value="5" <%=dto.getStar() == 5 ? " selected":"" %>>★★★★★</option>
						</select>
					</td>
				</tr>
			</table>	
			<div class="float-right">
				<%
					if(id.equals(dto.getId())){
				%>
               		<button type="button" class="btn btn-success" onclick="updateMember()">수정</button>

					<input type="hidden" value="<%=dto.getNum() %>" id="delV" />
               		<button type="button" class="btn btn-danger" onclick="deleteMember()">삭제</button>
				<%
					}
				%>
				<a href="Hugi_List.hg" class="btn btn-primary">목록</a>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			$("#carname").attr("disabled", "disabled");
		})
		
		function updateMember() {
			var confirmflag = confirm("해당 게시글을 수정하시겠습니까?");
			if (confirmflag) {
				document.viewForm.submit();
			} else {
				return false;
			}
		}
		
		function deleteMember() {
			var confirmflag = confirm("해당 게시글을 삭제하시겠습니까?");
			var del = $("#delV").val();
			if (confirmflag) {
				location.href = 'delete.hg?num=' + del;

			} else {
				return false;
			}
		}
	</script>
</body>
</html>