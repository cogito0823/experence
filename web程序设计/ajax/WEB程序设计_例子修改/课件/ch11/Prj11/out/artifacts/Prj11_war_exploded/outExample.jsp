<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<body>
		<%
			session.setAttribute("msg", "ÕâÊÇ<c:out>Ê¾Àý");
		%>
		<c:out value="${msg}"></c:out>
	</body>
</html>
