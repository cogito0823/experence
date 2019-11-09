<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
购物车中内容为：
<HR>
<%
    ArrayList books = new ArrayList();
	//显示购物车中的内容
	for (int i = 0; i < books.size(); i++) {
		String book = (String) books.get(i);
		out.println(book + "<BR>");
	}
%>
</body>
</html>
