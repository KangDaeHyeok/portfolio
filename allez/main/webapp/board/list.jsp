<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의하기</title>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
.jumbotron {
	background-color: #fff;
}

a {
	color: black;
}

.table_wrapper {
	width: 100%;
	overflow: auto;
}

.table {
	white-space: nowrap;
}


</style>

<%
String sessionId = (String) session.getAttribute("id");
%>

<script>
	function checkForm(){
		if(${sessionId == null}){
			alert("로그인해주세요.");
			location.href="./member/LoginMember.jsp";
			return false;
		}
		location.href="write_view.bo?id=<%=sessionId%>";
	}
</script>
</head>
<body>
	<!-- nav추가 -->
	<jsp:include page="../menu.jsp" />

	<div class="jumbotron text-center">
		<h1 class="display-4">문의하기</h1>
		<hr class="mt-5">
		<p class="">
			<small>문의를 남겨주시면 답변해드리겠습니다.</small>
		</p>
	</div>

	<div class="container mb-5 pb-5 blink">
		<div class="float-right mb-3">
			<a class="btn btn-primary" href="#"
				onclick="checkForm(); return false;">글작성</a>
		</div>

		<form action='<c:url value="./list.bo"/>' method="post">
			<div class="table_wrapper">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">제목</th>
							<th scope="col">이름</th>
							<th scope="col">날짜</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${boardList}">
							<tr>
								<td><c:if test="${list.reLevel<1}">
										<span>답변예정</span>
									</c:if> <c:forEach begin="1" end="${list.reLevel}">
										<span>ㄴ답변완료</span>
									</c:forEach></td>
								<td>
									<%-- 제목이 출력되는 위치 --%> <a href="content_view.bo?num=${list.num}">${list.subject}</a>
								</td>
								<td>${list.writer}</td>
								<td><fmt:formatDate value="${list.regist_day}"
										pattern="yyyy-MM-dd" /></td>
								<td>${list.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
				<div class="row">
					<div class="col-sm-3 mt-2">
						<select class="custom-select" name="items">
							<option value="subject">제목</option>
							<option value="content">본문</option>
							<option value="name">이름</option>
						</select>
					</div>
					<div class="input-group col-sm-9 mt-2">
						<input type="text" name="text" class="form-control">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit">검색</button>
						</div>
					</div>
				</div>
			
		</form>


	</div>
	<jsp:include page="../footer.jsp" />


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>