<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'p1.jsp' starting page</title>
  </head>

  <body onload="initAJAX()">
  	<SCRIPT LANGUAGE="JavaScript">
  	//var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  	function showInfo(){
		xmlHttp.open("GET", "info.jsp", true);
		xmlHttp.onreadystatechange=showState;
		xmlHttp.send();
	}
	function  showState(){
		if(xmlHttp.readyState==4){
			infoDiv.innerText = xmlHttp.responseText;
			//infoDiv.innerHTML = xmlHttp.responseXml;
		}
		else{
			infoDiv.innerText = "正在载入，请稍候......";
		}			
	}
	
	</SCRIPT>  	
    	欢迎来到鲜花订购系统. <HR>
    	<input type="button" value="显示公司信息" onClick="showInfo()"><BR>
    	<div id="infoDiv"></div>
    <script src="commons.js"></script>
  </body>
</html>
