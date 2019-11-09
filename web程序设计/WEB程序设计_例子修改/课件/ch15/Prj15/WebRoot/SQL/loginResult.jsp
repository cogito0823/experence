<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<body>
<%
	//»ñÈ¡ÕËºÅÃÜÂë
	String account = request.getParameter("account");
	String password = request.getParameter("password");
	if(account!=null){
		//ÑéÖ¤ÕËºÅÃÜÂë
		String sql = "SELECT * FROM T_CUSTOMER WHERE ACCOUNT='" 
					+ account 
					+ "' AND PASSWORD='" 
					+ password 
					+ "'";
		out.println("Êý¾Ý¿âÖ´ÐÐÓï¾ä£º<BR>" + sql);
	} 
%>
</body>
</html>
