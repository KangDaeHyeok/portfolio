<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processModels</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String model = request.getParameter("models");
		
		System.out.println(model);
		response.sendRedirect("./models.jsp?model="+model);	
	%>
</body>
</html>