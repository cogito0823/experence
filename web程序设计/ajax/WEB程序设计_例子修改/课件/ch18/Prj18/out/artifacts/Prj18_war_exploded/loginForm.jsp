<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html> 
  <body>
  	<%
  		/*初始化application*/
    	ArrayList customers = (ArrayList)application.getAttribute("customers");    	    	if(customers==null)	{
    		customers = new ArrayList();
    		application.setAttribute("customers",customers);
    	}
    	
    	ArrayList msgs = (ArrayList)application.getAttribute("msgs");
    	if(msgs==null)	{
    			msgs = new ArrayList();
    			application.setAttribute("msgs",msgs);
    	}
  	%>
  	★★欢迎登录在线交流系统★★
    <form action="loginAction.jsp" name="form1" method="post">
    	输入账号：<input name="account" type="text"><BR>
    	输入密码：<input name="password" type="password">   	
    	<input type="submit" value="登录" >
    </form>   
  </body>
</html>
