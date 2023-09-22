<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "c##test";
		String password = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 등록
		System.out.println("드라이버 등록 성공");
		
		conn = DriverManager.getConnection(url, username, password); // 로그인 접속
		System.out.println("접속 성공");
		
	} catch(Exception e){
		System.out.println("드라이버 등록 실패");
		System.out.println("Exception : "+e.getMessage());
	}
%>
