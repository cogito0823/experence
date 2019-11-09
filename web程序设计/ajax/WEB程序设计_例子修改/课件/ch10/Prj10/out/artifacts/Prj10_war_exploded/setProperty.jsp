<%@ page language="java" import="beans.Student"
	contentType="text/html; charset=gb2312"%>
<jsp:useBean id="student" class="beans.Student" scope="page"></jsp:useBean>
<jsp:setProperty property="stuname" name="student" param="studentName" />
<%= student.getStuname ()%>
