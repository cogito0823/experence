<%@ page language="java" contentType="text/html;charset=gb2312" import="beans.Student"%>
<html>
	<body>
		<%
		Student student = new Student();
		student.setStuno("0001");
		student.setStuname("张三");
		session.setAttribute("student", student);
		%>
		学号：${sessionScope.student.stuno }<br>
		姓名：${sessionScope.student.stuname }<br>
	</body>
</html>
