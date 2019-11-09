<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <body>
<form action="sessionLost.jsp" method="post">
	请您输入书本：<input name="book" type="text">
	<input type="submit" value="添加到购物车">	
</form>
<HR>
<%
	//向session中放入一个集合对象
	ArrayList books = new ArrayList();
	session.setAttribute("books",books);
	//获得书名
	String book = request.getParameter("book");
	if(book!=null){
		book = new String(book.getBytes("ISO-8859-1"));
		//将book加进去
		books.add(book);
	}
%>
购物车中的内容是：<BR>
<%
	//遍历books
	for(int i=0;i<books.size();i++){
		out.println(books.get(i) + "<BR>");
	}
%>
</body>
</html>
