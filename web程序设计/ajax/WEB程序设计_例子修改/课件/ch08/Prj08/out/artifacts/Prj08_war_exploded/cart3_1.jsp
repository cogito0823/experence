<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
<%
	ArrayList books = new ArrayList();
	//向books中添加
	books.add("三国演义");
	books.add("西游记");
	books.add("水浒传");
	//将books放入session
	session.setAttribute("books",books);
%>
<a href=" cart3_2.jsp">查看购物车</a>
</body>
</html>
