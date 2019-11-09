<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
<%
	//获取鲜花
	String flower = request.getParameter("flower");
	String sql = "SELECT * FROM T_FLOWER WHERE FLOWERNAE LIKE '%" 
		        + flower 
		        + "%'";
		out.println("数据库执行语句：<BR>" + sql);
%>
</body>
</html>
