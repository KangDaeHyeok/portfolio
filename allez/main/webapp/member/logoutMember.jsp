<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logoutMember</title>
</head>
<body>
	<%
		session.invalidate(); 
		response.sendRedirect("./LoginMember.jsp");
	%>
</body>
<script>
	$(function(){
		alert("로그아웃 되었습니다.");
	})
</script>
</html>