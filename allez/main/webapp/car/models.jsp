<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- include --%>
<%@ include file="../dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- carousel css 추가 -->
<link rel="stylesheet" href="../resources/css/carousel_style.css">
<title>Models</title>
<style>
	#mNav a:hover{
		font-weight:bold;
	}
	body{
		overflow-x:hidden;
	}
</style>
<% 
request.setCharacterEncoding("utf-8");
String model = request.getParameter("model"); 
%>
</head>
<body>
	<div class="container-fluid p-0">
		<jsp:include page="../menu.jsp" />
		<jsp:include page="../carousel.jsp" />
		<!-- 모델 종류 네비 -->
		<div class="pt-3">
			<div class="" id="mNav">
				<a class="ml-2 btn btn-outline-danger blink" href='<c:url value="/car/processModels.jsp?models=ev"/>' role="button">수소/전기차</a>
				<a class="btn btn-outline-warning blink" href='<c:url value="/car/processModels.jsp?models=sedan"/>' role="button">승용차</a>
				<a class="btn btn-outline-success blink" href='<c:url value="/car/processModels.jsp?models=suv"/>' role="button"> SUV</a>
				<a class="btn btn-outline-primary blink" href='<c:url value="/car/processModels.jsp?models=truck"/>' role="button">트럭</a>
			</div>
		</div>
		<div class="row pb-5 mb-5">
			<%-- car 테이블에서 데이터 가져오기 --%>
			<%
			String sql = "select * from car where carModel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, model);

			rs = pstmt.executeQuery();

			while (rs.next()) {
			%>
			<div class="col-md-4 col-6">
				<div class="thumbnail">
					<img src='../resources/images/<%=model %>/<%=rs.getString("car_image")%>'
						alt="" class="img-fluid">
					<div class="caption text-center">
						<h3><%=rs.getString("carname")%></h3>
						<p><%=NumberFormat.getInstance().format(Integer.parseInt(rs.getString("price")))%> 원 ~ </p>
						<p>
							<% if(rs.getString("carname").equals("니로 EV")){%>
							<a href='./processCars.jsp?carname=<%=rs.getString("carname")%>' class="btn btn-default blink"  role="button">자세히 보기 > </a>
							<a href='../buildCar/BuildCar.jsp?carname=<%=rs.getString("carname")%>' class="btn btn-default blink" role="button">견적 내기 > </a>

							<% } else if(rs.getString("carname").equals("Avante")){%>
							<a href='./processCars.jsp?carname=<%=rs.getString("carname")%>' class="btn btn-default blink"  role="button">자세히 보기 > </a>
							<a href='../buildCar/BuildCar.jsp?carname=<%=rs.getString("carname")%>' class="btn btn-default blink"  role="button">견적 내기 > </a>
							
							<% } else {%>
							<a href='#' class="btn btn-default" role="button">자세히 보기 > </a>
							<a href='#' class="btn btn-default" role="button">견적 내기 > </a>
							<% } %>
						</p>
					</div>
				</div>
			</div>

			<%
			}
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			if (rs != null)
			rs.close();
			%>
		</div> <%-- row --%>
		
		<jsp:include page="../footer.jsp" />
		
	</div>
	<!-- bootstrap js cdn -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>