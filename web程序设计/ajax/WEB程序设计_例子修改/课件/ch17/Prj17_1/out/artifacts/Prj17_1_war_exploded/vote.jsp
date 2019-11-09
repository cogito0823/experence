<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%@page import="dao.VoteDao"%>
<html>
  <body> 
   <%
   		String[] teacherno = request.getParameterValues("teacherno");   		
		VoteDao vdao = new VoteDao();
		vdao.updateVotes(teacherno);
	%>
	<jsp:forward page="display.jsp"></jsp:forward>
  </body>
</html>
