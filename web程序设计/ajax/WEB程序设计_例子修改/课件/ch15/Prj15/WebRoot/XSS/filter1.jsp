<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
<script type="text/javascript">
 function filter(strTemp) { 
   strTemp = strTemp.replace(/<|>/g,""); 
   return strTemp;
}
function send(){
	document.queryForm.flower.value = filter(document.queryForm.flower.value);
    document.queryForm.submit();
}
</script>
欢迎查询鲜花
<form name="queryForm" action="filter1.jsp" method="post">
	请您输入鲜花的信息：<BR>
	<input name="flower" type="text" size="50">
	<input type="button" value="查询" onClick="send()">	
</form>
<HR>
提交的鲜花：
<%
	String flower = request.getParameter("flower");
	if(flower!=null){
		out.println(flower);
	}
 %>
 </body>
</html>


