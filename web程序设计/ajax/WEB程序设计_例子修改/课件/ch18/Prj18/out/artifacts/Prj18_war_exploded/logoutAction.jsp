<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="vo.Customer"%>
<html> 
  <body>
    <%
  		Customer customer = (Customer)session.getAttribute("customer");
  		ArrayList customers = (ArrayList)application.getAttribute("customers"); 
  		customers.remove(customer);
  		ArrayList msgs = (ArrayList)application.getAttribute("msgs");
  		msgs.add(customer.getCname() + "ÏÂÏßÀ²!");  
  		session.invalidate();
  		response.sendRedirect("loginForm.jsp");
  	%>
  </body>
</html>
