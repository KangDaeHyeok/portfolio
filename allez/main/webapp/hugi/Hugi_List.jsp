<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.model.HugiDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 후기</title>
<style>
.jumbotron {
	background-color: #fff !important;
}
.table_wrapper{
	width: 100%;
	overflow:auto;
}
table{
	white-space:nowrap;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%
	String sessionId = (String)session.getAttribute("sessionId");

	ArrayList<HugiDTO> list = (ArrayList<HugiDTO>)request.getAttribute("list");
	int value = (int)request.getAttribute("value"); //페이지 갯수
	int pageNum = (int)request.getAttribute("pageNum"); //현재 페이지
%>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
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

	<div class="container mb-5 pb-5 blink">
		<div class="float-right mb-3">
			<a class="btn btn-primary" href='<c:url value="/hugi/Hugi_WriteForm.jsp?pageNum=1"/>' onclick="checkForm(); return false;">글작성</a>
		</div>
		<form action="Hugi_List.hg" method="post">
			<div class="table_wrapper">
				<table class="table table-responsive-lg">
					<thead>
						<tr>
							<th scope="col"  class="text-center col-md-1">순서</th>
							<th scope="col"  class="text-center col-md-1">제목</th>
							<th scope="col"  class="text-center col-md-2">모델 이미지</th>
							<th scope="col"  class="text-center col-md-1 ">모델 종류</th>
							<th scope="col"  class="text-center col-md-1">모델 이름</th>
							<th scope="col"  class="text-center col-md-1">작성자</th>
							<th scope="col"  class="text-center col-md-1">조회수</th>
							<th scope="col"  class="text-center col-md-1">별점</th>
							<th scope="col"  class="text-center col-md-2">등록날짜</th>
						</tr>
					</thead>
					<%
						HugiDTO dto = new HugiDTO();
						
						
						for(int i=0; i<list.size(); i++){
							dto = list.get(i);
					%>
					<tbody>
						<tr>
							<td class="text-center align-middle"><%=dto.getNum() %></td>
							<td class="text-center align-middle" >
								<a href="./getWriteInfo.hg?num=<%=dto.getNum() %>" class="title"><%=dto.getTitle() %></a>
							</td>
							
							
							<td><img src='resources/images/<%=dto.getCarModel() %>/<%=dto.getCar_image() %>'  class="img-fluid mb-auto"></td>
							<td class="text-center align-middle" ><%=dto.getCarModel() %></td>
							<td class="text-center align-middle" ><%=dto.getCarname() %></td>
							<td class="text-center align-middle" ><%=dto.getName() %></td>
							<td class="text-center align-middle" ><%=dto.getCount() %></td>
							<td class="text-center text-warning align-middle" >
								<!-- 별점 나타내는 조건문 -->
								<% if(dto.getStar() == 1){ %>
										★
								<% }else if(dto.getStar() == 2){ %>
										★★
								<% }else if(dto.getStar() == 3){ %>
										★★★
								<% }else if(dto.getStar() == 4){ %>
										★★★★
								<% }else if(dto.getStar() == 5){ %>
										★★★★★
								<% } %>
							</td>
							<td class="text-center align-middle" ><%=dto.getU_day() %></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
			
			<div align="center">
				<%
					for(int i=0; i<value; i++){
				%>
					<a href='javascript:link(<%=i+1 %>)'>
						<%
							if(i+1 == pageNum){
						%>
							<b>[<%=i+1 %>]</b>
						<%
							}
							else {
						%>
							<span>[<%=i+1 %>]</span>
						<%  }  %>
					</a>
				<%
					}
				%>
			</div>
			
			<div class="row">
				<div class="col-sm-3 mt-2">
					<select class="custom-select" name="search_item" id="search_item">
						<option value="car.carname">모델 이름</option>
						<option value="carModel">모델 종류</option>
						<option value="name">작성자</option>
					</select>
				</div>
				<div class="input-group col-sm-9 mt-2">
					<input type="text" name="search_text" id="search_text" class="form-control">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">검색</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>

	<script>
	
		/* 글작성 */
		function checkForm(){
			if(<%=sessionId%> == null){
				alert("로그인해주세요.");
				location.href="./member/LoginMember.jsp";
				return false;
			}
			location.href="/write.hg?id=<%=sessionId%>";
		}
		
		/* 상세페이지 */
		$(document).ready(function(){
			$(".title").click(function(){
				//title을 id로 지정할 경우에는 id는 고유값이기 때문에 하나에만 적용된다
				//그래서 class로 바꿔줘야한다.
				if(<%=sessionId%> == null){
					alert("로그인해주세요.");
					location.href="./member/LoginMember.jsp";
					return false;
				}
				location.href="/write.hg?id=<%=sessionId%>";
			})
		})
		
		
		/* 페이징 */
		function link(value){
			var item = $("#search_item").val();
			var text = $("#search_text").val();
			
			location.href="Hugi_List.hg?pageNum="+value+"&search_item="+item+"&search_text="+text;
		}
	</script>
</body>
</html>