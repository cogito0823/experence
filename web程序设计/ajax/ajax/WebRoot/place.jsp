<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>AJAX-省市</title>
		<script type="text/javascript">
		
  function fillCities(pid){ 
	var xmlObj = null; 
     if(window.XMLHttpRequest){ 
        xmlObj = new XMLHttpRequest(); 
     } else if(window.ActiveXObject){ 
         xmlObj = new ActiveXObject("Microsoft.XMLHTTP"); 
     } else { 
      return; 
    } 
	xmlObj.onreadystatechange = function(){ 
       if(xmlObj.readyState == 4){ 
         loadData(xmlObj.responseText); 
		}
     }
    xmlObj.open ('GET', "listCity?provinceId="+pid, true); 
    xmlObj.send ('');    
  }
  
  function loadData(data){
 	var d = eval("("+data+")");
 	var oc = document.getElementById("cityId");
 	oc.innerHTML="";
    var frag = document.createDocumentFragment(); // 创建文档片段
	for(var i=0; i<d.length; i++){
		var oop = document.createElement("option");
		oop.value = d[i].cityId;
		oop.innerHTML = d[i].cityName;
		frag.appendChild(oop);
	}
	oc.appendChild(frag);  
  }
  
  window.onload = function(){
  var op = document.getElementById("provinceId");
  op.onchange = function(){
	  fillCities(op.options[op.selectedIndex].value);
  };
 }  
</script>

	</head>

	<body>
		<h1>
			AJAX-省市
		</h1>
		<form action="#" method="post" id="regForm">



			<label for="province">
				所在城市
			</label>
			<select name="province" id="provinceId">
				<option value="0">
					==请选择省份==
				</option>
				<c:forEach items="${provinceList}" var="pl">
					<option value="${pl.provinceId}">
						${pl.provinceName}
					</option>
				</c:forEach>
			</select>
			<select name="city" id="cityId">
			</select>
		</form>
	</body>
</html>
