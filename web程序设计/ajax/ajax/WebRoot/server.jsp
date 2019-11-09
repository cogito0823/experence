<% response.setHeader("Cache-Control","no-cache");%> 
<% response.setHeader("Pragma","no-cache");%>
<% response.setDateHeader ("Expires",-1); %>
<%
    String[] str = new String[] {"Love", "Power", "Peace","Mercy","Healthy","Happy","Green","Red","Yellow"};
    int number = new java.util.Random().nextInt(str.length+1);
    response.getWriter().write(str[number]);
%>