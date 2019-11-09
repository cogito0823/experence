<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<body>
		<%
		session.setAttribute("msg","这是一个#forTokens#示例");
		%>
		<c:forTokens items="${msg}" delims="#" var="msg">
		  ${msg }<br>
		</c:forTokens>
	</body>
</html>
