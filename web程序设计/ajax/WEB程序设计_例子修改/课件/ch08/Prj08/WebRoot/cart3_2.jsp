<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
购物车中内容为：
<HR>
<%
	//从购物车中取出books
	ArrayList books = (ArrayList)session.getAttribute("books");
	//遍历books
	for(int i=0;i<books.size();i++){
		String book = (String)books.get(i);
		out.println(book + "<BR>");
	}
%>
</body>
</html>
