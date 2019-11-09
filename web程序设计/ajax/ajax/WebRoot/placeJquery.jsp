<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>JQUERY-省市</title>
		<script src="script/jquery-1.4.2.min.js" type="text/javascript"></script>
		<script type="text/javascript">
$(document).ready(function(){	
	var fillCities = function(){
							$.get("<%=basePath%>/listCity?provinceId="+$("#provinceId").val(),
							function(data){
								var d = eval("("+data+")");
								var str = '<option value="" selected="selected">==请选择城市==</option>';
								for(var i=0; i<d.length; i++){
									str = str + "<option value='" + d[i].cityId + "'>" +d[i].cityName + "</option>";
								}
								$("#cityId").empty().append(str);
								$("#cityId").val(${user.cityId});
							});
						};
	fillCities();
	$("#provinceId").change(fillCities);
});
</script>


	</head>

	<body>
		<h1> 
			JQUERY-省市 
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
