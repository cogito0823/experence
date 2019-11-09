<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="vo.Book"%>
<html>  
  <body> 
    <%
		String bookno = request.getParameter("bookno");
    	HashMap allbook = (HashMap)session.getAttribute("allbook");
    	Book book = (Book)allbook.get(bookno);
    %>
    欢迎购买：<%=book.getBookname()%> 
    <form action="/servlet/AddServlet" method="post">
		书本价格:<%=book.getBookprice()%><BR>
		<input name="bookno" type="hidden" value="<%=book.getBookno()%>">
		<input name="bookname" type="hidden" 
value="<%=book.getBookname()%>">
		<input name="bookprice" type="hidden" 
value="<%=book.getBookprice()%>">
		数量:
<input name="booknumber">
		<input type="submit" value="购买">
    </form>    
  </body>
</html>
