<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <body>
  	<SCRIPT LANGUAGE="JavaScript">
  		function getinfo(){
  			var account = document.modifyForm.account.value;  			
	  		var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  		var url = "/servlet/AutoQueryServlet?account="+account;
			xmlHttp.open("GET", url, true);			
			xmlHttp.onreadystatechange=function() {
				if (xmlHttp.readyState==4) {
					var xmlDom = xmlHttp.responseXml;
					modifyForm.cname.value =
 xmlDom.getElementsByTagName("cname")[0].text;
				}
			}
			xmlHttp.send();	
  		}
	</SCRIPT>
	修改用户信息<BR>
    <form name="modifyForm">
    	请您输入账号:<input type="text" name="account" onblur="getinfo()"><BR>
    	请您输入密码:<input type="password" name="password"><BR>
    	输入确认密码:<input type="password" name="cpassword"><BR>
    	请您输入姓名:<input type="text" name="cname"><BR>
    	<input type="button" value="修改">
    </form>
  </body>
</html>
