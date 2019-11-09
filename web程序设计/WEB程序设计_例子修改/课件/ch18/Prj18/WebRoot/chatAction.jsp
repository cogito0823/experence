<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="vo.Customer"%>
<html> 
  <body>  
  	<%
  		Customer customer = (Customer)session.getAttribute("customer");
  	%>
    <%
    	request.setCharacterEncoding("gb2312");
    	String msg = request.getParameter("msg");
    	ArrayList msgs = (ArrayList)application.getAttribute("msgs");
    	if(msg!=null && !msg.equals("")){
    		msgs.add(customer.getCname() + "˵:" + msg);    	
    		response.sendRedirect("chatForm.jsp");			
    	}
    %>  
  </body>
</html>
