<%@ page contentType="text/html; charset=gb2312"%>
<html>
	<body>
		<%
			//在application内放进内容
			application.setAttribute("applicationMsg", "Welcome Application!");
			//在session内放进内容
			session.setAttribute("sessionMsg", "Welcome Session!");
		%>
		application内的内容${applicationScope.applicationMsg }<br>
		application内的内容${applicationMsg }<br>
		session内的内容${sessionScope.sessionMsg }<br>
		session内的内容${sessionMsg }<br>
	</body>
</html>
