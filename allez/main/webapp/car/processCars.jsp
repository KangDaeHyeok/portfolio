<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processModel</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String carname = request.getParameter("carname");
		
		if(carname.equals("니로 EV")){
			response.sendRedirect("../cars/niro_EV.jsp");
			
		} else if(carname.equals("Avante")){
			response.sendRedirect("../cars/avante.jsp");
		}
		
		
	%>
</body>
</html>