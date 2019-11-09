<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
<%
    //第一次访问，实例化count
	Integer count = (Integer)application.getAttribute("count");
	if(count==null){
		count = new Integer(0);
	}
	count++;	
	application.setAttribute("count",count);
%>
	您是该页面的第<%=count%>个访问者。
</body>
</html>
