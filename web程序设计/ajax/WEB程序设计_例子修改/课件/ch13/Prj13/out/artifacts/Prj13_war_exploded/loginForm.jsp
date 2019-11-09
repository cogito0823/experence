<%@ page language="java" pageEncoding="gb2312"%>
<html>
	<body>
	欢迎登录本系统<BR>
	<form action="/Prj13/servlet/ValidateServlet" method="post">
		请您输入账号:<input type="text" name="account" /><BR>
		请您输入密码: <input type="password" name="password" /><BR>
		验证码:<input type="text" name="code" size="10">
		<!-- 将验证码当成图片处理 -->
		<img border=0 src="validate.jsp">
		<input type="submit" value="登录">	
	</form>		
	</body>
</html>
