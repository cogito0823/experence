<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="vo.Customer"%>
<html> 
  <body>
  	<%
  		response.setHeader("Refresh","10");  
  	 %>
  	<table width="80%"  border="0" align="center">
  	  <tr bgcolor="yellow" align="center">
  	  <td width="75%">消息</td>
  	  <td width="25%">当前在线</td>
  	  </tr>
      <tr bgcolor="pink">
        <td><%   	
    	ArrayList msgs = (ArrayList)application.getAttribute("msgs");
    	for(int i=msgs.size()-1;i>=0;i--){
    		out.println(msgs.get(i) + "<BR>");
    	}
    %></td>
        <td valign="top"><%    	
    	ArrayList customers = (ArrayList)application.getAttribute("customers");
    	for(int i=customers.size()-1;i>=0;i--){
    		Customer customer = (Customer)customers.get(i);
    		out.println(customer.getAccount() + "(" + customer.getCname() + ")" + "<BR>");
    	}
    %></td>
      </tr>
    </table>
  </body>
</html>
