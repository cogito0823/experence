<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <body>
  	<SCRIPT LANGUAGE="JavaScript">
  		function check(){
  			var account = document.regForm.account.value;  			
	  		var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  		var url = "/servlet/CheckServlet?account="+account;
			xmlHttp.open("GET", url, true);				
			xmlHttp.onreadystatechange=function() {
				if (xmlHttp.readyState==4) {
					checkDiv.innerHTML = xmlHttp.responseText;
				}
				else{
					checkDiv.innerHTML = "正在检测...";
				}
			}
			xmlHttp.send();	
  		}
	</SCRIPT>
	欢迎注册教务管理系统.<BR>
    <form name="regForm">
    	请您输入账号:<input type="text" name="account" onblur="check()">
    	<span id="checkDiv"></span><BR>
    	请您输入密码:<input type="password" name="password"><BR>
    	输入确认密码:<input type="password" name="cpassword"><BR>
    	请您输入姓名:<input type="text" name="cname"><BR>
    	<input type="button" value="注册">
    </form>
  </body>
</html>
