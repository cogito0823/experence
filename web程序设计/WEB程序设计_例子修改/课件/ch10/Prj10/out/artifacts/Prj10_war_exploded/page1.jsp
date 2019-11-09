<%@ page language="java" contentType="text/html; charset=gb2312"%>
<jsp:useBean id="student" class="beans.Student" scope="page">
	<jsp:setProperty property="stuname" name="student" value="rose" />
</jsp:useBean>
<html>
	<body>
		бЇЩњаеУћЃК<jsp:getProperty name="student" property="stuname" />
	</body>
</html>
