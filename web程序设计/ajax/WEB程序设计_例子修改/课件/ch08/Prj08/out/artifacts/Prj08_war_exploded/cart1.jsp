<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
<%
	ArrayList books = new ArrayList();
	//购物车中添加
	books.add("三国演义");
	books.add("西游记");
	books.add("水浒传");
%>
购物车中内容为：
<HR>
<%
	//显示购物车中的内容
	for (int i = 0; i < books.size(); i++) {
		String book = (String) books.get(i);
		out.println(book + "<BR>");
	}
%>
  </body>
</html>
