<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- include --%>
<%@ include file="../dbConn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- bootstrap css --%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- carousel css 추가 -->
<link rel="stylesheet" href="../resources/css/carousel_style.css">	
<title>관리자 모드 : SUV</title>
</head>
<body>
<%
	String edit = request.getParameter("edit");
%>
	<div class="container-fluid p-0">
		<jsp:include page="../menu.jsp" />
		<jsp:include page="../carousel.jsp" />

			<!-- 모델 종류 네비 -->
			<div class="pt-3">
				<div class="" id="mNav">
					<a class="ml-2 btn blink" href='../admin/Admin_ev_models.jsp?edit=<%=edit %>' role="button">수소/전기차</a>
					<a class="btn blink" href='../admin/Admin_sedan_models.jsp?edit=<%=edit %>' role="button">승용차</a>
					<a class="btn blink" href='../admin/Admin_suv_models.jsp?edit=<%=edit %>' role="button">SUV</a>
					<a class="btn blink" href='../admin/Admin_truck_models.jsp?edit=<%=edit %>' role="button">트럭</a>
				</div>
			</div>
			<div class="row pb-5 mb-5">
				<%-- product 테이블에서 데이터 가져오기 --%>
				<%
					String sql = "select * from car where carModel = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "suv");
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){	%>
				<div class="col-md-4 col-6">
					<div class="thumbnail">
						<img src='../resources/images/suv/<%=rs.getString("car_image") %>' alt="" class="img-fluid">
						<div class="caption text-center">
							<h3><%=rs.getString("carname") %></h3>
							<p><%=NumberFormat.getInstance().format(Integer.parseInt(rs.getString("price")))%> 원 ~ </p>
							<p>
								<%
									if(edit.equals("update")){
								%>
								<a class="btn btn-warning blink" href='getInfo.ad?carname=<%=rs.getString("carname")%>'>모델 수정</a>
								<%
									}
									else if(edit.equals("delete")){
								%>
								<input type="hidden" value="<%=rs.getString("carname") %>" id="nameV" />
								<button type="button" class="btn btn-danger blink" onclick="deleteMember()">모델 삭제</button>
								<%
									}
								%>
							</p>
						</div>
					</div>
				</div>
				
				<%	}	
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					if(rs != null) rs.close();	%>
			</div> <%-- row --%>
		</div> <%-- container --%>
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
		
		<script>
		
		function deleteMember() {
			var confirmflag = confirm("해당 모델을 삭제하시겠습니까");
			var num = $("#nameV").val();
			if (confirmflag) {
				location.href = 'DeleteCar.ad?carname=' + num;

			} else {
				return false;
			}
		}
		</script>
</body>
</html>