<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%@page import="dao.ScoreDao"%>
<html>
  <body>
  <%  	
  	request.setCharacterEncoding("gb2312");
  	String courseno = request.getParameter("courseno");
  	String[] type = request.getParameterValues("type");
  	String[] stuno = request.getParameterValues("stuno");
  	String[] score = request.getParameterValues("score");
 	ScoreDao sdao = new ScoreDao();
	sdao.updateScores(courseno,type,stuno,score);
	%>
     <jsp:forward page="scoreForm.jsp"></jsp:forward>
  </body>
</html>
