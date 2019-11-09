<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body onload="initAJAX()">
  	<SCRIPT LANGUAGE="JavaScript">
  		function login(){
  			var account = document.loginForm.account.value;
  			var password = document.loginForm.password.value;  			
	  		// var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  		var url = "servlet/LoginServlet?account="+account+"&password="+password;
			xmlHttp.open("POST", url, true);				
			xmlHttp.onreadystatechange=function() {
				if (xmlHttp.readyState==4) {
					resultDiv.innerHTML = xmlHttp.responseText;
				}
				else{
					resultDiv.innerHTML += "正在登录，请稍候......";
				}				
			}
			xmlHttp.send();	
  		}
	</SCRIPT>  	
    欢迎登录学生管理系统. <hr>
    <div>
    <form name="loginForm">
    	请您输入账号:<input type="text" name="account"><BR>
    	请您输入密码:<input type="password" name="password"><BR>
    	<input type="button" value="登录" onclick="login()">
    </form>
    </div>
    <div id = "resultDiv"></div>
  <script src="commons.js"></script>
  </body>
</html>
