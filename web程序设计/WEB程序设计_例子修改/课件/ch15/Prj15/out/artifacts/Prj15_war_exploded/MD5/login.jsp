<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.MD5"%>
欢迎登录鲜花订购系统
<form action="" method="post">
	请您输入账号：
	<input name="account" type="text">
	<BR>
	请您输入密码：
	<input name="password" type="password">
	<input type="submit" value="登录">
</form>
<%
    request.setCharacterEncoding("gb2312");
	String account = request.getParameter("account");
	if(account!=null){	
		String password = request.getParameter("password");
		//加密
		String newPassword = MD5.generateCode(password);
		String sql = "SELECT * FROM T_CUSTOMER WHERE ACCOUNT='" + 
		             account + "' AND PASSWORD='"+ 
		             newPassword + "'";
		out.println("数据库语句为：<BR>" + sql);
	}
%>