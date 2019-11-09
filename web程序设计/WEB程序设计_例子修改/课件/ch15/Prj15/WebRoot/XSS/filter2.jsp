<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
欢迎查询鲜花
<form name="queryForm" action="filter2.jsp" method="post">
	请您输入鲜花的信息：<BR>
	<input name="flower" type="text" size="50">
	<input type="submit" value="查询">	
</form>
<HR>
提交的鲜花：
<%
	String flower = request.getParameter("flower");
	if(flower!=null){
	    flower = flower.replaceAll("<|>","");
		out.println(flower);
	}
 %>
 </body>
</html>


