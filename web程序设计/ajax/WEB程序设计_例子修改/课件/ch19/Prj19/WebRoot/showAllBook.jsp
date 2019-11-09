<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="vo.Book"%>
<html>  
  <body>
  	欢迎选购图书<br>
    <%    	
    	HashMap allbook = (HashMap)session.getAttribute("allbook");
    %>
    <table border="1">
	<tr bgcolor="pink">
	<td>书本名称</td>
	<td>书本价格</td>
	<td>购买</td>
	</tr>
	<%
		Set set = allbook.keySet();
		Iterator ite = set.iterator();
		while(ite.hasNext()){
			String bookno = (String)ite.next();
			Book book = (Book)allbook.get(bookno);
	%>
		<tr bgcolor="yellow">
		<td><%=book.getBookname()%></td>
		<td><%=book.getBookprice()%></td>
		<td><a href="buyForm.jsp?bookno=<%=bookno%>">购买</a></td>
		</tr>	
	<%} %>	
	</table>
	<a href="showCart.jsp">查看购物车</a>	
  </body>
</html>
