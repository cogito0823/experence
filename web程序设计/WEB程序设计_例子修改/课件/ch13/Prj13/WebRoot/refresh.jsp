<%@ page language="java" pageEncoding="gb2312"%>
<html>
	<body>
	<script type="text/javascript">
		function refresh(){
			loginForm.imgValidate.src = "validate.jsp?id=" + Math.random();
		}
	</script>
	欢迎登录本系统<BR>
	<form name="loginForm" action="/servlet/ValidateServlet" method="post">
		请您输入账号:<input type="text" name="account" /><BR>
		请您输入密码: <input type="password" name="password" /><BR>
		请输入验证码:<input type="text" name="code" size="10">
		<img name="imgValidate" src="validate.jsp" onclick="refresh()"><BR>
		<input type="submit" value="登录">	
	</form>		
	</body>
</html>
