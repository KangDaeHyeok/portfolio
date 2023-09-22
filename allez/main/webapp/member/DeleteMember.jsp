<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- 17-17)processLoginMember에서 세션아이디에 저장해놓았던 사용자의 id를 얻어와서 해당 사용자의 행 데이터를 삭제함=>끝! -->
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam" password="m1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM allez_member WHERE id = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>
<%-- <c:out value="${resultSet}"/> --%>
<c:if test="${resultSet>=1}">
	<c:import var="url" url="logoutMember.jsp" />
	<c:redirect url="../index.jsp" />
</c:if>