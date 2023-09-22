<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginResult</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<%
		String value = request.getParameter("value");
	
		if(value != null){
			if(value.equals("0")){
				response.sendRedirect("../index.jsp");
			}
			else if(value.equals("1")){
				response.sendRedirect("../index.jsp");
			}
			else if(value.equals("2")) {
				String loginId = (String)session.getAttribute("sessionId");
				response.sendRedirect("../index.jsp");
			}
		}
	%>
</body>
</html>