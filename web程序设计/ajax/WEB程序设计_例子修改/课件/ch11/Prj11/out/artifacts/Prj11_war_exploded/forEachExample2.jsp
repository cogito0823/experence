<%@ page language="java" contentType="text/html; charset=gb2312"
	import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<body>
		<%
			HashMap hm = new HashMap();
			hm.put("name", "rose");
			hm.put("age", "10");
			session.setAttribute("hm", hm);
		%>
		<c:forEach items="${hm}" var="student">
		   ${student.key},${student.value}<br>
		</c:forEach>
	</body>
</html>
