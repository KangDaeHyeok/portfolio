<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.jumbotron{
    	background-color : #fff;
    }
    .text_black a{
    	color:#323232;
    }
</style>

</head>
<body>
	<jsp:include page="../menu.jsp" />
		<div class="jumbotron text-center">
	    <h1 class="display-4">로그인</h1>
	    <hr class="mt-5">
	    <p class=""><small>회원가입 또는 로그인해주세요.</small></p>
	</div>
		
	<div class="container mb-5 pb-5 blink">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<%
					String id = request.getParameter("id");
					//밑의 input태그에서 얻어온 name값을 String id에 저장(session에서 사용)
					
					String LoginResult = (String)request.getAttribute("result");
					//DAO클래스의 DB에서 조회하여 호출된 'y'값이 result에 저장되어 가져옴
					
					if(LoginResult != null && LoginResult.equals("y")){
						session.setAttribute("sessionId", id);
						
						//로그인한 정보를 세션에 저장
						response.sendRedirect("./LoginResult.jsp?value=2");
					}
					else if(LoginResult != null && LoginResult.equals("n")){
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요.");
						out.println("</div>");
					}
				%>
				<!-- 17-11)action, name을 수정하고 processloginMember.jsp로 이동 -->
				<div class="row">
					<div class="col-12">
						<form action="LoginMemberAction.do" method="post">
							<div class="input-group input-group-lg my-2">
								<input required placeholder="ID" type="text" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-lg" name="id" autofocus>
							</div>
							<div class="input-group input-group-lg my-2">
								<input required placeholder="PASSWORD" type="password" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-lg" name="password">
							</div>
							<button class="btn btn-dark btn-block btn-lg" type="submit">로그인</button>
						</form>
					</div>
				</div><!-- row -->
				
				<div class="row mt-4">
					<div class="col-12 text-center text_black">
						<a href="IdFind.jsp"><strong>아이디 찾기</strong></a>
						&nbsp;<span> | </span>&nbsp;
						<a href="PwFind.jsp"><strong>비밀번호 찾기</strong></a>
						&nbsp;<span> | </span>&nbsp;
						<a href="Addmember.jsp"><strong>회원가입</strong></a>
					</div>
				</div>
				
			</div><!-- col-md-6 -->
		</div><!-- row -->
	</div><!-- container -->
	
	<jsp:include page="../footer.jsp" />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
crossorigin="anonymous"></script>
</body>
</html>








