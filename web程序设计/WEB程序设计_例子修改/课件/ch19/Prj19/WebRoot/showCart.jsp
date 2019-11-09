<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="vo.Book"%>
<html>  
  <body>
  <table border="1">
	<tr bgcolor="pink">
	<td>书本名称</td>
	<td>书本价格</td>
	<td>数量</td>
	<td>删除</td>
	</tr>
   <%
   		HashMap books = (HashMap)session.getAttribute("books");		
		Set set = books.keySet();
		Iterator ite = set.iterator();
		while(ite.hasNext()){
			String bookno = (String)ite.next();
			Book book = (Book)books.get(bookno);
	%>
	<tr bgcolor="yellow">
		<td><%=book.getBookname()%></td>
		<td><%=book.getBookprice()%></td>
		<td><%=book.getBooknumber()%></td>
		<td><a href="/servlet/RemoveServlet?bookno=<%=book.getBookno()%>">删除</a></td>
		</tr>
	<%
		}			
   %>
   </table>
   现金总额:<%=session.getAttribute("money")%><HR>
   <a href="showAllBook.jsp">继续买书</a>
  </body>
</html>
