<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
<%//session检查
	String account = (String)session.getAttribute("account");
	if(account==null){
		response.sendRedirect("login.jsp");
	}
%>
欢迎<%=account%>来到BBS！
<HR>
<a href="mailList.jsp">查看信息</a>
</body>
</html>