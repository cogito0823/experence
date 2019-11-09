<%@ page language="java" contentType="text/html; charset=gb2312"%>
<jsp:useBean id="student" class="beans.Student" scope="request">
</jsp:useBean>
<html>
	<body>
		бЇЩњаеУћЃК<jsp:getProperty name="student" property="stuname" />
	</body>
</html>
