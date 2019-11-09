<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.MD5"%>
欢迎注册鲜花订购系统
<form action="" method="post">
	请您输入账号：	<input name="account" type="text"><BR>
	请您输入密码：<input name="password" type="password"><BR>
	请您输入姓名：<input name="cname" type="text"><BR>
	输入身份证号：<input name="idno" type="text"><BR>
	<input type="submit" value="注册">
</form>
<%
    request.setCharacterEncoding("gb2312");
	String account = request.getParameter("account");
	if(account!=null){	
		String password = request.getParameter("password");
		String cname = request.getParameter("cname");
		String idno = request.getParameter("idno");
		//加密
		String newPassword = MD5.generateCode(password);
		String sql = "INSERT INTO T_CUSTOMER VALUES('" + 
		             account + "','" + 
		             newPassword + "','" + 
		             cname + "','" + idno + "')";
		out.println("数据库语句为：<BR>" + sql);
	}
%>