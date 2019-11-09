<%@ page language="java" contentType="text/html; charset=gb2312"%>
<jsp:useBean id="student" class="beans.Student" scope="request">
	<jsp:setProperty property="stuname" name="student" value="rose" />
</jsp:useBean>
<html>
	<body>
		<jsp:forward page="request2.jsp"></jsp:forward>
	</body>
</html>
