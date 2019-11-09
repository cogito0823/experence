<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="vo.Customer"%>
<html> 
  <body>
  	<%
  		Customer customer = (Customer)session.getAttribute("customer");
  	%>
    欢迎<%=customer.getCname() %>聊天<BR>
    <form action="chatAction.jsp" name="form1" method="post">
    	输入聊天信息：<input name="msg" type="text" size="40">
    	<input type="submit" value="发送" >
    </form>  
    <a href="logoutAction.jsp">退出登录</a>
    <HR>
    <iframe src="msgs.jsp" width="100%" height="80%" frameborder="0"></iframe>   
  </body>
</html>
