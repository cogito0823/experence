<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body onload="initAJAX()">
  	<SCRIPT LANGUAGE="JavaScript">
  	//var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  	function showInfo(){
		xmlHttp.open("GET", "info.jsp", true);
		xmlHttp.onreadystatechange=showState;
		xmlHttp.send();
	}
	function showState(){
		document.writeln(xmlHttp.readyState);
	}
	</SCRIPT>  	
    	欢迎来到本系统. <HR>
    	<input type="button" value="显示公司信息" onClick="showInfo()">

	<script src="commons.js"></script>
  </body>
</html>
